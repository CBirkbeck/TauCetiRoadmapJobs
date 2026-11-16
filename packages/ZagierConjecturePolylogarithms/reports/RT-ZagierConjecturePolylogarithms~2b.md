<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6910489870 -->
Red team round 2 pass b (claude) of 56d52bf

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.13(3): a vanishing real period does not make a constant Hodge–Tate class zero

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:623`: "the limit of the variation of a
   symbol and the variation of its specialization have the same cobracket …, so they differ by a constant
   variation, whose period vanishes by collision continuity (§3.10)."

   **Claim.** This proves property (3) at `:616`: the images of all iterated specializations vanish in
   `L^HT_•(η_X)`, so `r_X` is defined on `L₃`, `L₄` of `ℂ(X)`.

   **Witness.** Over a point the kernel of the cobracket in `L^HT_m` is `Ext¹(ℚ(0),ℚ(m)) = ℂ/(2πi)^mℚ`
   (`README.md:106`), and `R` is its projection to `ℝ(m−1)` (`:539`). The class of `(2πi)^m·√2` is
   nonzero with `R = 0` (compare GR lines 2594–2599).

   **Repair.** Either of the following; (B) uses only what the README already has.

   (A) Replace the sentence by: "…so they differ by a class with zero cobracket, a constant variation by
   rigidity (§3.7). The real period does not detect such a class: `Ext¹(ℚ(0),ℚ(m)) = ℂ/(2πi)^mℚ` and
   `R` sees only its projection to `ℝ(m−1)`. By (2) the difference is pulled back from the universal
   degeneration over a configuration space defined over `ℚ`; at a `ℚ`-point it is the Hodge realization
   of a class of `Ext¹_{MT(ℚ)}(ℚ(0),ℚ(m))`, zero for `m = 2, 4`, and for `m = 3` a rational multiple of
   the image of `S₃(1)`, which is zero because the period of the difference vanishes (§3.10) and
   `R(S₃)(1) = −ζ(3)/4 ≠ 0`." This needs a new stated property: the limit mixed Hodge structure at a
   `ℚ`-point of the collision divisor is the Hodge realization of a motivic class (property (4) covers
   points of the admissible open only).

   (B) Let `N_m ⊂ L^HT_m(η_X)`, `m ≥ 2`, be the constant classes with zero cobracket and zero real period.
   State `r_X` as a morphism into `L^HT_•(η_X)/N_•`, and (3) as "the limit and the variation of the
   specialization agree modulo `N`". `N` lies in the kernel of the cobracket, so the quotient is a Lie
   coalgebra; `P` and `R` vanish on `N` and on `N∧L` (their formulas of §3.7 contain only `P(a)` and
   `d^C P(a)`), so §§5.1, 5.4, 5.7 are unchanged. In the motivic paragraph replace "hence zero" by "hence
   of zero real period under every embedding".

   Tested on the witness: under (A) the class of `(2πi)^m√2` is not the realization of an element of
   `Ext¹_{MT(ℚ)}`, on which `R` is injective; under (B) it lies in `N` and is divided out. The motivic
   realization over a number field needs only the vanishing of the periods at every embedding, then
   BorelRegulators §2.3.

2. **F02** (P2) §6.3 lists §6.2 in its *Needs*, so the every-family statement formally depends on the lift

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:1075`: "§5.2 and the conversions of §6.2
   give the claim … *Needs:* §§3.2, 3.8, 3.13, 5.1–5.2, 6.2; …".

   **Claim.** `README.md:965`: "The every-family statement (§6.3) … do not [depend on them]"; the same at
   `:3`, `:1089` and `Suggested.lean:139-140`.

   **Witness.** `README.md:1064`, in §6.2: "Through `κ` this statement rests on the proof obligations (a),
   (b) and (d) of §5.7"; §6.2 *Needs* §6.1. `README.md:124` says a *Needs* line lists exactly what the
   proof uses. The edge §6.3 → §6.2 → §6.1 → §5.8 → §5.7 contradicts `:965`.

   **Repair.** What §6.3 uses of §6.2 is two unit conversions, both already in the Conventions (`:48`). In
   §6.3 replace "§5.2 and the conversions of §6.2 give the claim" by "§5.2, the relation `r_Bo = −2r_Be`
   (BorelRegulators §6.2) and the division of the `ℝ(3)`-valued `R = i·p` by `(2πi)³` (Conventions) give
   the claim", and write the line as "*Needs:* §§3.2, 3.8, 3.13, 5.1–5.2; PeriodsAndSpecialValues
   PS.9.8–PS.9.9 with the contracts mixed-tate-number-fields and mixed-tate-hodge-realization;
   BorelRegulators §§1.1, 2.3, 6.2." In §6.4 keep "*Needs:* §§3.2, 6.2–6.3" (existence uses §6.2). Tested:
   the every-family route of `:1089` then reaches §5.7 through no *Needs* line (§§3.2, 3.8, 3.13, 5.1, 5.2
   and their own *Needs* lines were followed; none names §§5.7, 5.8, 6.1 or 6.2).

