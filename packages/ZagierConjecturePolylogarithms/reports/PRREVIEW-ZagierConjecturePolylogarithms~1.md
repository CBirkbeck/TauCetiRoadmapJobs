# Review of ZagierConjecturePolylogarithms (pull request #2454 at eaf907b)

**Verdict:** needs changes

## R01 (P3) — The description announces two lists it never gives

**Location** Pull-request description, prose: "…this roadmap builds the weight-four theory the proof needs:" and "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."

**Claim** Both sentences introduce a list and none follows, so the description says neither what the roadmap builds nor which roadmaps it consumes.

**Witness** The colon sentence is followed directly by the paragraph "Roadmap folder `TauCetiRoadmap/ZagierConjecturePolylogarithms` (README, …"; the Dependencies sentence names no roadmap.

**Repair** End the first sentence with "…the proof needs: the presentations L₃ and L₄, cluster polylogarithms on Stasheff complexes, the weight-four Lie coalgebra with Γ(F,4) and its extension theorem, motivic and Hodge correlators, the Grassmannian configuration chain map, the combinatorial lift 𝓛₄, the polylogarithmic Chern cocycle and the maps K_{8−i}(F)_ℚ → H^iΓ(F,4)." Replace the Dependencies sentence by "Dependencies: on main, PolylogarithmFunctions, SchemeKTheoryOperations §6.7 and HodgeStructures Layer L2; in open pull requests, Polylogarithms, K3BlochGroups, BorelRegulators, MotivicEtaleKTheory, PeriodsAndSpecialValues, MotivesAndAlgebraicCycles and MixedHodgeModulesAndIrregularHodgeTheory, in the merge order below."

## R02 (P3) — §3.14's *Needs* line omits §3.2, whose `B₄(F)` its statement uses

**Location** `TauCetiRoadmap/ZagierConjecturePolylogarithms/README.md:647` "(1) … and it maps `B₄(F)` into `B₄(k)`"; `README.md:652` "*Needs:* §§1.2–1.6, 3.1; K3BlochGroups §4.21; Polylogarithms §3.3 (unit-part homomorphism); …"

**Claim** Statement (1) uses the single-symbol subspace `B₄` defined in §3.2 (`README.md:434`); neither the listed sections nor their own *Needs* lines supply it.

**Witness** §§1.2–1.6 never define `B₄`; §3.1's *Needs* (`README.md:418`) is §§1.2, 1.4, 1.6–1.7, 2.5 only.

**Repair** Replace the line by "*Needs:* §§1.2–1.6, 3.1–3.2; K3BlochGroups §4.21; Polylogarithms §3.3 (unit-part homomorphism); Mathlib `Finsupp`, `Submodule.Quotient.mk`."

## Verified sound

