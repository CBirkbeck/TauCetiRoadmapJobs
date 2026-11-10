# Review of ReductiveGroupsPartIII (pull request #2131 at a4abdea)

**Verdict:** needs changes

Six findings: two P2, four P3. The gate passes at this head (every check 0, targeted build OK) and
the dependency check reports `depcheck: 232 roadmaps, 2090 edges, 0 problem(s)`.

## R01 (P2) — The Serre-unit criterion and the density of Weil points are statable at the pins

**Location.** `TauCetiRoadmap/ReductiveGroupsPartIII/Suggested.lean` lines 49–51: "the topology on
the points of an affine group over a local field, by which prime-units are defined (relative
compactness of a cyclic subgroup); the pinned Tau Ceti has only the toric chart topology."

**Claim.** README §§3.6–3.7 (headlines of the Summary) cannot be stated because the pin has no
point topology.

**Witness.** The pin has it: `TauCeti.PointTopology.topology`
(`TauCeti/Topology/Algebra/PointTopology/Basic.lean:83`), on `WithConv (A →ₐ[k] R)` at line 110,
and `TauCeti.PointTopology.isTopologicalGroup` (`…/PointTopology/Group.lean:102`).
ReductiveGroupsPartII's README (line 452) already consumes `PointTopology.instTopologicalSpaceWithConv`.

**Repair.** State both headlines and delete the docstring bullet. The following elaborates at the
pins with `sorry` as the only warning (probe run with `lake env lean`; imports added:
`TauCeti.Algebra.AlgebraicGroup.Torus.Basic`, `TauCeti.Topology.Algebra.PointTopology.Group`;
`open scoped TauCeti.PointTopology`). With `H : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} ℚ` and
`γ : WithConv (H →ₐ[ℚ] ℚ)`:

```lean
def IsPrimeUnit (l : ℕ) (H) (γ) : Prop :=
  ∀ (v : ℕ) [Fact v.Prime], v ≠ l → IsCompact (closure (Set.range fun n : ℤ =>
    (toConv ((Algebra.ofId ℚ ℚ_[v]).comp (γ ^ n).ofConv) : WithConv (H →ₐ[ℚ] ℚ_[v]))))

def IsPrimeWeilNumber (l : ℕ) (w : ℤ) (α : ℂ) : Prop :=
  IsIntegral ℚ α ∧ (∀ β ∈ (minpoly ℚ α).aroots ℂ, ‖β‖ = (l : ℝ) ^ ((w : ℝ) / 2)) ∧
    ∃ n : ℕ, IsIntegral ℤ ((l : ℂ) ^ n * α) ∧ IsIntegral ℤ ((l : ℂ) ^ n * α⁻¹)

def IsPrimeWeilPoint (l : ℕ) (H) (γ) : Prop :=
  ∀ M : TauCeti.FGComoduleCat.{0, 0, 0} ℚ H,
    ∀ α ∈ (LinearMap.charpoly (TauCeti.Comodule.endOfPoint M γ.ofConv)).aroots ℂ,
      ∃ w : ℤ, IsPrimeWeilNumber l w α

def IsSerreTorus (H) : Prop :=
  ∃ J : TauCeti.HopfIdeal ℚ H.obj,
    TauCeti.splitTorusCommHopfAlgProperty ℚ (TauCeti.FiniteTypeCommHopfAlgCat.quotient H J) ∧
    Minimal (fun I : TauCeti.HopfIdeal ℝ (TauCeti.CommHopfAlgCat.baseChange (K := ℝ) H.obj) =>
        TauCeti.splitTorusCommHopfAlgProperty ℝ (TauCeti.FiniteTypeCommHopfAlgCat.quotient
          (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := ℝ) H) I))
      (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := ℝ) J)

theorem isPrimeWeilPoint_iff_isPrimeUnit (H) (hT : TauCeti.torusCommHopfAlgProperty ℚ H)
    (hS : IsSerreTorus H) (l : ℕ) [Fact l.Prime] (γ) :
    IsPrimeWeilPoint l H γ ↔ IsPrimeUnit l H γ := by sorry

theorem isPrimeWeilPoint_dense (H) (hT : TauCeti.torusCommHopfAlgProperty ℚ H)
    (hS : IsSerreTorus H) (l : ℕ) [Fact l.Prime]
    (hl : TauCeti.splitTorusCommHopfAlgProperty ℚ_[l]
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := ℚ_[l]) H))
    (f : H.obj) (hf : ∀ γ, IsPrimeWeilPoint l H γ → γ.ofConv f = 0) : f = 0 := by sorry
```

