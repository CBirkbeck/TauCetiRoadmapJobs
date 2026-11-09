# Review of QuantumGroups (pull request #1649 at b3b2d26)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuantumGroups/` at `b3b2d26`. Since `9b3ff6c` only `README.md` changed (183 lines); `Suggested.lean` is byte-identical. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with four `sorry` warnings and nothing else.

Two findings remain, both P3:
- **R01:** the conflict with #1705 still has no stated order, and the description still describes an earlier head (carried).
- **R02:** three Layer 8 sentences still ask for, or list as remaining targets, results the pinned Tau Ceti proves.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

## Previous findings (review at 9b3ff6c)

| Previous finding | Passage at this head | Status |
| --- | --- | --- |
| R01 (P2) Layer 0 has second owners | `:29–51`: "Layer 0 … is the single home of the following objects … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras 1.3 and 2.1 come later in the build and consume these objects from §§0.1–0.2"; "§0.1 states only the instances" is gone; `:1702–1706` lists both as downstream consumers | repaired in this folder (see the ownership note under Verified sound) |
| R02 (P3) #1705 conflict, stale description | description still opens "Current head `d7a6c540…`" and does not mention #1705 | not repaired; carried as R01 |
| R03 (P3) §4.3 ↔ §6.3 cycle | `:933` §4.3 *Needs:* no longer names §6.3; `:916–918` "Section 6.3 later compares this…"; `:1149` §6.3 *Needs:* adds "§4.2 … and §4.3 for A_u=A_r=C(G)"; `:941`, `:1157` agree | repaired |
| R04 (P3) Layer 8 results proved at the pin | `:1384–1389`, `:1413–1417`, `:1424–1438` now cite the pinned declarations; `:1285` "in this layer" | repaired for §§8.1–8.3; three residues in §§8.3–8.5 are R02 |
| R05 (P3) locator slips | `:980` "pp.13–14"; Timmermann Proposition 2.2.4 now only in the Timmermann bullet (`:1714–1717`), no page range | repaired |

## R01 (P3) — The conflict with #1705 has no stated order, and the description describes an earlier head

Carried from the previous two reviews. No repair report marks it not actionable.

**Location:** this pull request's description (data): "Current head `d7a6c540…`"; "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged"; its dependency block names only #860.

**Claim:** two open pull requests change this roadmap and their heads conflict, so one is rebased on the other and the description says which. Neither is stated. The description is also false for this head: the README differs from main throughout, and `Suggested.lean` has six declarations.

**Witness:** `roadmaps overlaps QuantumGroups`: "#1649 and #1705 conflict in `README.md`, `Suggested.lean`". #1705 is at `96014ab` and numbers the same Layer 0 objects §§0.2–0.3, where this head numbers them §§0.1–0.2.

**Repair (pull-request text, no folder edit):**
- Rewrite the description for `b3b2d26`: §1.1 ClassicalMultipliers; Layer 0 as the single home of the C*-category and Temperley–Lieb comparison objects; Layer 8 on the native `TauCeti.UqSl2`; the six-declaration `Suggested.lean`.
- State which of #1649 and #1705 is rebased on the other. The second one keeps one numbering of Layer 0, so that CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras can cite it.

## R02 (P3) — Three Layer 8 statements are still written as work although the pin proves them

**Location:**
- `:75` (Scope): "the diagonalizability of K and the Hom and endomorphism formulas … remain targets"; `:1441–1442`: "Derive that K is diagonalizable on every finite-dimensional module".
- `:1482–1483`: "Exhibit the one-dimensional L_0^- (K=−1,E=F=0): it is locally finite and locally nilpotent but not type 1."
- `:1525–1526`: "Build tensor intertwiners, associator/unitors and the monoidal forgetful comparison."

**Claim:** each sentence asks for something the pinned Tau Ceti has, against `:71–72` ("Layer 8's prose is the specification those files implement and names their declarations"). The first is also a false "remains a target" in Scope.

**Witness (Tau Ceti `2fd255d`):**
- A scratch `example` proves `IsSignedTypeOne q V` for finite-dimensional `V` as `((isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule hq).mpr inferInstance).1`; it elaborates.
- `QuantumGroups/UqSl2/TypeOne.lean:253` `LadderModule.not_isTypeOne`.
- `Algebra/Category/FiniteHopfModuleCat/Monoidal.lean:220`, `:224`.