| Target | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| §1.4 L₄ presentation | Q₄ against GR (32), GR lines 510–513; relation (33) at x = −1 | double terms −,+,− and +3·S₄(Z) on both sides; (33): −S₄(2)−S₄(2)+S₄(−1) = README's −2S₄(2)+S₄(−1) | holds | none |
| §3.1 weight-four cobracket | GR (38), GR line 573; equal-pole case a = b < 0 | five terms of δD₃₁ identical; 2[u/v]₃⊗(u/v)+[u/v]₃⊗(u/v) = δ(3S₄(u/v)), as GR lines 589–594 | holds | none |
| §3.2 B₄, Γ(F,4), `IsCycle4` | [1], [2] over ℚ; [x]+[x⁻¹] | u(1) = 0 so [1] is a cycle; [2]: L₃(2)/ζ(3) = 0.875, pairing 1.0518 ≠ 0; inversion kills [x]+[x⁻¹] | holds | none |
| §3.3 extension theorem | GR Thm 6.1 (GR line 2604); F = ℚ(x,y) | p{x,y}₃,₁ = {x}₂∧{y}₂ in both; [x]₂∧[y]₂ ≠ 0, so D₃₁(x,y) ∉ B₄(F) | holds | none |
| §3.4 `CLie_S` | S = {a,s}; length-5 word; length-4 shuffle | V = ℚX_s, every word pure, all zero; cuts ℓ₁ ∈ {2,3,4} × 5 rotations = 5+5+5; b⧢(c,d) gives three words | holds | none |
| §3.7 canonical period, Φ | R/P in degree one, n = 2,3,4; ∗-product of n units; ω₄ on (2,y,z,w) | binom(2n−2,n−1)⁻¹ = 1/2, 1/6, 1/20 by G08 (106); Alt_n/n! = (1/n)Σ(−1)^{j−1}; r₃ = −i log 2, ω₄ = (i/8)log 2 | holds | none |
| §3.10 collision continuity | M20 Thm 11 (M20 line 899); Lemma 29 (M20 line 2378, n > 1); m = 1 | source: continuity all n, collisions n > 1; README restricts collision clause to m > 1 | holds | none |
| §3.12 depth reduction | ℓ = 3, 4, 5 | GR Prop 2.9 "m > 3" counts arguments, footnote 12 false at m = 3; Cor 2.10's {x,y}₃,₁, {x}₄ = README's two words | holds | none |
| §3.14 DVR specialization | Gauss valuation ℚ(t)→𝔽₂(t); origin of 𝔸²_ℚ | sp D₃₁(2,t) = S₄(t); sp D₃₁(1/2,t/2) = 3S₄(1/t); S₄((s+2t)/t) gives S₄(2) or 0 by order; table = GR (26) | holds; *Needs* incomplete | R02 |
| §4.1 weight-four Bigrassmannian | m = 4, 5, 6 | BC₄ = 0, BC₅ = C₅(4); p: C₆(4) → C₅(3) zero in the quotient; GR (129)–(130) | holds | none |
| §4.3 flags to configurations | t = Σc_d t_d with D = ∂+p and ∂−p | Dt − t∂ = Σ(c_d+c_{d+1})p t_d: signed gives 0, unsigned 2p t₀; unsigned fits ∂−p (GR line 2837) | holds | none |
| §4.5 G₄ | Def 7.5 (GR line 3228); p² on nine vectors | both relations in (162); 9·8 = 72 ordered pairs, signs (−1)^a(−1)^{b−1} vs (−1)^b(−1)^a, 36 cancelling pairs | holds | none |
| §4.7 symbolic Bloch modules | GR Ex. 10.6; first-type three-term sum | dims 10 and 55 = GR lines 4393–4395; sum ↦ [1]₃, L₃(1) = ζ(3) ≠ 0, so target B₃/ℚ[1]₃ | holds | none |
| §4.8 against GR Lemma 7.9 | functional (D∘σ₁)∧(D∘σ₂), two random 8-configurations in ℂ³, full Alt₈ | X = −271.56; GR's first term −7·10⁻¹²; second −3X = 814.67; R₇²p wedge −9X = 2444.02 | README right, source wrong | none |
| §5.9 residues | degree count; G93 lines 803–806, 814 | Z ∈ U at codim 3: 1+6 = 7; ℚ at codim 4: 0+8 = 8; (4.10)–(4.11) on printed p. 190 | holds | none |
| §6.5 inductive cycles | square with C = ℚ[F]; inductive [1] | both composites [x] ↦ [x]₃^ind⊗u(x); 2[1]₄^ind = 0; L₄(1) computed 1.2·10⁻¹³ | holds | none |
| `zagier_four_exists` | F = ℚ; F = ℚ(i), c = [i] | 0×0 det = 1, Z₄ = π⁴ = 90ζ(4); (π⁴/2)β(4) = 48.16609 = 45ζ(4)β(4) = 45ζ_F(4), u(i) = 0 | holds (r₂ > 0: human section) | none |
| `zagier_four_everyFamily` | ℚ(i): [i]+[−i]; ℚ: [2]; totally real F | period L₄(i)+L₄(−i) = 0, q = 0; [2] no cycle (7ζ(3)/8); π^{4r₁}/√d ∈ ℚˣζ_F(4) (Siegel–Klingen) | holds | none |
| restated `unitVector`, `trilogCyclic`, `TrilogRelationFunction` | text vs Polylogarithms `Suggested.lean`; b = L₃ at (2,3,5), (−2,½,3), (0.3,−0.7,0.6), (1,1,1), a complex triple | identical text; 22-term sums ≤ 8·10⁻¹⁵; A↔B swapped −0.52104, b(A/d) sign flipped 5.96106 (README −0.5210, 5.9611) | holds | none |
| `polylog`, `singleValued` | z = 2, i, 2+i; B₁ = ±½ | Im of lower-boundary sum at 2: −5·10⁻¹⁶ (B₁ = +½: −1.04623); L₄(i) = 0.98894455 = β(4); L₄*(2+i) 0.146294 vs (5/16)L₄ 0.139391 | holds | none |
| pull-request description | prose sentences 2 and 4 | colon sentence followed by "Roadmap folder …"; Dependencies sentence lists no roadmap | fails | R01 |