3. **F03** (P2) gap mixed-tate-hodge-realization asks for a tensor functor into a category whose tensor product no named section supplies

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:106`: "an exact ℚ-linear tensor functor
   from `MT(F)` to the mixed ℚ-Hodge structures of HodgeStructures Layer L2"; same sentence in
   `design/plan.json`, `gaps`, slug `mixed-tate-hodge-realization`.

   **Witness.** `Completed/HodgeStructures/README.md:326-345` (L2) and the pinned
   `TauCeti/Geometry/Hodge/Mixed/` have the ℚ-linear abelian category and strictness, no tensor product
   of mixed structures (`TensorProduct/` is pure only). It is
   MixedHodgeModulesAndIrregularHodgeTheory §3.1 (README line 372, variations; line 373, a point).

   **Repair.** In both places write: "…an exact ℚ-linear tensor functor from `MT(F)` to the
   graded-polarizable mixed ℚ-Hodge structures (HodgeStructures Layer L2, with the tensor product of
   MixedHodgeModulesAndIrregularHodgeTheory §3.1 on a point), compatible with the weight filtrations…".
   MixedHodgeModulesAndIrregularHodgeTheory is line 261 of the merge order, before
   PeriodsAndSpecialValues at 321, so the supplier can consume it. Tested: every structure the sentence
   then names has an owner earlier than the supplier.

4. **F04** (P3) a line of the module docstring begins with "theorem", and the signature extraction reads a declaration `does`

   **Location.** `packages/ZagierConjecturePolylogarithms/Suggested.lean:13-14`: "…three steps of which no
   cited source proves; the every-family / theorem does not use it."

   **Witness.** The worker's elaborated-signature table for this head lists 11 declarations, the first
   "`does` (theorem, line 14)", with the elaboration error "Unknown identifier `does`". The file has 10
   (8 definitions, 2 theorems). A README-against-Lean name check would look for `does`.

   **Repair.** Reflow lines 12–14 so that no line starts with a declaration keyword, for example: "For
   fields with a complex place the roadmap's proof of existence uses the combinatorial / lift
   `G₄(F) → L₄(F)` of README §5.7, three steps of which no cited source proves. The / every-family
   theorem does not use that lift." Then run `#check @name` on the ten names again.

Four new findings: three P2 (S01–S03) and one P3 (S04). The two Lean headlines are true as typed on
every instance computed; no finding gives a counterexample to either. The eight distinct findings of
round 1 are repaired at this head (table below); none is re-raised.

## Earlier findings at this head

