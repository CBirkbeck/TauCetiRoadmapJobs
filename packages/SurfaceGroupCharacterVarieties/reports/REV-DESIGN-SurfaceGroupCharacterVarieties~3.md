# Review of SurfaceGroupCharacterVarieties (design, round 3)

**Verdict:** needs changes

Three blocking findings (P2) and three notes (P3). Both round-2 findings are repaired. The blocking
findings are not about the repairs: the supplier TeichmullerGeometry, at the head of its open pull
request (#1169, index of 2026-11-10), now owns the outer automorphism group of an arbitrary group,
the topological mapping class group of a space and the topological Dehn–Nielsen–Baer isomorphism,
which Layers 1–3 of this design also own (R01, R02); and §7.1 lost the finite-generation hypothesis
that `design/plan.json` carries (R03). No `Suggested.lean` exists at the design stage; elaboration
is not available (this lane does not elaborate).

## R01 (P2) — §1.1 `Out(Γ)` is owned by TeichmullerGeometry §4.2 (`OuterAut`)

Location: `packages/SurfaceGroupCharacterVarieties/design/README.md` lines 26–27 (Scope: "the outer
automorphism group `Out(Γ) = Aut(Γ)/Inn(Γ)` as an abstract group, its comparison with Tau Ceti's
`TauCeti.ContinuousOut`") and §1.1, lines 370–402; `design/plan.json` target 1.1.

Claim: this roadmap owns `Out(Γ)` for an arbitrary group, the normality of `Inn(Γ)` and the
comparison with `TauCeti.ContinuousOut` for the discrete topology.

Witness: pull request #1169, `TauCetiRoadmap/TeichmullerGeometry/README.md` line 520 (§4.2):
`OuterAut G` is `MulAut G` modulo the range of `MulAut.conj`, for every group, with `innerAut_normal`,
the `TauCeti.ContinuousOut` comparison and Checks `1`, `S₃`, `ℤ`, `ℤ²`, `Q₈` (`24/4 = 6`).

Repair: delete from §1.1 the definition, the normality proof, the `TauCeti.ContinuousOut` comparison,
the first, third and fifth API bullets and the three Checks; in the Conventions write "`Out(Γ)` is
TeichmullerGeometry §4.2's `OuterAut Γ`"; move the Scope clause to the TeichmullerGeometry deferral
bullet and add `OuterAut`, `innerAut_normal` to the TeichmullerGeometry contract. Keep §1.1 as a
theorem section for what §4.2 lacks: `Inn(Γ) ≃* Γ ⧸ Z(Γ)`, and the isomorphism `Out(Γ) ≃* Out(Γ')`
induced by `e : Γ ≃* Γ'`, functorial, trivial for inner `e`. Replace "§1.1" by "§1.1;
TeichmullerGeometry §4.2" in the *Needs:* lines of §§1.3, 3.3; change `plan.json` 1.1 to kind
`theorem` with prerequisite TeichmullerGeometry §4.2. Tested on the duplicated instance: `Q₈` has
`|MulAut| = 24`, `|Inn| = 4`, quotient `6` in both texts, and `Out(ℤ²) = GL₂(ℤ)` in both, so every
later use (§§1.3, 3.3–3.5, 7.4) reads unchanged with the cited carrier.

## R02 (P2) — §2.1 `Mod^±(X)` and §3.4 restate TeichmullerGeometry §§0.0h, 3.1, 5.4, and the Scope assigns to a Part II what §§0.0d, 5.4 already own

Location: README lines 32, 106–109 ("the topological Baer–Epstein theorem, which extend
TeichmullerGeometry's closed smooth theory and belong to a TeichmullerGeometry, Part II"), §2.1
lines 471–479, §3.4 lines 741–745 and its sphere Check ("surjectivity is the only conclusion drawn
here"); `plan.json` targets 2.1, 3.4.

Claim: this roadmap owns the group of isotopy classes of self-homeomorphisms of a space; for a closed
surface only surjectivity of `Ψ_x` is available, the topological kernel theorem being unplanned.

Witness: #1169, `TauCetiRoadmap/TeichmullerGeometry/README.md` line 253 (§0.0h,
`MappingClassGroupFull M` for a topological space), line 473 (§3.1, `Mod±(Σ) ≅ MappingClassGroupFull Σ`),
line 624 (§5.4, `dehn_nielsen_baer : MappingClassGroupFull Σ ≃* OuterAut (FundamentalGroup Σ x₀)`,
genus `≥ 1`, by Epstein's theorem of §0.0d).

The two isotopy relations differ in general (TeichmullerGeometry: `TauCeti.Isotopic`, slices
embeddings; here: `TauCeti.AmbientIsotopic`), and agree on the closed surfaces both roadmaps treat:
`TauCeti.isotopic_iff_ambientIsotopic` (Tau Ceti, `Topology/Homotopy/Isotopy/Compact.lean:123`) for a
compact connected boundaryless manifold. Computed: `T²`, both groups `GL₂(ℤ)` (§3.4's torus Check;
`mcg_torus_full`); `S²`, both of order two with `Out(1) = 1` (§3.4's sphere Check; `mcg_sphere_full`).

Repair:

1. §2.1: keep `Mod^±(X)` as a variant and say so in one clause: "it differs from TeichmullerGeometry
   §0.0h's `MappingClassGroupFull X` by requiring the level-preserving total map to be a
   homeomorphism, the relation that extends over punctures (§2.2)". Add the API bullet: the identity of
   `X ≃ₜ X` induces a homomorphism `Mod^±(X) → MappingClassGroupFull X` (`TauCeti.AmbientIsotopic.isotopic`),
   an isomorphism for a compact connected boundaryless manifold (`TauCeti.isotopic_iff_ambientIsotopic`).
   Add both declarations to the Tau Ceti contract, §0.0h to the TeichmullerGeometry contract and to
   §2.1's *Needs:*.
2. §3.4: replace the first three sentences by: "for a closed connected oriented surface `Σ` of genus
   `g ≥ 1`, `Ψ_x` corresponds, under §2.1's isomorphism, to TeichmullerGeometry §5.4's
   `dehn_nielsen_baer`, hence is an isomorphism `Mod^±(Σ) ≃* Out(π₁(Σ, x))`; for `g = 0` it is the
   map from the group of order two (TeichmullerGeometry §5.4a) to the trivial group". Keep the `H₂`
   clause; reword the sphere Check ("an isomorphism for `g ≥ 1`, not injective for `g = 0`"). Replace
   §§0.2, 3.1, 5.2 in §3.4's *Needs:* by §§0.0h, 5.4, 5.4a.
3. Scope lines 106–109: the Part II sentence keeps only the punctured Dehn–Nielsen–Baer theorem and
   the smooth punctured model; the deferral bullet for TeichmullerGeometry gains "§0.0d (Epstein's
   isotopy theorem), §0.0h, §5.4 (topological Dehn–Nielsen–Baer), §5.4a". Mirror in `plan.json`
   (targets 2.1, 3.4, suppliers).

Tested on the instances above: torus, `Ψ` = `dehn_nielsen_baer` = the `GL₂(ℤ)` action on `H₁`, the
shear `(u, v) ↦ (u, u + v) ↦ [[1,0],[1,1]]` in both; sphere, kernel of order two in both.

## R03 (P2) — §7.1 states its topological theorem for an arbitrary `Γ`; it is false without finite generation

Location: README §7.1, lines 1309–1313: "Define `𝒳(Γ, G^ℝ) := Hom^red(Γ, G^ℝ)/G^ℝ` … hence
`𝒳(Γ, G^ℝ)` is Hausdorff, locally compact and second countable"; §6.1 defines `Hom^red` for "a group
`Γ`"; §§7.3, 7.4 likewise name no hypothesis on `Γ`, `Γ'`.

Claim: for every group `Γ` the character variety is locally compact and second countable.

Witness: `Γ` free of countably infinite rank, `(GL₁, ℝ^×)`: `Ad` is trivial, every `ρ` is reductive,
`𝒳 = (ℝ^×)^ℕ`, where every basic open set has non-compact closure. `plan.json` 7.1 lists
"Γ finitely generated".

Repair: §7.1 "For a real reductive datum `(𝐆, G^ℝ)` and a finitely generated group `Γ`, define …";
§7.3 "for finitely generated `Γ`, `Γ'`"; §7.4 "for a finitely generated `Γ`". Add the witness as a
negative-control Check of §7.1. Tested on the refuting instance restricted to rank `m`:
`𝒳(F_m, ℝ^×) = (ℝ^×)^m`, locally compact and second countable; the realization `V = (M_N × M_N)^S`
of §5.3 needs `S` finite, which the hypothesis supplies.

## R04 (P3) — the contract says the continuum lemma is missing and plans to prove it; Tau Ceti has it

Location: README lines 187–188: "Mathlib has no lemma that a decreasing intersection of compact
connected sets is connected; §2.2 proves it"; §2.2 sketch, lines 526–530.

Claim: the lemma is absent from the pinned libraries.

Witness: Tau Ceti `TauCeti.isPreconnected_iInter_of_directed` (`Topology/Continuum.lean:69`):
`[T2Space X] [Nonempty ι]`, `Directed (· ⊇ ·) t`, each `t i` compact and preconnected, conclusion
`IsPreconnected (⋂ i, t i)`.

Repair: delete the sentence from the Mathlib contract; add the declaration to the Tau Ceti contract
and to §2.2's *Needs:*; in the sketch replace "a shrinking sequence `U_k`" and the parenthetical proof
of connectedness by "the family of closures of `h(U ∖ {p})`, `U` in the neighbourhood basis, directed
by reverse inclusion, has preconnected intersection (`TauCeti.isPreconnected_iInter_of_directed`)".
This also removes the unstated first countability (the hypothesis gives a basis, not a sequence).
Tested: `Σ = S²`, `p = N`, closed caps `U_r`: closures of `h(U_r ∖ {N})` are compact, connected and
nested, intersection a nonempty connected subset of `P`, one point.

## R05 (P3) — the fact assumed of MordellLawrenceVenkatesh §5.5 is not stated there; it follows from what §5.5 states

Location: README lines 226–228: "Assumed: … an orientation-preserving homeomorphism of a closed
oriented surface `S` fixes the fundamental class `[S]` of §5.5"; §3.4 sketch, lines 755–756.

Claim: §5.5 supplies `f_*[S] = [S]`.

Witness: MordellLawrenceVenkatesh §5.5 at its head (#1231) states only that the intersection form "is
invariant under orientation-preserving homeomorphisms" and is perfect for `∂S = ∅`; `f_*[S] = [S]` is a
step of its proof sketch, not a statement.

Repair: drop the assumption and derive the step in §3.4's sketch: "`f_*[Σ] = ε[Σ]`, `ε = ±1`;
naturality of cup and cap products gives `î(f_* x, f_* y) = ε î(x, y)`; for `g ≥ 1` the form is
nonzero and invariant (MordellLawrenceVenkatesh §5.5), so `ε = 1`". Tested: torus, `A ∈ GL₂(ℤ)`,
`î(Ax, Ay) = det(A) î(x, y)`, so the shear `[[1,0],[1,1]]` gives `ε = 1` and `diag(1, −1)` gives
`ε = −1`; computation: with `x = a ∩ [Σ]`, `f_* x = ε (f⁻¹)^* a ∩ [Σ]`, so
`î(f_* x, f_* y) = ε² ⟨a ∪ b, (f⁻¹)_*[Σ]⟩ = ε î(x, y)`. The sphere (`î = 0`) is outside the clause.

## R06 (P3) — §7.1's sketch writes a vector as a group element

Location: README line 1321: "write `w_n = k_n t_n k'_n` (`G^ℝ = K T K`)".

Claim: `w_n ∈ V` equals an element of `G^ℝ`.

Witness: the next line uses `f(t_n k'_n v_n) = f(k_n⁻¹ w_n)`, which needs `w_n = k_n t_n k'_n v_n`.

Repair: "write `w_n = g_n v_n` with `g_n = k_n t_n k'_n`". Tested on `ℝ_{>0}` acting on `ℝ²`:
`K = 1`, `w_n = t_n v_n`, `f(v_n) = f(t_n v_n) = f(w_n)` for the `T`-invariant `f`.

## Verified sound

**Round-2 findings.**

- F01 (§3.5 non-lifting clause): repaired, applied differently, correctly. Repaired passage: "The
  based action `[f] · ρ = ρ ∘ (f_{const})⁻¹` of `Mod(S*)` … factors through `Forget` if and only if
  every homomorphism `π₁(S, x) → H` has commutative image". Both directions recomputed (table). The
  repair report's reason for dropping the review's "in particular" clause holds: lifts `s(f)` act as
  soon as each `(s(f)s(g))⁻¹ s(fg)` fixes every `ρ`.
- F02 (§3.4 sign step, *Needs:* lines): repaired. Repaired passage: "by `+1` if `f` preserves the
  orientation, because it fixes the fundamental class `[Σ]` (MordellLawrenceVenkatesh §5.5), and by
  `−1` if it reverses it, since `f = (f ∘ r) ∘ r`"; §3.4's *Needs:* has §§5.5, 5.19 and Stage 4 items
  2–3; §3.2's has §5.19. The reflection `r` is checked in the table; the residual assumption is R05.

**Principles.** No route-specific shortcut; no passage copied (cited lines of the five readable
sources compared with the README sentences); no algorithm; no `set_option` or sorry'd data (no Lean
file); none of the never-cite roadmaps is cited (each name grepped). The re-planning of
TeichmullerGeometry's objects is R01–R02.

**Supplier order.** Gate output:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 223 roadmaps, 2036 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` (worker's `citations.md`, index of 2026-11-10): nothing
found nowhere. Resolved this round, at the head of the open pull request or on main:
MordellLawrenceVenkatesh §§5.1, 5.4, 5.5, 5.9 (action on coverings by `f ∘ p`, monodromy by
`(f⁻¹)_*`; `Mod(S_{0,3}) = Sym(3)`, pure subgroup trivial), 5.15, 5.16, 5.17, 5.19 (`γ ↦ α * γ * α⁻¹`,
`Forget(Push α) = 1`, torus trivial), 5.20 (`χ(S) < 0`), 5.22 (surjection onto `Sp(2g, ℤ)`,
`Mod(T²) ≅ SL₂(ℤ)`), 5.23; TeichmullerGeometry §§0.0d, 0.0h, 0.2, 3.1, 4.2, 4.3, 4.4, 4.5, 5.1, 5.2,
5.4, 5.4a, 6.1 (all present; content as in R01–R02); ArithmeticGaloisRepresentations §1.7
**Semisimplicity over a perfect field** and §1.11's two named paragraphs, `IsGCompletelyReducible`;
ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1, `IsCartanInvolution`; ComplexComparisonPartII
§C-1.1, `complexSchemeAnalytification`; ClassifyingSpaces items 11, 15, 17 (main);
AlgebraicTopology Stages 1 and 4 (main); FreeGroupsAndLimitGroups §§6.1–6.2, `SurfaceGroup.lift`,
`[x, y] = x⁻¹ y⁻¹ x y` (main); ReductiveGroups Layers 3A (3A.2, 3A.4), 7, 9, with no Borel–Tits
theorem on main or at #1332; ReductiveGroupsPartII §§RG2.0.1, RG2.0a.2 (main); LieGroups Layer 7's
three named paragraphs (lines 941, 1013, 1031) and Layer 9 (main); CompactGroups Layer 5 (main);
HamiltonianReduction R5 (main); FiniteGroupInvariants §3.1; InverseGaloisAndArithmeticFundamentalGroups
§IG.3.2.

**Declared gaps.** `gcr-reductive-identity-component` (ArithmeticGaloisRepresentations §1.11) and
`borel-tits` (ReductiveGroups Layer 7): each one sentence with its hypotheses, same slug in
`plan.json` and README, supplier named, neither provided today (`roadmaps grep 'Borel.Tits'`: no
statement in ReductiveGroups; §1.11 has no identity-component statement). No finding.

**Library declarations opened at the pins.** Mathlib: `FundamentalGroup.mul_def`
(`AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`, `p * q = q.trans p`),
`fundamentalGroupMulEquivOfPath` (:48, `Iso.conj` of the path class, `[γ] ↦ [p̄ ⬝ γ ⬝ p]`),
`t2Space_quotient_mulAction_of_properSMul` (`Topology/Algebra/ProperAction/Basic.lean:113`). Tau
Ceti: `TauCeti.ContinuousAut.conj` (`Topology/Algebra/Group/ContinuousAut/Basic.lean:183`),
`.normal_range_conj` (:237), `TauCeti.AmbientIsotopy.finalHomeomorph`
(`Topology/Homotopy/Isotopy/Basic.lean:234`), `.conj` (`Topology/Homotopy/AmbientIsotopyConj.lean:110`),
`TauCeti.AmbientIsotopic.isotopic` (`Topology/Homotopy/AmbientIsotopic/Basic.lean:94`),
`TauCeti.Isotopic` (`Topology/Homotopy/Isotopy/Basic.lean:114`), `TauCeti.isotopic_iff_ambientIsotopic`
(`Topology/Homotopy/Isotopy/Compact.lean:123`), `TauCeti.isPreconnected_iInter_of_directed`
(`Topology/Continuum.lean:69`), `TauCeti.Coalgebra.IsLinearlyReductive`
(`Algebra/Coalgebra/Comodule/LinearlyReductive.lean:249`),
`TauCeti.PointTopology.instTopologicalSpaceWithConv` (`Topology/Algebra/PointTopology/Basic.lean:110`),
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`
(`RepresentationTheory/Continuous/InvariantComplement.lean:190`).

**Sources, seeded sample** (15 targets; every readable locator opened). LandesmanLitt2024 41–50
(§§1.3, 3.3, 3.5: outer action, conjugacy classes, Definition 1.1.1, "does not naturally act"),
473–475, 503–515; BCGGO2024 466–481 (§§5.1, 5.2: real forms as fixed sets, possibly disconnected,
Cartan involution with `στ` compact), 2706–2713 (§§4.2, 4.3, 6.7, 7.1: `Hom(π₁Σ, G^ℝ)`, conjugation,
reductive through `Ad`, Definition 8.1), 2714–2726 (Example 8.2); Sikora2012 228 (Proposition 8),
262–268, 363–364 (Corollary 17: completely reducible `H` irreducible iff
`dim C_G(H) = dim C(G)`), 572–586 (Theorem 30, line 584), 823–837 (§11), 844–845 (Example 48, §§7.2,
7.5); BohmLafuente2021 52–62 (condition (1), equal to §5.4's hypothesis), 73–88 (Theorem 1.1),
172–193, 417, 445, 518, 562, 568, 1050; BateMartinRohrle2005 263, 267, 355 (Lemma 2.12(i)), 379–382
(Proposition 2.13: closed orbit and `C_G(H)⁰ = Z(G)⁰`), 510, 861–879. §§2.2, 3.2 rest on
FarbMargalit2012 (waived) and on MordellLawrenceVenkatesh §5.19, checked above. Flagged-unverified
locators: none beyond the waived and uncertified entries. The manifest records all ten cited works,
with no local path; no fetch was needed and no `needs-references.toml` was written.

**Ownership against open work** (`roadmaps grep -i --readme-only` over main and the 432 open heads).
`OuterAut`, `MappingClassGroupFull`: TeichmullerGeometry (R01, R02) and the never-cite
SurfaceTopology. `pure mapping class|PMod`: mentions only, no owner on main or at any head.
`character variet`: GeometricTopology (Culler–Shalen, scope prose), PainleveEquations,
CountingBundlesAndHallAlgebrasOfCurves, InstantonFloerTheory, GaugeQuiltFieldTheory,
IntegralHeckeAndGaloisDeterminants; none builds `𝒳(Γ, G^ℝ)`. `Kempf.Ness`: TensorProductCombinatorics
§7.3 (projective, one direction). `representation (scheme|variety)`: unrelated lattice counts and one
prose mention in TeichmullerGeometry §4.5. `real reductive (datum|group)`: no datum carrier. `Birman`:
MordellLawrenceVenkatesh §5.20 (consumed); braid-theory references elsewhere. `scratch/overlaps.md`:
no open pull request changes this roadmap, no cited id dropped or revision-only. The board's package
index (three packages) holds nothing related.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `Out(Γ)` | `ℤ`, `S₃`, `Q₈`, `ℤ²` | `2`; `6/6 = 1`; `24/4 = 6`; `GL₂(ℤ)`; identical values in TeichmullerGeometry §4.2's Checks | correct, duplicated | R01 |
| §1.3 action and non-descent | `ℤ²`, `φ = [[1,1],[0,1]]`, `ψ = [[1,0],[1,1]]`; `F₂`, `ρ = id` | `(φψ)⁻¹ = [[1,−1],[−1,2]]`, row `(1,−1)`; `(ψφ)⁻¹` row `(2,−1)`; `c_a·id = c_{a⁻¹} ≠ id` | left action; iff holds both ways | none |
| §2.1 `Mod^±(X)` vs `MappingClassGroupFull` | `T²`, `S²`, `ℝ`, `[0,1]` | `GL₂(ℤ)` both; order `2` both; order `2` (monotone type); order `2` (endpoints fixed along an isotopy) | agree on closed surfaces by the pinned lemma | R02 |
| §2.2 extension theorem | `S² ∖ {N, S}`; `S¹ ∖ {p, q}`; point of `Σ ∖ P` in the intersection | `(θ, s) ↦ (−θ, −s)` extends to a rotation by `π`; arc flip has no extension; `z = h(y)`, `y ∉` some compact `U`, `h(Σ ∖ (P ∪ U))` open around `z` | sound; connectedness lemma at the pin | R04 |
| §2.5 pure Birman | `(0,3)`, `(1,1)`, `(1,0)`, `(0,2)` | `PMod_{0,4} ≅ F₂`; `F₂ → PMod_{1,2} → SL₂(ℤ)`; `Push = 1`; `ℤ → 1` | hypothesis `2g − 2 + n > 0` needed | none |
| §3.1 laws | change of path; composition; `id_σ` | `conj[δ ⬝ δ̄'] f_δ [γ] = [δ' δ̄ δ fγ δ̄ δ δ̄'] = f_{δ'}[γ]`; `(fg)_{δ ⬝ fε} = f_δ g_ε`; `id_σ[γ] = [σ γ σ̄] = conj[σ]⁻¹[γ]` | consistent with `mul_def` at the pin | none |
| §3.2 inner-automorphism lemma | `H : f ≃ g`; `f ∈ Homeo₀`; push | `fγ ⬝ η ≃ η ⬝ gγ`, so `g_{δη} = f_δ`; `f_δ = conj[η ⬝ δ̄]`; push: `f_const = conj[α]`, class of `ᾱ ⬝ γ ⬝ α` = §5.19's `α * γ * α⁻¹` | correct | none |
| §3.3 `Ψ_x` | `S¹`; `T²` shear; `[0,1]` | `ℤ/2 ≅ Out(ℤ)`; `e₁ ↦ (1,1)`, `e₂ ↦ (0,1)`, `[[1,0],[1,1]]`; flip nontrivial, `π₁ = 1` | correct | none |
| §3.4 reflection `r : k ↦ 3 − k` | `g = 1, 2`, general | edge `4i` (`a`, ccw) `↦ 4j+3` cw = `b`'s own direction; `4i+2 ↦ 4j+1`: `a ↦ b`; `4i+1, 4i+3 ↦ 4j+2, 4j`: `b ↦ a`, `j ≡ −i mod g`; torus matrix `[[0,1],[1,0]]`, `det = −1` | `r` descends, `−1` on `H₂` | none |
| §3.4 `+1` clause | torus `A`; `diag(1,−1)` | `î(Ax, Ay) = det(A) î(x, y)`; `ε = 1`, `−1` | derivable from §5.5's statement | R05 |
| §3.4 surjectivity and kernel | torus, sphere, `g ≥ 2` | `GL₂(ℤ)` iso; order `2 → 1`; iso by `dehn_nielsen_baer` | stronger statement owned by the supplier | R02 |
| §3.5 non-descent | `(0,3)`, `S₃`, `ρ(a) = (1 2)`, `ρ(b) = (2 3)`; `H = ℤ/3`; `(1,0)`, `(0,2)` | `Push(a)·ρ(b) = (1 2)(2 3)(1 2) = (1 3)`; push trivial on `(ℤ/3)²`; `π₁` abelian, both sides hold | iff correct; `χ < 0` used only for `ker Forget` | none |
| §3.5 Burnside count, covers | `Hom(F₂, S₃)`; torus triple cover | `(36 + 3·4 + 2·9)/6 = 11`; `M(ker ρ) = {b ≡ a}` = `ker(ρ M⁻¹)`, `ρ M` has `{b ≡ −a}` | correct | none |
| Layer 3 example | half-twist on `F₂ = ⟨p₁, p₂⟩` | `p₁ ↦ p₂`, `p₂ ↦ p₂⁻¹p₁p₂`, `p₃ = (p₁p₂)⁻¹ ↦ (p₁p₂)⁻¹` | peripheral classes permuted, orientation kept | none |
| §4.1–4.3 | `ℤ/2 → 𝔾_m` over `𝔽₂`; `(1,0)`, `(0,3)`, `(1,1)`; `Hom(ℤ, GL₁(ℝ))` | `𝔽₂[t]/((t−1)²)`; commuting pairs; `G²` with `ρ(p₃) = (ρ(p₁)ρ(p₂))⁻¹`; `G²`; `ℝ^×`, `ℝ_{>0}` clopen | correct | none |
| §5.2 bridge | `𝔾_m`, `τ = 1/z̄`; `GL₂`, `τ = J ḡ J⁻¹` | `α = 1/z` regular; fixed set `[[a, −b̄],[b, ā]]` | correct | none |
| §5.3 realization | open `G^ℝ`; hermitian part | `gᵀ = exp(X) k⁻¹`, `k = g exp(−X) ∈ G^ℝ`; `X + iY` hermitian iff `Xᵀ = X`, `Yᵀ = −Y` | transpose-stable; `i𝔲 = 𝔭 ⊕ i𝔨` | none |
| §5.4 Kempf–Ness | `ℝ_{>0}` on `ℝ²`; scaling on `ℝ`; compact `G`; (iv) | `M = {|x| = |y|}`; `M = {0}`, `α = −1`; `M = V`; a minimizer of the closure is minimal in its orbit, so its orbit is the closed one | equals BohmLafuente2021 Theorem 1.1, Corollaries 5.5, 6.4, A.2, Lemmas 5.1, 6.3, 6.5 | none |
| §6.3, §6.4 | torus; `U ⊂ SL₂`; `N(T)`; Borel | semisimple, reductive; unipotent, not; `Z⁰ = T`, no fixed line; `R_u(B) ≠ 1`, centralizer `±1` | iff both ways | none |
| §6.6 real and complex orbits | converse step | `τ(g₀)g₀⁻¹ = u exp(Z)` gives `τ(u) = u⁻¹`, `τ(Z) = −Ad(u)Z`; `exp(τZ/2) u exp(Z/2) = u`; coset `U exp(W)` `τ`-stable forces `τW = W`, `W ∈ 𝔭` | sketch correct | none |
| §6.7 six conditions, corollaries | genus-two unipotent; Borel-dense `F₂`; reductive `ρ` in `P_λ` | all fail; centralizer central, not reductive; `λ(𝔾_m) ⊆ C_G(ρ)` noncentral, so centralizer infinite modulo centre | correct; matches Sikora Corollary 17 | none |
| §7.1 topology | `F_∞ → ℝ^×`; `F_m → ℝ^×`; `ℤ → SL₂(ℝ)`; inverse continuity | `(ℝ^×)^ℕ` not locally compact; `(ℝ^×)^m`; semisimple classes; `f(k'_n v_n) → 0` and `→ 1` | false without finite generation; sketch slip | R03, R06 |
| §7.2 comparison | `ℤ → GL_n`; `F₂ → SL₂`; `S = ∅` | `𝔸^{n−1} × 𝔾_m`; `ℂ³` by three traces; a point | correct | none |
| §7.3 functoriality | `SO(2) ⊆ SL₂(ℝ)`; `⟨a⟩ ≤ F₂` with `ρ(a)` unipotent; finite index | reductive image; restriction not reductive; same identity component | correct for finitely generated groups | R03 |
| §7.4, §7.5 | `Out(ℤ)` on `SO(2)`; `𝒳(ℤ, PSL₂(ℝ))`; `𝒳(π₁Σ₁, ℂ^×)` | `g ↦ ḡ`, fixed `±1`; elliptic, hyperbolic, identity; `(ℂ^×)²` | correct | none |

**Shape.** Summary, Scope, Conventions, contracts, build paragraph, seven layers each ending with
Examples and Dependencies, consumers, references; every definition (§§1.1, 1.2, 2.1, 3.1, 4.1, 5.1,
6.1, 7.1) has an API list and at least three Checks; every theorem a locator; no LaTeX delimiters,
target tables, field lists, process words, pull-request numbers or machine paths (grepped). Four lines
exceed the house width (188, 576, 1363, 1471); not a finding.

**Headline theorems, for the package stage.** As recorded in round 2: of the eight headlines, the
real Kempf–Ness theorem (§5.4) and the non-descent theorem (§1.3) are statable at the pins and are
required in `Suggested.lean`; the others lack a carrier (representation scheme, affine quotient,
real reductive datum, punctured mapping class group) and must be named in the module docstring.
After R01–R02 the closed-surface form of §3.4 is TeichmullerGeometry's headline, not this roadmap's.
Padding probe and `#check` comparison: not applicable (no Lean file).

## Not verifiable

- FarbMargalit2012, Knapp2002, RichardsonSlodowy1990 (waived), Richardson1988, Goldman1984
  (uncertified): cited by locator only; the texts were not read.
- MappingClassGroupsAndCanonicalRepresentations is in the merge order but readable nowhere, so the
  consumer entry could not be checked.
- The definition of `Out⁺(Π)` in TeichmullerGeometry §§5.2, 5.4 is not displayed there, so its
  agreement with §3.4's index-two subgroup acting trivially on `H₂` was not checked.
- Elaboration: not available in this lane, and no Lean file exists at the design stage.

## Source issues

- **Misprint** in Sikora2012 at §11, line 836, printed p. 18: the source refers to a Proposition 30 for the closed-orbit characterization; it should be Theorem 30 (line 572); affects nothing.
- **Error** in BCGGO2024 at §2.3, line 471, printed p. 10: the source says the real form `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be whenever both `p` and `q` are nonzero (`SO_{0,q}` is connected); affects nothing.