**Repair:**
- `:75`: delete "the diagonalizability of K and". `:1441–1442`: write "K is diagonalizable on every finite-dimensional module, the finite-dimensional case of §8.4's `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule` through the instance `TauCeti.IsLocallyFiniteModule.of_finite`. Derive that dim Hom_U(V,W)=…".
- `:1482–1483`: write "The one-dimensional L_0^- (K=−1,E=F=0) is locally finite and locally nilpotent but not type 1: `TauCeti.UqSl2.LadderModule.not_isTypeOne` proves this for every L_m^-."
- `:1525–1526`: write "Its tensor intertwiners, associator and unitors are those of `TauCeti.FiniteHopfModuleCat.instMonoidalCategory`, and `forgetToModule` is monoidal by the instance of `Algebra/Category/FiniteHopfModuleCat/Monoidal.lean`."

The repaired sentences were tested on the same instance: the scratch file elaborates the `example`, `#check @TauCeti.UqSl2.LadderModule.not_isTypeOne`, `#check @TauCeti.FiniteHopfModuleCat.instMonoidalCategory` and finds the instance `(forgetToModule k H).Monoidal`.

## Verified sound

**Gate.** Rerun on this head: every scanner 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The branch manifest pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the same as main.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 235 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every supplier named in a *Needs:* line, the supplier table or a Dependencies paragraph is on main. CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras are named only as later consumers and as owners of what is left to them; nothing is imported from either.

**Ownership note (Layer 0).** This head states the single-owner form the ownership rule requires of a roadmap on main: main's README cites CategoricalOperatorAlgebras CA1a, CA2a and TemperleyLiebOperatorAlgebras as suppliers (its supplier table), which an on-main roadmap may not do, so the objects move down into §§0.1–0.2. The two open roadmaps have not yet followed: `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md:40–46`, `:2303` (#888 at `3375f9e`) and `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md:72–76` (#867 at `ba43cc7`) still say "single home here". No edit of this folder can change that; the repair is theirs (cite QuantumGroups §§0.1–0.2), and it needs the one numbering asked for in R01. The ids this head cites exist at those heads: CA1a (`:258`), CA2a (`:424`), 1.3 (`:477`), 2.1 (`:1152`), Layer 3 (`:1269`).

**Elaboration and signatures.** `lake env lean` on `Suggested.lean`: exit 0, four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`). `#check @name` on all six declarations in one scratch file gives the types of `scratch/signatures.md`. The flagged `[StarModule ℂ A]` is absent from `AlgebraicHaar`, whose fields do not use it; the four theorems carry `StarModule` and `TauCeti.StarCoalgebra` explicitly, and `compactType_iff` has `[Nontrivial A]`. Nothing changed.

**Padding probe.** `simp`, `rfl`, `infer_instance`, `trivial` on each of the four theorems in scratch copies: 16 failures (`simp made no progress`, `rfl failed`, `type class instance expected`, `assumption failed`). `AlgebraicHaar` and `unitaryCoefficientSet` are the two definitions the headlines need. No padding.

**Headlines.** Stated: weighted Schur orthogonality (§3.1), compact type (§4.1), the modular automorphism and the Kac equivalence (§4.1). Not statable and named in the docstring with the missing carrier: Layers 0–2, the analytic parts of Layers 3–4, Layers 5–7 (no C*-tensor product, analytic compact quantum group or rigid C*-tensor category at either pin), the Biedenharn–Elliott pentagon and §8.6. The rest of Layer 8 is proved at the pin and not restated. Every Lean name appears in the README (`:594–595`, `:781–782`, `:816`, `:820`).