| Round-1 finding | Status | Witness at 56d52bf |
|---|---|---|
| 1a/F01, 1b/F02 (P1/P2): existence headline rests on the lift of §5.7 | repaired by disclosure; the headline is kept | `README.md:965` "No cited source proves the vanishing in (a) and (b) or the regularity (d) … These three steps are proof obligations of this target"; the same dependence at `:3`, `:1045`, `:1064`, `:1089`, `Suggested.lean:10-14`, `:128-131`. Whether the headline stays is under "For the human reviewers". |
| 1a/F02 (P2): contract asked the supplier for framed objects owned here; five deliverables | repaired; one residue, S03 | `README.md:104` keeps heart, fibre functor, `Ext¹`, `Ext²`; `:106` new slug mixed-tate-hodge-realization; `:539` "Prove that the kernel of the cobracket on `L^M_n(F)` is `Ext¹_{MT(F)}(ℚ(0),ℚ(n))`". Five slugs agree between `design/plan.json` and the README. |
| 1a/F03 (P2): "compatible with stabilization" | repaired | `README.md:716` "No comparison between the maps for `N` and for `N + 1` is asserted"; `:77` "No compatibility between different ranks `N` is asked for"; `:1042` fixed rank `N = 15`. SchemeKTheoryOperations §6.7 at its head states bijectivity for `n ≥ 2m + e`, `e = 1` when `R/Jac(R)` is semisimple: `2·7 + 1 = 15`. |
| 1a/F04, 1b/F03 (P3): Theorem 1.2 is about the inductive groups | repaired | `README.md:1087` "Theorem 1.2 is stated there for the kernel of `δ₄` on the inductively defined group (GR lines 153–170 and 198)"; GR lines 153–170 and 198 read and agree. Docstrings `Suggested.lean:125-126`, `:138-140`. |
| 1a/F05 (P3): contract did not quantify the field | repaired | `README.md:74` "for every infinite field `F` and every one-parameter family over `F(t)`"; same in `plan.json`. |
| 1b/F01 (P2): cobracket formulas at an argument 1 | repaired | `README.md:33` slot rule; `:247` `δD₂₁(1,y) = [y]₂⊗u(1−y)`; `:276-278`. Recomputed: all three degenerate cases of each formula, and `δD₃₁(x,1)` against (33) (coefficients of `u(x)` and `u(1−x)` differ by the three-term element, zero). |
| 1b/F04 (P3): "discharged" overclaim | repaired | `README.md:1147` "The presentation map `B₄^comb → B₄^ind` that Polylogarithms §4.6 also names is not constructed here". |
| 1b/F05 (P3): Layer 2 needed a Layer 3 definition | repaired | §1.7 exists (`README.md:265`); `:379` and `:395` cite §1.7; `:418` §3.1 *Needs* §§1.2, 1.4, 1.6–1.7, 2.5. No cycle remains between Layers 1–3. |

No repair introduced a false statement that I could find. The new §6.1 rank argument was checked
against GR lines 4274–4291: a `GL₃`-invariant decorated `(n−3)`-flag in a complement of a
3-dimensional subspace; for `n = 15` the flag has length 12 and the complement dimension 12.