- Source locators: about 75 checked against the cached texts, all at the stated theorem, page and line: GR 46 (every seeded target), G08 13, M20 5, G09 5, G93 5 (OCR), G00 2, CGR 2.
- Library declarations opened at the pins: Mathlib `NumberField.dedekindZeta` (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`), `Matrix.det_isEmpty` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:97`), `riemannZeta_four` (`HurwitzZetaValues.lean:232`); Tau Ceti `Hodge/Mixed/Basic.lean:72`, `Category.lean:56`, `Abelian.lean:33`, `Strictness.lean:110`, `Tate/Basic.lean:93`; seven more by `#check`.
- Cross-roadmap citations: about 50 sections resolved at the heads of Polylogarithms, K3BlochGroups, BorelRegulators, MotivicEtaleKTheory, PeriodsAndSpecialValues, MixedHodgeModulesAndIrregularHodgeTheory, MotivesAndAlgebraicCycles, and on main (PolylogarithmFunctions, SchemeKTheoryOperations §6.7 with van der Kallen's range n ≥ 2m+1, HodgeStructures L2); the five gap slugs agree in `plan.json` and the README.
- Gate: the worker's gate passes every check; the dependency check rerun gives "depcheck: 257 roadmaps, 2447 edges, 0 problem(s)"; nothing changes outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives two `sorry` warnings only; `#check @` of all 10 declarations matches README §6.4 (the file has no section variables); `simp`, `rfl`, `infer_instance` and `aesop` close neither theorem, so nothing is padding.
- `zagierDeterminantFour` is Polylogarithms' `normalizedPeriod 4` on the complex places (exponent n(N−d) = 4(r₁+r₂)); `singleValued` keeps PolylogarithmFunctions' endpoint branches, which agree with Polylogarithms' at n = 4.
- Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory, PolylogarithmFunctions; explicit B₃, cycle predicates and Z₄ are Polylogarithms' (cited); decorated flags Polylogarithms §3.4 through gap decorated-flag-lengths (its README line 21 still names this roadmap); the weight-four theorem, L₄* and κ are this roadmap's; the B₄^comb→B₄^ind map Polylogarithms §4.6 hands here is declined in Downstream consumers and has no consumer; combinatorial associahedra here, geometric ones FukayaTheory's; scissors congruence, Hodge and motivic correlators and Grassmannian polylogarithms have no other owner (searched at all open heads and on main).
- Source independence: 25 passages compared with 7 sources, none shared beyond formulas and one forced twelve-word statement (README §5.7 against GR line 4230); largest share GR, 159 of 254 page and line locators; contents compared with GR: independent (Layer 3 draws on GR §§2, 5.2, 6 and 8.2, GR §8 is split over Layers 3 and 5, and the order is the one §3.1 → §2.5, §5.7 → §§3.14, 4.8 and §6.2 → §5.10 force).

## Not verifiable

- None: all seven cited texts were read in the sources cache; G93 only as an OCR text, in which the label of Theorem 4.5 is garbled (G93 line 814).

## Source issues

- **Error** in GR at Theorems 1.1 and 1.2, pp. 3 and 5: the source says ζ_F(4) equals the normalized determinant; for r₂ = 0 the empty determinant gives π^{4r₁}|d_F|^{−1/2}, which over ℚ is 90ζ(4); it should be a nonzero rational multiple of ζ_F(4); affects a stated result.
- **Misprint** in GR at §1.2, item 3, p. 14: the worked specialization of {t^a u, t^a v}₃,₁ for a < 0 is stated as {u/v}₄; its own computation and table (26) give 3{u/v}₄; affects nothing.
- **Error** in GR at (188), p. 77: the differential of ω on the logarithms of n units is written as π_n of the wedge of their dlog forms; with Goncharov's ω (G08 Lemma 2.3) it should carry the factor (−1)^{n−1}2^{1−n}; affects nothing.
- **Misprint** in GR at (192), p. 78: the B₃⊗Fˣ term writes log|x| times d^C L₃*(y), exchanging the symbol and unit arguments; it should be log|y| times d^C L₃*(x); affects nothing.
- **Error** in GR at Lemma 7.9, p. 72: the source says the Λ²B₂ part of the degree-seven map composed with deletion vanishes on C₈(3); it is nonzero, and only the sum with the R₇² term composed with projection vanishes; affects the proof.
- **Gap** in GR at §9.3, item 2, p. 93: from expressing the Grassmannian tetralogarithm by motivic correlators over a number field, the source infers a cochain map into the combinatorial L≤4(F) for every infinite field without constructing compatible preimages; affects a stated result.
- **Error** in M20 at §2.1.3, the example after (16), p. 18: the source concludes Cor^H(1,0,z) = −½(2πi)^{−2}L₂(z); its formula (4) gives (2πi)^{−2}L₂(1/(1−z)) = (2πi)^{−2}L₂(z); affects nothing.

## For the human reviewers

- `zagier_four_exists` for r₂ > 0: README §5.7 (lines 960–972) and the `Suggested.lean` module docstring state that three steps of the lift it rests on are proved by no cited source; GR reaches that lift only motivically (GR lines 4236–4243).
- Scope: the main source GR is cited as arXiv v5 (2026); the manifest's version note records acceptance by Annals of Mathematics, which was not checked independently.