**Seeded sample, locators read in the cached texts:**

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 1.1 | Kustermans–Vaes Def. 2.1, p.853 | `kustermansvaes` lines 739–746 | bi-C*-algebra: nondegenerate Δ into M(A⊗A), coassociative. Correct |
| 1.2, 2.1, 2.2, 3.1–3.4 | Timmermann | — | uncertified (Not verifiable); cross-checked against `nt` line 218 (Thm 1.2.1 Haar), 297 and 659 (unitarization, decomposition), 941–963 (f_z: `f_0=ε`, `f̄_z=f_(−z̄)`, `f_z*f_w=f_(z+w)`, multiplicative), 977–978 (Thm 1.7.3), 1034–1040 (`S²=τ_(−i)`, Prop 1.7.7) |
| 4.2, 4.3 | Bédos–Murphy–Tuset Thms 2.2, 2.8, 3.6, Cor 2.9, pp.6, 10–11, 18–19 | `bmt` lines 257–258 (p.6), 461 (p.10), 478–483 (p.11), 858–865 (pp.18–19) | co-amenable ⇔ faithful Haar and bounded counit; ⇔ nonzero character on A_r; ⇔ A_u→A_r isomorphism ⇔ h_u faithful. Correct |
| 5.1 | Bédos–Murphy–Tuset §2, pp.13–14 | `bmt` lines 592–605 | SUq(2), `0<|q|<1`, `U=[[α,−qγ*],[γ,α*]]`. Correct |
| 7.1 | Bédos–Murphy–Tuset Thm 2.12, Cor 2.13, pp.13–14 | `bmt` lines 614–646 | `T_k=U_k*D_k`, `D_k−1` compact, state with value 1 on α. Correct; the Haar series there lacks its weight (Source issues), the README's formula has it |
| 8.4 | Virelizier §3.2 | `virelizier` lines 529–537 | type 1 = direct sum of K-eigenspaces of eigenvalue q^n. Correct |
| 8.6 | Virelizier §2.3, Prop 2.4, p.8 | `virelizier` lines 348–359 | `ΔE=K⊗E+E⊗1`, `ΔF=1⊗F+F⊗K⁻¹`, `S(E)=−K⁻¹E`, `S(F)=−FK`, `S²=K⁻¹·K`. Correct |
| 8.7 (and 8.2, 8.3, 8.5) | Virelizier Ex. 3.3 p.11; Prop 3.7, Cor 3.8 p.12; Thm 3.13, Cor 3.14 p.13; Lemma 2.3 p.6, Prop 4.1 p.13 | `virelizier` lines 552–555, 585–594, 625–636, 265–267, 644–651 | Ex. 3.3's E coefficient equals `[n−i+1][i]`, so rescaling by `[i]!` gives the README ladder. Correct |

No locator in the README is flagged as unverified.