The neat form of §3.7 (a power `m > 0` with every `γ ^ m` neat and the `m`-th powers still
separating `H.obj`) elaborates the same way, with neatness written as "no nontrivial element of
finite order in `Subgroup.closure` of the `ℂˣ`-roots of the characteristic polynomials". Sanity
check proved in the probe: `IsPrimeWeilNumber 5 0 1`. Degenerate instances: trivial torus `H = ℚ`
(both sides of the iff hold for the identity); `G_m`, `γ = l` (`l`-unit: `lⁿ ∈ ℤ_v^×` for `v ≠ l`;
Weil of weight 2). Also add `TauCeti.PointTopology.topology` and `isTopologicalGroup` to the README's
"From Tau Ceti" contract and cite them in §3.2, and name the new declarations in §§3.1–3.7.

## R02 (P2) — §3.1 API bullet on `χ+cχ` lacks the Serre hypothesis

**Location.** `README.md` lines 959–960: "For every geometric character `χ`, the character `χ+cχ`
is defined over `ℚ` and factors through `T/T_c`."

**Claim.** Stated for every `ℚ`-torus; the neighbouring bullet says "Under the condition", this one
does not.

**Witness.** The norm-one torus of `ℚ(√3)/ℚ`, the roadmap's own failing example (lines 967–969):
`X^*=ℤ`, `c` acts by `+1`, `Γ_ℚ` by `−1`. For the generator `χ`, `χ+cχ=2χ` and `σ(2χ)=−2χ≠2χ`: not
defined over `ℚ`.

**Repair.** "Under the condition, for every geometric character `χ`, …". Tested: the `ℚ(√3)` torus is
now excluded; for the norm-one torus of `ℚ(i)`, `χ+cχ=0`, rational and trivial on `T_c=T`. §3.6
already uses the fact only under the condition.

## R03 (P3) — Narrative of earlier drafts in Scope and ownership

**Location.** `README.md` lines 117–122 ("The former build labels RG3.0, RG3.1, RG3.2, RG3.3 and
RG3.5 refer respectively to Layers 0, 1, 2, 3 and 5. …"); lines 61–63 ("These replace the separate
quotient and geometric classification targets"); lines 67–69 ("These replace separate
comparison-torsor and simultaneous-factorization targets").

**Claim.** An old → new label map and "replace" sentences are needed.

**Witness.** `roadmaps grep --fixed 'RG3.'` and `--fixed 'ReductiveGroupsPartIII'` return no line
outside this pull request, on main or at any of the 434 open heads: no roadmap cites these labels,
and this roadmap is new. The sentences only record what earlier drafts contained.

**Repair.** Delete lines 117–122 and the two "These replace …" sentences (keep the ownership
statements before them). Nothing else changes; the skipped numbers (0.2, 0.4, 5.2, 5.3) have no
outside citation, so they may be closed up or left.

## R04 (P3) — BunGAndNewtonStrata is named as a consumer but is earlier and does not cite this roadmap

**Location.** `README.md` lines 130–131: "belong to **BunGAndNewtonStrata**, which consumes Layer
2"; line 1731: "**BunGAndNewtonStrata** consumes the global elliptic tori of §2.3 for its basic
Newton strata."

**Witness.** The merge order lists BunGAndNewtonStrata at line 188 and ReductiveGroupsPartIII at
line 239. BunGAndNewtonStrata's README at its open head contains no mention of
ReductiveGroupsPartIII, Harder's lemma, or KMPS22 Lemma 1.2.2 / Proposition 1.2.5 (only (1.1.2.2),
lines 455 and 1777).