## The pass: statements, instances, values

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `polylog` | `n = 1`, `z = 3`; `n ≥ 2` disc coefficient; real `z > 1` | `−log 2 − πi` (lower boundary: `arg(1−z) = +π`); `(n−2)!⁻¹·(n−2)!/k^{n−1}·1/k = 1/kⁿ`; branch of `Complex.log` on the negative axis | same formula as PolylogarithmFunctions `Suggested.lean:47-52` for `n ≥ 0` |
| `singleValued` | `n = 4` coefficients; `n = 0`; `n = 1`, `z = 1` | `2^kB_k/k!` = `1, −1, 1/3, 0`: `Im(Li₄ − log·Li₃ + (1/3)log²·Li₂)`; empty sum `0`; `(riemannZeta 1).re`, a junk value never used | sound for the weight used |
| `unitVector` | `0`, `1`, `−1`, `1/2` | `0`, `0`, `0` (2-torsion in ℚ⊗), `−u(2)` | sound |
| `trilogCyclic`, `TrilogRelationFunction` | rotations `(a,c,d)`, `(c,d,a)`, `(d,a,c)`; `x = 1` in the three-term clause; constant `b` | `A`: `da−a+1`, `ac−c+1`, `cd−d+1`; `B`: the same three, shifted: all six hypotheses used, no zero denominator; `b1 + 2·b0 = b1`; `7v` | identical to Polylogarithms `Suggested.lean:73-89` |
| `IsCycle4` | `[1]`, `[2]`, `[x] + [x⁻¹]`; universe of `V` | `b(1)⊗0`; `L₃(2)⊗u(2) ≠ 0`; `b(x)⊗(u(x) − u(x))`; `B₃(F) : Type u` | equals the kernel in `B₃⊗U` |
| `zagierDeterminantFour` | exponent; `ℚ`; `ℚ(i)`, `[i]` | Polylogarithms' `π^{n(N−d)}` at `n = 4`, `d = r₂`: `4(r₁+r₂)`; `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 45ζ(4)β(4)` | sound |
| `zagier_four_exists` | `r₂ = 0`; `ℚ(i)` | `π^{4r₁}/√d ∈ ℚˣζ_F(4)` (Klingen–Siegel); `q = 45` | true on instances |
| `zagier_four_everyFamily` | zero column; `[i] + [−i]`; conjugate embedding | `q = 0`; `q = 0`; `q ↦ −q` | true on instances |
| Table (26) against (29), weight three | nine order cases of `(a,b)` | `a>0=b`: `−[v₀]`; `a=0<b`: `−[u₀]`; `a=b<0`: `2[v₀/u₀]`; `a=b>0`: `[v₀/u₀] − [u₀/v₀] = 0`; `a<0=b`, `a>b>0`, `a<b<0`, `a<0<b`, `a>0>b`: `0` | agrees with §1.2 |
| Table (26) against `δD₃₁`, weight four | `a>0=b`; `a=0<b`; change of uniformizer | `S₃(v₀)⊗u(v₀)`; `−S₃(u₀)⊗u(u₀)`; `Σ sp(aᵢ)·v(bᵢ) = −a·S₃(v₀) + a·S₃(v₀) = 0` | agrees; §3.14(2) consistent for every `π` |
| §1.6 degenerate `δD₂₁` | `(1,y)`, `(x,1)`, `(1,1)` | `[y]₂⊗u(1−y)`; `−[1/x]₂⊗u(1−x) = [x]₂⊗u(1−x)`; `0` | as displayed |
| §1.7 degenerate `δD₃₁` | `(x,1)`, `(1,y)`, `(1,1)`; `δ(D₃₁(y,1) + D₃₁(1,y))` | the three displayed values; `0` by symmetry of `D₂₁` and inversion | as displayed; consistent with §2.4 |
| §1.7 against (33) | general `x` | `u(x)`: `S₃(1) − S₃(1−x) − S₃(1−1/x) − S₃(x) = 0`; `u(1−x)`: the same element | agrees |
| Conventions sign on `Λ²B₂`; `d² = 0` on `D₃₁` | symbolic, `a,b,c,d = u(x),u(y),u(1−x),u(1−y)` | `[y/x]₂`: `(d−c)∧(a−b)` twice with opposite signs; `[x]₂`: `d∧a − d∧b − b∧a + a∧d − a∧b + d∧b = 0`; `[y]₂`: `0`; with the opposite sign `[x]₂` leaves `−2·d∧b` | `d² = 0` holds in the free module; sign forced |
| §2.2 flip | `Δ₁₂=2, Δ₃₄=3, Δ₂₃=Δ₁₄=1` | Plücker gives `Δ₁₃Δ₂₄ = 7`, `X = 6`, `u(7)∧u(6)` | sound |
| §3.7 `µ`, `Φ` | weight 4, degrees 1–4 | `1/20`; `1/10, 1/10`; `1/4, 1/6, 1/4`; `1, 1/3`; `α + β = 1/4`, `−α + β = −1/6` gives `5/24, 1/24` | as stated |
| §3.7 four units | `2, y, z, w` at `y=z=w=1` | pure types `−i/4`, mixed `−3i/4`; `P = −(i/4)log 2`; `R = −(1/4)log 2·(−i/4 − i/4) = (i/8)log 2` | as stated |
| §3.7 / §5.1 diagonal constants | weights 3 and 4 | `−(1/2)d(−4L₃*) = 2dL₃*` against `(3/4, −1/4)` product; `(5/6, −1/6)` | consistent |
| §3.8 primitive part | weight 2 and 3 over ℚ | `K₃(ℚ)_ℚ = 0`, `δCor_∞(0,1,3) = u(2)∧u(3) ≠ 0`; `−(2/3)(3/8)ζ(3) = −ζ(3)/4` | sound |
| §3.13(3) proof route | constant class `(2πi)^m√2` | nonzero in `ℂ/(2πi)^mℚ`, `R = 0` | S01 |
| §4.1 / §4.8 rows | dual rows `q ≤ m−4`, `m = 5,…,9` | each of `∂`, `p` on `C₆(1), C₆(2), C₇(2), C₇(3), C₈(2), C₈(3), C₈(4), C₉(4), C₉(5)` lands in a killed row or in the identity listed | the seven identities are exactly those needed |
| §4.8 (i), descent | coefficients | `−3/2 − 1 = −5/2`, `2 − 2 = 0`, `3 + 1 − 4 = 0`; `R₇³p∂ = −R₇³∂p = R₇²pp = 0` | sound |
| §4.6 / §4.8 `Alt` rule | `Alt₆` of a function of five | position `j` moved last: sign `(−1)^{5−j} = −(−1)^j` | `−(Alt₅)∘∂`, as stated |
| §4.3 genericity of `t_a` | `|a| ≤ N−4`, `N−|a|` vectors | `|a| + (N−|a|) = N ≤ N`: the sum is direct | well defined |
| §4.4 stabilization witness | `N = 4, 5` | `dim ≤ 3 < 4` with `2+2 ≤ 5`; `dim ≤ 5 < 6` with `3+3 ≤ 6` | as stated |
| §5.7 (a), (b), Check on the constant | degree-two cocycle; nine faces | `δR₇³p = R₆²pp = 0`; `c·Σ_{i=0}^{8}(−1)^i = c` | consistent |
| §5.8 components of `f′` | `C₈(4), C₈(3), C₈(2)` | `−h∘p`; `−h∘(∂+p)`; `−h∘∂`; `δ₂₂`: `0`, `−(R₇³∂ + R₇²p)_{Λ²} = 0`, `−R₇²∂ = 0` | lands in `Γ(F,4)` |
| §6.1 rank | `m = 4,…,7`; `GL₃ ⊂ GL₁₅` | thresholds `9, 11, 13, 15 ≤ 15`; flag length `12 = 15 − 3` | sound |
| §6.2 / §6.4 exponent | Borel `π^{d−4N}`, `π³` per column | `π^{4d−4N} = π^{−4(r₁+r₂)}` | cancels |
| §6.3 dependencies | *Needs* closure | contains §6.2, hence §5.7 | S02 |