**Adversarial pass** (q = 1/2 unless stated; `F̃=F=diag(2,1/2)` on `u=[[a,−qc*],[c,a*]]`):

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `schur_orthogonality` | SUq(2); general derivation; 1-dim character; ι=∅ | invariance gives `u*Nu=N` so `h(u_ij*u_kl)=δ_jl c_ik`, then `ū c ū*=c`, `Σ_i c_ii=1`, so `c=F̃⁻¹/Tr`. Values: `h(a*a)=1/5=(1/2)/(5/2)`, `h(c*c)=4/5=2/(5/2)`, `h(aa*)=4/5=F̃₁₁/Tr`. Character: Ft=1; Ft=2 fails `2≠1/2`. ι=∅ excluded by `IsSimpleOrder` | pass | none |
| 2 | `compactType_iff` | zero ring; ℂ[x], x primitive; ℂ[ℤ] with u*=u | zero ring: LHS false (`h(1)=0≠1`), RHS true, excluded by `[Nontrivial A]`. ℂ[x]: `(id⊗h)Δx=x+h(x)≠h(x)`; unitary `exp(xN)` forces N skew and nilpotent, N=0: both false. ℂ[ℤ]: `h((u−u⁻¹)²)=−2<0`; unitary coefficients only of weight 0: both false | pass | none |
| 3 | `haar_modular_automorphism` | SUq(2); inverse; ℂ[C₂] with u↦−u | `θ(a)=4a`: `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives 1/20. ℂ[C₂]: `h(u·u)=1`, `h(u·(−u))=−1`, only θ=id | pass | none |
| 4 | `haar_trace_iff_antipode_involutive` | SUq(2); ℂ[S₃] | `4/5≠1/5` and `S²(c)=c/4≠c`: both false. ℂ[S₃]: `δ_(gk,e)=δ_(kg,e)`, `S²=id`: both true, on a noncommutative algebra | pass | none |
| 5 | `unitaryCoefficientSet` | n=0; grouplike u | n=0 contributes nothing; `u*u=1` puts a unitary grouplike in the set | pass | none |
| 6 | §1.1 | S₃; ℤ; trivial group | (12)(23)=(123): `Δf(g,h)=1`, `Δf(h,g)=f((132))=0`. ℤ: `d(1[1]⊗1[−1])=0`, `r₊=1[1]`, `r₋=1[−1]`; `Δ1[0](N,−N)=1` not C₀. `r₊Δf(g)=f(gg⁻¹)=ε(f)` | pass | none |
| 7 | §1.2 | C(C₂); monoid {1,0}; ℤ | `h(1[e])=1/2` vs evaluation 1; span `{δ₁⊗δ₁, δ₁⊗δ₀, δ₀⊗1}` of dim 3<4; `W(λ_s⊗1)W*(δ_g⊗δ_h)=δ_(sg)⊗δ_(sh)`, so (1,2)↦(2,3) | pass | none |
| 8 | §2.1 | S₃ permutation; C₂ sign | `u₁₃(gh)=[1=gh(3)]=1`, `u₁₃(hg)=0`; tensor square 1 vs −2 | pass | none |
| 9 | §2.2 | `U=[[1,2],[0,−1]]`; U=0 | `U*U=[[1,2],[2,5]]`, `T=[[1,1],[1,3]]`, det 2; U=0 gives T=0 | pass | none |
| 10 | §3.1 `ū*F̃ū=F̃` | SUq(2) | (1,1): `2aa*+½cc*=2`; (2,2): `½c*c+½a*a=½`; (1,2): `−ac+½ca=0`; `S²(c)`: `(FuF⁻¹)₂₁=c/4=q²c` | pass | none |
| 11 | §3.2 | SUq(2); Vandermonde | `f_z(a)=2^z`; `(f_1*u*f_1)=FuF`, `θ(a)=4a`; `‖a+c‖²=1/5+4/5`; `det[[1,1],[1,4]]=3` | pass | none |
| 12 | §3.3 | SUq(2) | `tr(F·diag(1,0))=2`, `tr(F⁻¹·diag(1,0))=1/2`, `Tr F=Tr F⁻¹=5/2>2` | pass | none |
| 13 | §3.4 | SUq(2) | `σ_t(a)=4^(it)a`, `σ_t(c)=2^(−it)2^(it)c=c`; `f_(−1)*u*f_1=FuF⁻¹`, `τ_(−i)(c)=c/4=S²(c)`; inverse convention 1/20 | pass | none |
| 14 | §4.2 | ℤ; C₂ | `U(δ_g⊗δ_h)=δ_g⊗δ_(gh)`; pentagon words on (1,2,3): (1,3,6) both; `U(x⊗1)(a⊗b)=Δ(x)U(a⊗b)`; `‖1+u‖=2`, Haar norm √2 | pass | none |
| 15 | §4.3 | ℤ; F₂ | Følner ratio `2/(2N+1)`; `2√3<4=ε(Σ)` | pass | none |
| 16 | §5.1 | general q; q=1/2 | `u*u=I` ⇔ `a*a+c*c=1`, `c*a*=qa*c*`, `q²cc*+aa*=1`; `uu*=I` ⇔ `aa*+q²c*c=1`, `ac*=qc*a`, `cc*+a*a=1`; `S(c)=−c/2`, `S(c*)=−2c*`; a=0,c=1 gives 1/4≠1 | pass | none |
| 17 | §7.1 | q=1/2; q=±1; q=−1 model | `(3/4)/(1−1/16)=4/5`, `(3/4)/(1−1/64)=16/21`; endpoints 1/2, 1/3; `σ₃σ₁=−σ₁σ₃` gives `ac=−ca`; a state with `τ(a)=1` has `τ(a*a)=1`, `τ(c*c)=0`; `(5/2)²=1+21/4` | pass | none |
| 18 | §8.3 | L₀,₁,₂^±; L₂ ⊃ L₀? | Casimir `10/9, 17/9, 65/18` and negatives; multiplicity of L₀ in L₂: `coeff(1)−coeff(q²)=1−1=0`; K diagonalizable follows from §8.4 (scratch `example`) | pass, cite | R02 |
| 19 | §8.4 | L₀⁻; Verma weight 1; zero module; ⊕L₀⁺ | K=−1 is no q^n; Verma weights 4^j, F^j v₀≠0; zero module: all three sides hold; cyclic dimension 1, total infinite | pass, cite | R02 |
| 20 | §8.5 | m=n=j=1; r=2 | `α₁=−q[1]/[1]=−1/2`; `(E⊗1+K⊗E)²` middle term `1+q²=q[2]=5/4`; `tr K⁻¹` on L_m^ε is `ε[m+1]`: 5/2, −1 | pass, cite | R02 |
| 21 | §8.6 | m=1 | `⟨Ev₁,v₀⟩=1=q⁻¹h₁`, so `h₁=1/2`; orthonormal entries `√2=q^(−1/2)`, `1/√2=q^(1/2)`; `ΔE` and `ΔF` kill `v₀⊗v₁−qv₁⊗v₀`; `δ(e₀⊗e₁−qe₁⊗e₀)` has coefficients `0, 1, −q, 0` | pass | none |
| 22 | §8.7 | v=1, m=2; Ex. 3.3 | `[E,F]=diag(2,0,−2)`; `[2]_v→2` vs totalized 0; source coefficient `q^(1−i)q^i/q·[n−i+1][i]` | pass | none |
| 23 | Build order | §4.3, §6.3 | edges now §6.3→§4.2, §6.3→§4.3 only (`:933`, `:1149`) | pass | none |

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`):
- All 94 backticked `TauCeti.*` names of the README exist (declaration grep). The 27 names added since `9b3ff6c` were opened and compared with the sentence citing them, among them: `UqSl2/OreTower.lean:71`, `:107`, `:162` (`sigmaF`, `sigmaE`, `deltaE`); `Hopf.lean:150` `antipodeOp`, `:180` `comul_e` (`E⊗1+K⊗E`), `:184` `comul_f`; `Weights.lean:90`, `:100`, `:157`; `Verma/Submodule.lean:85`, `:155`, `:301`; `LadderModule/Basic.lean:407`, `:583`, `:616`; `Casimir/Basic.lean:260`, `:284`; `Commutator.lean:47` `e_mul_f_pow` (hypothesis `q−q⁻¹≠0`, as stated); `CompleteReducibility.lean:165` (r≤m), `:177`, `:193`, `:228`; `Character.lean:241` (coefficient at εq^m minus at εq^(m+2)); `ClebschGordan/Basic.lean:76` (the stated recurrence), `:142` (j≤m), `:212`; `FiniteHopfModuleCat/Basic.lean:107`, `:118`, `:134`.
- §8.4: `TypeOne.lean:349`, `:359`, `:370` and `LocallyFinite.lean:63`, `:104`, `:115` state exactly the equivalences of `:1462–1481`.
- Mathlib `IsSemisimpleModule.extension_property` and `lifting_property` (`RingTheory/SimpleModule/Basic.lean:255`, `:261`).
- `Algebra/Category/FiniteHopfModuleCat/Pivotal.lean` has no `PivotalCategory` instance, so the bundled pivotal structure of §8.5 is a real target.