**Repair.** Line 130–131: end the sentence at "belong to **BunGAndNewtonStrata**." Delete the
sentence at line 1731, or replace it by "The non-emptiness of Newton strata (KMPS22 Proposition
1.2.5 and §1.3) consumes §§2.3 and 2.5", without naming an earlier roadmap as a consumer.

## R05 (P3) — Supplier contracts and layer Dependencies do not match the `*Needs:*` lines

**Location and witness.** (a) Contracts that no target consumes: AutomorphicBundles §1.1
`finiteTensorStabilizer` and MotivesAndAlgebraicCycles §6.8 (lines 303–308; cited only in Scope,
the contract, the Layer 5 Dependencies and one worked example); ShimuraVarieties §7.0i
`TauCeti.Shimura.abelian_absolute_hodge` (line 297; every target cites §7.0i.1);
AdelicAlgebraicGroups §4.1 (line 276; §2.5 and §4.4 cite EndoscopicTransferAndUnitaryTraceComparison
§1.9); ReductiveGroups Layer 8 (line 227); ReductiveGroupsPartII §RG2.1.1 (line 235).
(b) Dependencies that omit what a target of the layer needs: Layer 2 (lines 925–927) omits
ReductiveGroups §3A.5 (needed at line 794); Layer 4 (1394–1395) omits
EndoscopicTransferAndUnitaryTraceComparison §1.1 (line 1259); Layer 5 (1718–1722) omits
ReductiveGroupsPartII §RG2.2 (line 1459), ReductiveGroups Layers 4, 6 and 7 (lines 1461, 1577) and
EndoscopicTransferAndUnitaryTraceComparison §§1.1–1.2 and 1.5–1.6 (line 1625).

**Repair.** For (a), either name the consuming target in a `*Needs:*` line (§5.1 is the natural
place for §7.0i, AutomorphicBundles §1.1 and MotivesAndAlgebraicCycles §6.8 if its route uses them)
or delete the contract paragraph and the Layer 5 Dependencies entry. For (b), add the listed items
to the three Dependencies paragraphs.

## R06 (P3) — Two undefined references in Layer 5

**Location.** `README.md` line 1540: "the point `γ_v` for `τ` is carried to the point for `τ′`";
line 1493: "with `T_{ℚ_p}` of the prescribed `H(ℚ_p)`-conjugacy type".

**Witness.** `τ`, `τ′` occur nowhere else in Layer 5 (the layer fixes one embedding `E⊂ℂ`, line
1399). No conjugacy type is prescribed in §5.4; the source prescribes the centralizer of a maximal
`ℚ̆_p`-split torus (KZ25 line 2584).

**Repair.** Line 1540: "for a second embedding `E⊂ℂ`, with Mumford–Tate group `G′`, the inner-form
identification `Conj(G)≅Conj(G′)` of §1.4 carries `γ_v` to the corresponding point for `G′`". Line
1493: "with `T_{ℚ_p}` `H(ℚ_p)`-conjugate to the centralizer of a maximal `ℚ̆_p`-split torus of
`H_{ℚ_p}` (KZ25 §6.2.5)".

## Verified sound

**Gate and build.** Gate at a4abdea: all 26 checks 0, build OK. `lake env lean` on a scratch copy:
4 `sorry` warnings, nothing else. `#check @name` on all 5 declarations: the elaborated types equal
the README statements (§0.1 over a commutative ring; §0.5 `IsAlgClosed Ω`, both points semisimple;
§0.6 `H` arbitrary finite type, `G` reductive, `f` surjective; §1.2(a) finite exceptional set;
§2.2 finite and archimedean places as two finsets); no binder lost. One-tactic probe (`simp`,
`rfl`, `infer_instance`, `exact?`) on the 4 theorems: none closes. No padding. Nothing outside the
folder changes. No other roadmap's `Suggested.lean` declares `classFunctions` or any of the four
statements (searched by object).