Elaborated signatures: no Lean was run (read-only pass). The ten elaborated types supplied with the
job were compared with README §6.4: `[Field F]` on the field-level definitions, `[AddCommGroup V]
[Module ℚ V]` on `TrilogRelationFunction`, `[NumberField F]` on the two matrix definitions and both
theorems, `hc` on `zagier_four_everyFamily`; nothing lost. The eleventh entry of that table is S04.

Dependency check:

```text
depcheck: 253 roadmaps, 2403 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is line 323 of the merge order; its suppliers are at
lines 37, 39, 92, 138, 139, 261, 302, 306, 321, and HodgeStructures is under `Completed/`.

Ownership against open work: `scratch/overlaps.md` lists no second copy, no dropped id and no other
pull request changing this roadmap; the closest roadmap is Polylogarithms, whose `Suggested.lean`
declares the restated definitions in the namespace `TauCetiRoadmap.Polylogarithms`, so no fully
qualified name is shared. The two other board packages (AnalyticNumberTheory,
LawrenceVenkateshMethod) are not on this subject.

## Verified sound

- Declarations read: 10 of 10. One `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, no
  `#eval`. Padding: none; each of the eight definitions is used by a headline and neither theorem
  follows from a library lemma (no polylogarithm at the pins).
- Headlines: two stated; five groups named in the module docstring as not statable, each with its
  missing carrier (`L₄(F)` and the pre-Bloch group; mixed Tate motives and framed Hodge–Tate
  structures; Hodge correlator integrals; configuration complexes and `G₄`; higher K-groups and Borel's
  regulator). None of these carriers exists at the pins.