**Cross-roadmap citations.** `roadmaps resolve`: none unresolved. Reopened on main (`3090489`): CStarAlgebras `C1.CommutativeMultiplierMorphisms` (`:497`), C5.2 (`:1143`); RepresentationTheory/CompactGroups coefficient convention `π_ij(g)=⟪π g e_j,e_i⟫` (`:283`), the conjugate of this roadmap's, as §1.2 says; OperatorAlgebraDynamics Reiter (`:258`); FreeProbability `2sqrt3` versus 4 (`:307`); AmenableGroups Layers 1, 5, 7 (`:98`, `:289`, `:415`); Subfactors pullback criterion (`:862`); LieHighestWeight sl₂ worked example (`:1536`). The other citations are unchanged since the previous review, which resolved each.

**Duplication and overlaps.** `roadmaps grep` over all open heads for `C₀(X×Y)`, compact quantum group, coamenability, Woronowicz, Tannaka–Krein: owners only in QuantumGroups (main, #1649, #1705). No other roadmap declares a `TauCetiRoadmap.QuantumGroups.*` name. `scratch/overlaps.md`: no dropped id either way, no id defined only by an open revision; the only item is #1705 (R01). `scratch/library-matches.md`: no pinned declaration states any of the four theorems.

**Shape.** Every subsection has an API list and at least three Checks; every layer ends with Examples and Dependencies, and the changed Dependencies paragraphs (`:941`, `:1157`) match their *Needs:* lines. No LaTeX, `lemma`, `set_option`, pull-request number or process word.

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), recorded `uncertified`: the locators of §§1.2, 2.1, 2.2, 2.3, 3.1–3.4, 4.1, 5.1, 7.1 and 8.6 are cited by locator only. Their mathematics was recomputed (rows 1–17, 21) and cross-checked against `nt` as listed in the sample table.

## Source issues

- **Misprint** in bmt at the proof of Theorem 2.12, printed p.13: the source says the Haar state is `(1−q²)` times the unweighted sum of the diagonal coefficients at the vectors e_(n,0); it should carry the weight `q^(2n)` in each term, since the unweighted sum diverges at the unit; affects nothing.
- **Misprint** in banica at Theorem 1, printed p.2: the source says the fusion theorem holds for every n ∈ ℕ; it should require n ≥ 2, as the abstract does, since at n=1 the algebra is `C*(ℤ/2)` with two irreducibles; affects nothing.