**Pinned declarations opened (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b), 18.**
`HopfAlgebra.conjugationAlgHom` (`Hopf/Conjugation.lean:66`), `productMap_comp_conjugationAlgHom`
(:107), `tensorProduct_map_comp_conjugationAlgHom` (:118); `reductiveCommHopfAlgProperty`
(`Reductive/Basic.lean:71`: smooth, geometrically connected, no geometric normal smooth connected
unipotent subgroup); `FiniteTypeCommHopfAlgCat` (`FiniteType/CommHopfAlgCat.lean:68`);
`IsSemisimplePoint` (`SemisimplePoint/Basic.lean:81`, quantifies over all finitely generated
comodules); `Comodule.endOfPoint` (`PointsAction.lean:134`); `FGComoduleCat` (`Finite/Basic.lean:95`);
`HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`: `Minimal` among ideals with torus quotient,
torus meaning split after base change to an algebraic closure, `Torus/Basic.lean:105`, so a
geometric torus, not a split one); `exists_isMaximalTorus` (`Torus/Existence.lean:99`);
`IsMaximalTorus.conjugate` (`Torus/Conjugation.lean:50`); `HopfIdeal.conjugate`
(`HopfIdeal/Conjugation.lean:75`, by a rational point); `baseChangeHopfIdeal`
(`HopfIdeal/BaseChange.lean:116`); `CommHopfAlgCat.baseChange` (`CommHopfAlgCat/BaseChange.lean:70`);
`exists_finite_subcomodule_exteriorPower_line_stabilizer` (`ExteriorStabilizer/Character.lean:101`);
`NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, `infinite_frobeniusPrimeSet`,
`hasDirichletDensity_iff_of_finite_symmDiff_frobeniusPrimeSet` (`Density/Chebotarev.lean:51, 74, 83`);
`weakApproximation_denseRange` (`Approximation/Weak.lean:208`); Mathlib `AlgHom.equalizer`
(`Subalgebra/Basic.lean:1030`), `MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group`
(`GroupAction/Quotient.lean:267`). Not at the pins (searched by object): Jordan's covering lemma,
the degree-one descent of §1.2, class functions, neatness, Weil numbers.

**Cross-roadmap citations resolved, 38 sections in 17 roadmaps.** ArithmeticGaloisRepresentations
§1.11 (paragraph *Reductive quotients over fields and DVRs*, its lines 1437–1475: quotient,
semisimple classes, semisimple part, `GL_n`); IntegralHeckeAndGaloisDeterminants §0.7;
SchemeKTheoryOperations §6.3.1 (split connected reductive over a field, `ℤ[X]^W`, triangularity);
DeligneWeightsAndPurity §§0.1–0.2 (integrality is a separate predicate there, so negative weights
are consistent); AdelicAlgebraicGroups §§3.4, 4.1, 4.3 (`Neat.IsNeatAut`, the `√2` example agrees
with §3.5); EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.2, 1.3, 1.5, 1.6, 1.9(a)(c),
1.11(a)(b), 1.14(b)(d), 1.15, 3.3; ShimuraData §§1.2–1.4, 4.2–4.3; ShimuraVarieties §§P.5, 5.8,
7.0i, 7.0i.1; AutomorphicBundles §1.1; MotivesAndAlgebraicCycles §6.8;
AbelianSchemesAndArithmeticModuli §§A1.3a, A3.7, A3.9, A4.1, A5.1, A5.7, A6.11, A6.21;
NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0b; PELModuli §§M3.1–M3.2 (`hasseCases` (A));
ReductiveGroups (main) Layers 0–11C and §3A.5; ReductiveGroupsPartII (main) §§RG2.0.1, RG2.0.2,
RG2.0a.1–3, RG2.1.1, RG2.1.5, RG2.2, RG2.3.3 (*fixer-versus-parahoric* (5),
*compact-elements-in-hyperspecial-subgroups*), RG2.3.4, RG2.5.1; Chebotarev Layer 10;
GlobalNumberFields Layer 1; GroupSchemesOverABase §7.2; LanglandsParameterStacks §4.26.

**Ownership of the five targets that extend suppliers.** §2.0: the supplier's §1.2(b) identifies the
global-mod-local group but not the sum of local Tate–Nakayama maps. §4.3: its §1.6(ii) transfers
tori from an inner form only. §5.7a: its §1.15 states the case of a rational base point in `G`
("the case stated here is `G₀ = G`"). §2.1a: no statement in ReductiveGroupsPartII (the real case is
ShimuraVarieties §P.5, cited). §5.3a: ReductiveGroupsPartII lists `fixer_closedImmersion_of_rSmooth`
as outside its scope (its lines 94–99). No second owner found on main or at the open heads.

**Source sample (15 targets, all locators confirmed in the cache).**
0.3: Steinberg65 lines 599–624 (6.2–6.3 on printed p.62, 6.4 on p.63). 1.2: KZ25 lines 2433–2439.
1.5: KZ25 lines 2492–2527, 2593–2611. 2.0: Kottwitz86 line 491 (p.377); KMPS22 lines 601–606.
2.1a: Borovoi98 lines 1448–1451 (p.37); KMPS22 lines 625–629. 3.3: KMPS22 lines 1107–1109.
3.4: KMPS22 lines 1110–1118. 3.5: KMPS22 lines 1093–1094, 1317–1322. 3.6: KMPS22 lines 1129–1146.
3.7: KMPS22 lines 1301–1322. 4.1: KMPS22 lines 1332–1371. 4.4: LR87 lines 2907–2923; KZ25 lines
2664–2670; KMPS22 lines 1389–1391. 4.5: KMPS22 lines 1372–1393, 1095–1105, 1122–1123, 974–981.
5.4: KZ25 lines 2559–2582, 2583–2591, 2592–2618, 2627–2646. 5.7: KZ25 lines 2671–2673. Also read:
Kottwitz86 lines 706, 757–761; Kottwitz90 lines 6779–6803; Shin11 lines 696–727. The README flags no
locator as unverified.

**Adversarial table.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 0.1 class functions | `GL₂`, `x=diag(2,3)`, swap `g` | `(gxg⁻¹)₁₁=3`, `x₁₁=2`; trace `5=5` | `x₁₁` excluded, trace kept |
| 0.1 | cocommutative `H` | `c*(f)=1⊗f` for all `f` | whole algebra |
| 0.3 Chevalley | `SL₂→PGL₂`, `α=a²` | `α+α⁻¹=s²−2`; `s=±5/2 ↦ 17/4` | as stated; char 2 gives `s²` |
| 0.3 | any characteristic | simple characters unitriangular over orbit sums; `k⊗ℤ[X]^W=k[X]^W` | no char. hypothesis needed |
| 0.5 `isConj_iff_trace_eq` | `G_m`, `2` vs `1/2` | traces on `t`: `2≠1/2`; on `t⊕t⁻¹`: `5/2=5/2` | all comodules needed; statement true |
| 0.5 | unipotent `[[1,1],[0,1]]` vs `1` | equal traces everywhere, not conjugate | excluded by `hx`, `hy` |
| 0.5 | trivial group | `x=y=1`, both sides true | holds |
| 0.6 `finite_classFunctions_map` | `G_m→GL₂` | `C(G)=k[t^{±1}]` over `k[t+t⁻¹]`: rank 2 | finite, not injective |
| 0.6 | `G=1` | `q:C(H)→k` surjective | finite |
| 0.6 | `q` determined | `val` injective, so `hq` fixes `q` | no free data |
| 0.7 `Out′` | `SO(8)`, `Spin(8)`, `SO(6)`, `GL_n` | orders 2, 1, 1, 1 | as stated |
| 1.1 Jordan | `S₃`, `Q₈`, cyclic | `Σ fix ≥ (|Γ|−1)+n = |Γ|` forces `n=1`; stabilizer misses 3-cycles; `⟨i⟩` misses `±j` | holds; finiteness needed (`GL₂(ℂ)`, Borel) |
| 1.2(a) Lean | `K=ℚ(i)` | embeds only for `ℓ≡1 mod 4`: hypothesis fails for any finite `S` | consistent |
| 1.2 check | `(x²−2)(x²−17)(x²−34)` | `17≡1 mod 8`; `6²=36≡2 mod 17`; symbols multiply to 1 | local points everywhere, none global |
| 1.5 diagonal injection | trivial `ν` | fibre product `=H′×ker Δ=H′` | as stated |
| 1.5 | `ν=t²`, `F` quadratic | `{x²=y²}≅G_m×μ₂` | disconnected; identity component used |
| 1.6 central product | `SL₂`, `T=G_m` | `(h′xh′⁻¹,1)=(yz,z⁻¹) ⇒ z=1`; `s↦(s,1)` | injective |
| 2.0 localization | norm-one torus of `ℚ(i)` | invariants `1+1=0` at `{∞,3}`; `1≠0` at `{∞}` | lifts / does not lift |
| 2.1a openness | `GL₂`, `X=diag(1,2)` | `[E₁₂,X]=E₁₂`, `[E₂₁,X]=−E₂₁` | factors `1,−1`; `0` at scalars |
| 2.2 Harder (Lean) | `S=S′=∅` | reduces to `exists_isMaximalTorus` | consistent |
| 2.2 | torus notion | `IsMaximalTorus` is geometric, `Minimal` over `F`-ideals | matches "maximal `F`-torus" |
| 2.4 Weyl cocycle | `n=diag(i,−i)` | `c(n)=n⁻¹`, `n⁻¹c(n)=n⁻²=−1`; `a·c(a)=1` | nontrivial class |
| 2.4 | `n↦nt` | `t⁻¹·a·c(t)` | class independent of `n` |
| 2.5 twist | route | `c(u)=c(g)c(t)⁻¹c(n)⁻¹=gt⁻¹n⁻¹=u`; `Int(g)μ=Int(u)(wμ)` | consistent with the `g⁻¹σ(g)` convention |
| 3.1 Serre condition | `ℚ(√3)`, `ℚ(i)` norm tori, CM `Res` | ranks `(0,1)`, `(0,0)`, `(1,d)` | fail, hold, fail for `d>1` |
| 3.1 API | `ℚ(√3)` torus | `χ+cχ=2χ`, `σ(2χ)=−2χ` | R02 |
| 3.2 units | `a,b` unipotent with `1/q` | `tr(ab)=2+1/q²` | `ab` not an `l`-unit |
| 3.3 Weil numbers | `(2+i)/(2−i)`, `2+√3`, `q≠l` | `|·|=1`, norm `5/5`; `2±√3`; `v_q(q)=1` | yes, no, no |
| 3.5 neat | `γ∈T(ℚ)`, `m=#μ(L)` | values in `L^×`; `A^m` torsion free | `γ^m` neat |
| 3.6 Serre units | `G_m`; `2+√3` | `±lⁿ` weight `2n`; `|2±√3|` unequal | iff holds; Serre needed |
| 3.6 | weight independent of `σ` | `σχ+cσχ=2χ₊` under the condition | route sound |
| 3.7 density | `l` inert, imaginary quadratic | `v(x)+v(x̄)=0`, `v(x)=v(x̄)` ⇒ unit ⇒ root of unity | finite; splitting needed |
| 3.8 rigidity | `k[ε]/(ε²)`, `ε↦2ε` | fixes the point, not the identity | reducedness needed |
| 4.1 conjugacy | `SO(8)`, improper `s` | sign change of one coordinate ∉ `W(D₄)` | `Aut′` sharp |
| 4.2 Galois invariance | `ℚ(∛2)` at 5, 7 | `X³−2≡(X−3)(X²+3X+4)`, disc `3` nonsquare; cubes mod 7 are `{1,6}` | one fixed point; none |
| 4.4 transfer | anisotropic place | `N_v=0` on `X_*(T*_sc)`, so `ξ_v` onto `ker N/IX` | obstruction vanishes |
| 4.5 rational tori | route | rank `I` = rank `G`; `i_∞(T)` maximal; (d) ⇒ anisotropic mod centre | hypotheses suffice |
| 4.6 Hasse | `d=3` real place; Shin's count | `({±1}³)/±1`: 4; order 2 iff `2∣d` or all `nᵢ` even | consistent |
| 5.1 conventions | `GL₂`, `z=2` | `h(2)=(1/4)·2·id=(1/2)id`, `ν=1/4`; `ν(w_s(z))=z²` | cohomological weight |
| 5.4 connectedness | `ker ν|_G` | `w_s(z)x`, `z²=1`, `w_s(−1)=h(−1)∈Hdg` | `ker ν=Hdg`, `H` connected |
| 5.5 common class | fibre over `δ` | one geometric point ⇒ reduced fibre `Spec ℚ` | unique `γ_v`; injectivity needed (`2`, `1/2`) |
| 5.6 real representative | `G_m`, `ν=t²` | `x²=r²`, `|x|=r` ⇒ `x=±r`; `χ(c(t₀))=χ(t₀)` | real |
| 5.7 elliptic Frobenius | geometric Frobenius | `χ_ℓ⁻¹(Fr)=q`, eigenvalues `√q`, `r=√q` | §5.6 applies |
| 5.8 one auxiliary prime | `GL_n`; `SL₂` | `𝔎=1`; invariants `(−1)(−1)=1`, single `−1` | none needed; one change cancels |