- README: 49 numbered sections (§§1.1–1.7, 2.1–2.5, 3.1–3.14, 4.1–4.8, 5.1–5.10, 6.1–6.5), the
  Conventions, the supplier contracts and the examples, every line.
- Locators verified against the cached text: 14 (GR lines 153–170, 196–200, 218–232, 498–504, 668–686,
  2836–2840, 2876–2902, 3968–3984, 4236–4249, 4272–4291, 2585–2601, 1124–1132; G08 lines 3812–3820;
  G00 line 178). All agree with the README's use of them.
- Checks and formulas recomputed: the 30 rows above. Every numbered section has at least three Checks.
- Sibling citations checked at the open heads or on main: SchemeKTheoryOperations §6.7; Polylogarithms
  §§2.1, 2.2, 3.1–3.7, 4.1–4.7, Layer 5 and 15 declaration names; PeriodsAndSpecialValues PS.3.0,
  PS.9.3, PS.9.8–PS.9.10 (read in full); K3BlochGroups §§3.2–3.5, 3.8, 4.21 and
  preBloch_rationalSpecialization; BorelRegulators §§1.1, 2.2, 2.3, 5.3, 5.4 (formula read), 6.0a, 6.2;
  MotivicEtaleKTheory §§3.3, 3.4, 7.1; MotivesAndAlgebraicCycles §3.6, §§6.1–6.3, Layer 4;
  MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3; HodgeStructures L2. All exist as cited.
- Pinned declarations checked: `NumberField.dedekindZeta`, `InfinitePlace.nrRealPlaces`,
  `InfinitePlace.nrComplexPlaces`, `NumberField.discr`, `Matrix.det_isEmpty`,
  `ProjectiveResolution.lift` (between two projective resolutions only), `bernoulli_one`;
  `TauCeti.Hodge.MixedHodgeStructure`, its `Hom` (a rational map), `MixedHodgeStructureCat` with its
  `Linear ℚ` and `abelian` instances, `range_inf_F_eq_map_F`, `tate` (pure, on `ℤ`, weight `−2m`).
- Declared gaps: five slugs, the same in `design/plan.json` and in the README, each with a supplier
  and a section. PS.9.8–PS.9.10 at the supplier's head are over `ℚ`, `ℤ` and `ℙ¹∖{0,1,∞}`;
  Polylogarithms §3.4 states the comparison for its own flag length. So the gaps ask for nothing
  already provided. S03 concerns one sentence.
- Policy: the pull request changes only `packages/ZagierConjecturePolylogarithms/`; no process words
  or pull-request numbers in the README or the docstrings; no algorithm.

## Not verifiable

- §3.14(1) for a general discrete valuation, mixed characteristic included: the proof route builds a
  configuration over `k(t₁)…(t_r)` from "expansions" of points over a field with a rank-`(r+1)`
  valuation; no cited source proves it and I did not check the route.
- §5.7 (a), (b), (d): open, as the README says.
- The numerical Checks of §2.4 (70 and 35 coefficients), §3.1 (`±0.5011`), §3.13 (`0.1206`, `0.1481`),
  §4.8 (`X ≠ 0`, ratio `−9`), §5.5 (coassociativity) and §6.4 (`−0.5210`, `5.9611`): not rerun; round 1
  pass b recomputed §2.4 and §4.8. The sign that the §3.1 Check tests was verified symbolically here.