## Not verifiable

- Noot09 (§1.5, Theorem 2.4, Lemmas 2.5–2.6, §3) and Kottwitz82 (Corollary 2.2): settled as waived;
  cited by locator, text not read. Kottwitz82 Corollary 2.2 is confirmed only as KMPS22 quotes it
  (KMPS22 line 1386).
- The Bruhat–Tits content of §5.3a and §5.4 (fixer intersection, very special points, torsion
  freeness of `X_*(H_ab)_I`) was checked for internal consistency and on the examples of the
  Checks only; KZ25 asserts the conclusion without proof (KZ25 line 2580) and no source with the
  details was read.
- §4.6 for a general CM field: KMPS22 Remark 2.3.16(1) asserts it; Shin11 proves the case
  `F=F⁺E`. The general parity calculation was tested on degree-3 and degree-5 Galois types, not
  proved.
- Deligne82 locators (not in the sample) were not opened.

## Source issues

- **Error** in KMPS22 at §2.2.3, p.25: the source says an `l`-unit has bounded powers at every place not dividing `l`, which includes the real place; it should be every finite place not dividing `l`, since `l` itself is unbounded in `ℝ^×`; affects a stated result.
- **Error** in KMPS22 at Lemma 2.2.11, p.29: the source says the rigidity statement holds for every irreducible scheme of finite type; it should also assume the scheme reduced and separated (dual numbers and the doubled line are counterexamples); affects a stated result.
- **Error** in KMPS22 at proof of Proposition 2.2.13, p.29: the source says the connected centralizer of a semisimple element is a Levi subgroup; it should be a connected reductive subgroup of maximal rank (for `Sp₄` it can be `SL₂×SL₂`); affects the proof.
- **Misprint** in KZ25 at proof of Lemma 6.2.6(2), p.58: the source says the conjugate of `g` by `h` equals `g`, then conjugates in the opposite direction in one factor; it should be `g′` with one orientation throughout; affects nothing.
- **Misprint** in KZ25 at §6.1.1, p.55: the source says the Betti cohomology `H¹` has Hodge types `(0,−1),(−1,0)`; it should be `(1,0),(0,1)`, the stated types being those of `H₁`; affects nothing.