- §3.13, weight three: the README says the constant of `Q₃` "is fixed by the value of `S₃(1)`"; GR
  lines 2592–2593 compute it by a specialization of its (106). I did not carry out that computation.
- §§5.3, 5.4, 5.6, 5.9, 5.10: compared with the internal conventions only; G93, G09, M20 beyond line
  114 and CGR beyond Theorem 9 were not reopened.
- Polylogarithms §§3.4 and 3.7 at its head still state "compatibility with stabilization"
  (its README lines 401, 407, 522, 530). This package no longer uses it; whether the supplier's
  statement survives the witness of `README.md:728` is for that roadmap.
- No Lean was elaborated in this pass.

## Source issues

- **Gap** in GR at §5.3, the last paragraph of the proof of Theorem 2.4, printed p. 57: the source says the constant by which a specialization formula can fail is of geometric origin, hence comes from a mixed Tate motive over the rationals; it should prove that the limit structure at a collision is motivic; affects the proof.
- **Error** in GR at Theorem 1.2, printed p. 5: the source says suitable cycles make the normalized determinant equal to the zeta value; it should say a nonzero rational multiple, the determinant being empty for totally real fields (ratio 90 over the rationals); affects a stated result.
- **Gap** in GR at §9.3, item 2, printed p. 93: the source says expressing the Grassmannian tetralogarithm by motivic correlators gives a map into the cochain complex of the combinatorial Lie coalgebra; it should construct the map on the presentation, the realization being only surjective onto correlators; affects the proof.
- **Gap** in GR at §7.1, before (129)–(130), printed p. 62: the source says the Bigrassmannian complex is obtained by changing signs of the differentials, without fixing them; it should fix a row sign, since its unsigned sum of flag maps is a chain map only for one choice; affects nothing.

Source independence: 16 passages compared with 5 sources (GR 12, G08 1, M20 1, G00 1, CGR 1), none shared beyond formulas and standard names (longest common run 5 words, around an edge function forced by its formula); largest share GR, 64 of 113 bracketed locators; contents compared with GR: independent (Layer 1 ↔ §1.2 with §5.1; Layer 2 ↔ §§3–4; Layer 3 ↔ §§2, 5.2, 5.3, 6, 8.2; Layer 4 ↔ §§7, 10; Layer 5 ↔ §§8.1, 8.4, 9.1–9.2; Layer 6 ↔ §§1.1, 9.3: no one-to-one run in order, and the *Needs* lines of §§3.1, 5.8 and 6.1 force the order of Layers 2–6). G93 and G09 were not opened in this pass.

## For the human reviewers

- **Scope.** `zagier_four_exists` for `r₂ > 0` rests on README §5.7, whose steps (a), (b), (d) no cited source proves (`README.md:965`); GR reaches the lift through its motivic image (GR lines 4240–4243). Keeping it in `Suggested.lean` is yours.
- **Scope.** §3.14(1), specialization of `L₃`, `L₄` along every discrete valuation, mixed characteristic included, is this roadmap's own statement; the only locator is GR (26) with footnote 4, the one-parameter case.
- **Scope.** The main source GR is recorded as arXiv:1803.08585v5 with the note "accepted for publication in Annals of Mathematics" (`sources.toml`, `version_note`); no journal reference is recorded, and the README departs from it in at least eight places.
- **Licence.** G93 is read from the author's page (`licence_class = "author-page"`), an image scan of a 1993 AMS volume.
- **Not tested.** The README's corrections to GR (99), (192), (244), Lemma 7.9 and the `a₃` coefficient were not recomputed in this pass; round 1 pass b confirmed Lemma 7.9 numerically.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "56d52bf9ab21a9be8e3b79717958e26a99a189aa", "job": "RT-ZagierConjecturePolylogarithms~2b", "model": "fable", "worker": "chris-x52"} -->
