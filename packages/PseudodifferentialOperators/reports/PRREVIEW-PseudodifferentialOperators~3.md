# Review of PseudodifferentialOperators (pull request #952 at fefd858)

**Verdict:** needs changes

## R01 (P1) — The supplier graph still has reciprocal roadmap-level edges

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:90`–91: “K5a's distributional action and Laplace analysis consume the differential-operator core; P1.1 and P2–P7 consume K5a's analytic scale.” Also line 1709 (consumes RiemannianGeometry R4.7) against lines 453 and 488 (RiemannianGeometry R7 consumes P1.0).

**Claim:** Interleaving layers gives an admissible single direction of supply.

**Witness:** Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:45`, 575–577 and 1650–1652 consume PDO P1.0; this README consumes K5a from line 84 onward. Main `TauCetiRoadmap/RiemannianGeometry/README.md:144` and 152–154 consume PDO P1, while this README consumes R4.7 at line 1709. Two roadmap-level two-cycles. The dependency check (output below) does not model edges from main into an open folder, so its clean result does not cover them.

**Exact repair:** Unchanged from the previous two reviews: move the differential-operator core P1.0 (section modules, first jets, derivation dictionaries, higher jets, density transpose/formal adjoint, principal symbols, Laplace/Dirac type and Bochner connection) into its own roadmap folder in this pull request, placed before ComplexKahlerGeometry and RiemannianGeometry in the supply order, keep P1.1–P8 here consuming that folder, K5a and R4.7, and record in `## Scope and ownership` that the consumers' P1.0 citations now resolve to the new folder. If the author holds this not actionable in this pull request, a repair report should say so with the reason, so a human can rule; no such report exists. This is the previous R01 and the first review's R02, not repaired.

## R02 (P1) — The closed-form prerequisite remains unowned, and the only open owner would close a second cycle

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:138`: “Required OperatorTheory extension: closed forms and Friedrichs realization”; line 149: “These are prerequisite contracts, not supplied declarations”; consumed at lines 1728–1736, 1753, 1771–1773 and 1822.

**Claim:** The P7a Friedrichs identification has a supplier.

**Witness:** Main `TauCetiRoadmap/OperatorTheory/` has no closed-form or Friedrichs target (no match for those words in its README). No `design/plan.json` exists for this roadmap, so the contract is not a declared gap. The new folder `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:172` at the open OperatorTheory head does state UO-D06 with the needed representation and Friedrichs clauses, but UO-D06 consumes VariationalMethods V2.3 (same file, line 182), and the open `TauCetiRoadmap/VariationalMethods/README.md:64` consumes “PseudodifferentialOperators P5–P7”. Citing UO-D06 therefore creates PDO → UnboundedOperators → VariationalMethods → PDO.

**Exact repair:** Remove the Friedrichs identification from this roadmap: delete lines 29–33, 138–162 and 1728–1736, the clause “the exact closed-form prerequisite above” at line 1753, the sentence at lines 1771–1773 beginning “Also verify the closed-form identity”, and “the required OperatorTheory closed-form extension” at line 1822. The transplantation route needs none of it: line 1768 already says it “uses only K5a's H² realizations ... not the form representation”, and the consumer FuchsianOrbifolds L9 (open head, README line 1459) asks only for quadratic-form, Sobolev-domain, resolvent and Laplacian transport, all of which the H² route and the H¹ form identity `q_X(Jf,Jg)=q_Y(f,g)` supply. The circle test survives the repair: for exp(ikx) the operator eigenvalue and the form eigenvalue are both k², and the normalized degree-4 pullback keeps squared norm 2π/4 on both sides. If the identification is wanted later, it belongs to a Part II after OperatorTheory/UnboundedOperators is merged. This is the previous R02, not repaired.

## R03 (P3) — Locators: six blocks still have none, and one new locator states without proving

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:925`–959 (integer and p=1 endpoint embeddings), 1229–1243 (smoothing and averaging), 1336–1355 (Fredholm/solvability, Schauder, nonlinear bootstrap), 1382–1452 (powers, contour construction), 1476–1629 (equivariant product index), 1660–1673 (elliptic complexes), 1976–1979 (the two Mark courses), 707–709 (Dyatlov Lecture 7).

**Claim:** Every theorem group has a checkable legal locator.

**Witness:** The repaired head adds correct locators for P1 (KMS), 3.1 (Dyatlov), 5.3 (Bergh–Löfström), the Bochner connection (Gilkey) and P7a (Bérard); the blocks above still carry none, or only the unreadable Grubb, Grubb–Hansen and Seeley texts. The Dyatlov file is handwritten notes recognised by OCR: `dyatlov line 338`–362 shows the kernel theorem stated and the proof deferred to Hörmander and Friedlander–Joshi.

**Exact repair:** Attach theorem and page locators to each block, for example Hörmander I Theorem 5.2.1 or Friedlander–Joshi Theorem 6.1.1 (proof-bearing) beside Dyatlov for the kernel correspondence; Adams–Fournier or Brezis for the W^(k,1) endpoints and Ehrling; Atiyah–Singer I §9 or Lawson–Michelsohn III.§13 for the product index and elliptic complexes; a readable text for Seeley powers (Shubin §10–11). Identify the Mark courses by year and exercise, or drop the reference. Previous R04, partly repaired.

## R04 (P3) — Interpolation ownership: PDO is the earlier owner, NoncommutativeIntegration must consume

**Location:** `TauCetiRoadmap/PseudodifferentialOperators/README.md:22`–27.

**Claim:** P5's couples, strip quotient and K-method are the common objects for NoncommutativeIntegration §§2.2–2.4.

**Witness:** The merge order lists PseudodifferentialOperators at line 8 and NoncommutativeIntegration at line 276; the open `TauCetiRoadmap/NoncommutativeIntegration/README.md:423`–502 still constructs the same couples, complex method and K-method from Cwikel and Bergh–Löfström without citing P5.

**Exact repair:** None in this folder: the scope paragraph is the correct ownership statement for the earlier roadmap. The duplicate is a finding for NoncommutativeIntegration's review (cite P5 and keep only the Lorentz and noncommutative identifications). Recorded so that the previous R03 is dispositioned; it is no longer held against this folder.

## Verified sound

Independent AI review of the whole folder at `fefd858406e7f079b7d98be95345450ba6c19fb8`; nothing in the pull request was edited and nothing was posted.

**Previous findings (review of b09a45c), checked at this head.**

| Previous | Passage at this head | Disposition |
|---|---|---|
| R01 (P1) reciprocal edges | README:90–91 unchanged | Not repaired; current R01. |
| R02 (P1) closed-form prerequisite | README:149 “prerequisite contracts, not supplied declarations” unchanged | Not repaired; current R02 with a now-available PR-local repair. |
| R03 (P2) interpolation second owner | README:22–27 unchanged; NoncommutativeIntegration head unchanged | Dispositioned as not this folder's defect (merge order 8 versus 276); current R04 (P3). |
| R04 (P3) locators | README:185–186, 260–261, 308, 398–399, 478–482, 518, 707–709, 996–1071, 1761–1763, 1774–1776, 1786–1787 | Partly repaired: eleven new locators, all verified below; six blocks remain; current R03. |
| R05 (P3) under-tested definitions | README:622–653 (three homogeneous Checks and three cutoff Checks), 1188–1223 (three Checks each for Hölder, little Hölder, Zygmund) | Repaired. The nine new Checks were recomputed in the table below. |

**Mechanical checks.** The diff outside the folder is empty. The worker's gate at this head passes every check. The dependency check was rerun with the prescribed command and printed exactly:

```text
depcheck: 208 roadmaps, 1455 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. A scratch copy of the README with a UO-D06 citation appended also printed 0 problems (1457 edges), which shows the check does not see the VariationalMethods edge of R02; the cycle there was resolved by reading the two open heads. `lake env lean` on `Suggested.lean` exited 0 with eight `declaration uses sorry` warnings and nothing else. A scratch copy with `#check @name` for all 22 declarations elaborated with no error; the elaborated types keep `FiniteDimensional ℝ E`, `IsManifold I ∞ M`, `T2Space M`, `BoundarylessManifold I M` and `SecondCountableTopology M` on the four geometric theorems, `FiniteDimensional ℂ V`/`W` and `CompleteSpace` on the four Euclidean theorems, `Antitone` and `Tendsto atBot` on the summation theorem, `HasCompactSpatialSupport` on the Sobolev theorem, `IsUniform` on the order-zero theorem and `IsElliptic` with `ξ ≠ 0` on the inverse-symbol theorem; `derivationVectorField` drops only second countability, which its body does not use. No signature was changed. A scratch copy replacing every `sorry` by `first | rfl | simp | infer_instance | trivial | exact?` produced an error at all eight theorems (five `exact?` failures, three unsolved goals): no headline closes in one tactic, so there is no padding. No `set_option`, sorry'd data, free `Prop` stand-in, `lemma`, pull-request number or machine path is in either file.

**Headline inventory.** The README's end theorems are: P1 ideal-square, cotangent and derivation dictionaries (stated: four theorems), jets, principal symbols, Bochner decomposition and Peetre (not statable: no bundle operator or jet carrier; docstring says so); P2 Borel summation (stated) and classical principal terms; P3 manifold kernel theorem (not statable: no bundle distribution carrier; docstring says so) and Schwartz quantization (defined); P4 global classes (not statable); P5 compact-support Sobolev mapping and Calderón–Vaillancourt (stated) and interpolation/Besov/Zygmund (not statable); P6 inverse principal symbol (stated), parametrices and Fredholm theory (not statable: no bundle Sobolev scale); P7, P7a, P8 (not statable). Mathlib's `Mathlib/Analysis/Distribution/Distribution.lean:79` still lists the Schwartz kernel theorem as future work and has no tensor of test functions, so the Euclidean scalar correspondence would need a non-simple definition; the README's headline is the bundle version, so its absence is not a defect.

**Pinned-library audit** (Mathlib and Tau Ceti at the pins of `lake-manifest.json`; paths relative to each library).

| File and line | What was checked |
|---|---|
| Mathlib/Analysis/FunctionalSpaces/BesselPotentialSpace.lean:47–49, 299–304 | `BesselPotentialSpace` stores `toDistr` and an `Lp` witness; `MemSobolev.toBesselPotentialSpace` has `toDistr := f`, so `schwartzToSobolev s u` has distribution exactly the Schwartz function's. |
| Mathlib/Analysis/Distribution/Sobolev.lean:205 | `SchwartzMap.memSobolev` for every real s and p ≥ 1. |
| Mathlib/Analysis/Distribution/TemperedDistribution.lean:53, 98–104 | `𝓢'(E,F) = 𝓢(E,ℂ) →L[ℂ] F` and `toTemperedDistribution μ hf g = ∫ g x • f x`: the pairing is bilinear, no conjugate, matching the two Lean pairings `∫ φ x • quantizeSchwartzValue a u x`. |
| Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean:51, 102 | `fourierTransformCLM 𝕜 f = 𝓕 f`, Mathlib's negative 2π phase; with ξ = 2πζ the Lean integral equals the README's angular formula (rows below). |
| Mathlib/Analysis/Distribution/Distribution.lean:1–110 | Real test functions, vector values, compact-convergence topology; kernel theorem absent. |
| TauCeti/Geometry/Manifold/DerivationBundle.lean:106, 163, 193 (private), 309, 351, 446–456 | The three Hadamard/chart helpers are private as the README says; `congr_of_eventuallyEq`, `tangentToPointDerivation_mfderiv`, `pointDerivationEquivTangentSpace` (finite-dimensional, `T2Space`, interior point) exist with the stated hypotheses. |
| Mathlib/RingTheory/Ideal/Cotangent.lean:52 | `Ideal.toCotangent` is the quotient map. |
| Mathlib/Analysis/Calculus/DiffContOnCl.lean:31; Mathlib/Analysis/Complex/Hadamard.lean | `DiffContOnCl`, `verticalClosedStrip`, `norm_le_interp_of_mem_verticalClosedStrip'`. |
| Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean; TauCeti/Analysis/Fredholm/SmallPerturbation.lean | `IsFredholm.eventually_nhds_index_eq`, `index_continuousOn_isFredholm`, `exists_pos_isFredholm_and_index_eq_of_norm_sub_lt`. |
| TauCeti/Analysis/InnerProductSpace/Spectrum.lean; Mathlib/Analysis/InnerProductSpace/Spectrum.lean | `exists_hilbertBasis_forall_hasEigenvector`, `IsSymmetric.conj_eigenvalue_eq_self`. |
| Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean | `eLpNorm_le_eLpNorm_fderiv_of_eq`. |
| Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean; VectorField/LieBracket.lean; CovariantDerivative/LeviCivita.lean; Algebra/Structures.lean | `ContMDiff.smul_section`, `mlieBracket`, `ContDiff.mlieBracket_vectorField`, `mlieBracket_smul_right`, `leviCivitaConnection`, `ContMDiffRing`. |
| TauCeti/Analysis/Sobolev/RellichKondrachov.lean; W1p/Extension.lean | `W1p0.isCompactOperator_valueL`, `norm_extendByZeroL` (zero-boundary versions, as the README states). |
| Mathlib/RepresentationTheory/Induced.lean; TauCeti/RepresentationTheory/Induction/Permutation.lean | `indResAdjunction`, `indTrivialIso`. |

**Cross-roadmap citations resolved** (main at 9c6e95d; open heads where named).

| Citation | Where it resolves |
|---|---|
| DifferentialGeometry Layers 0–1, 5 | main README, layer headings present. |
| SmoothBundlesConnections B2–B4 | open head `README.md:559`–802 (B2.1–B2.5), B3, B4; earlier in the merge order (line 7). |
| ComplexKahlerGeometry K5a | main `README.md:33`–51 and the K5 section; return edge is R01. |
| PDE Lane A.3–A.7, Lane B 8–10 | main `README.md:223` (Lane A) and 265 (Lane B). |
| HopfRinow Layer 1 | main README. |
| RepresentationTheory/CompactGroups Layers 0–3 | main README. |
| TopologicalKTheory T6.1–T6.2 | main `README.md:962` “T6. Equivariant K-theory and associated-bundle products”. |
| VonNeumannAlgebras V2 | open head `README.md:93`, 554–565 (completed Hilbert tensors, L² product unitary); merge order line 4. |
| RiemannianGeometry R4.7 | main `README.md:607` (R4); return edge is R01. |
| InductionRestriction Layer 2.1, `Gassmann.almostConjugate_iff_permutation_equiv` | main `README.md:346`; `Suggested.lean:728` in namespace `…InductionRestriction.Gassmann`, so the resolver's lead is not a finding. |
| OperatorTheory extension | absent on main; R02. |
| Consumers LieGroupoidsPoisson G1.1, ContactGeometry CG5, IndexTheory, FuchsianOrbifolds L9, VariationalMethods | open heads `LieGroupoidsPoisson/README.md:345`, main `SymplecticGeometry/ContactGeometry/README.md:207`, open `IndexTheory/README.md:63`, open `FuchsianOrbifolds/README.md:152`, 1459; open `VariationalMethods/README.md:64`. |

**Seeded sample and new locators.** Line numbers are those of the sources-cache extractions.

| Target | Locator read | Result |
|---|---|---|
| 1.2 Peetre | kms line 7828–7834, printed p. 176 (header at line 7796), proof on p. 177 | Statement matches the README word for word in content: linear support non-increasing operator, for every compact K an r with j^r equality implying equal values on K; no continuity assumed. |
| P1 ideal square, germs, factorization | kms line 325–404, pp. 5–6 (partitions of unity at 331–334, germs §1.4, integral Hadamard factorization at 363–378) | Supports the inputs cited. |
| P1 derivations | kms line 822–825, p. 16 | Lemma 3.3: vector fields = derivations of C∞(M,ℝ). |
| P1 jets | kms line 5318 (p. 117), 5357 (p. 118), 5638 (p. 124), 5687 (p. 125) | Jet definition, coordinates, prolongation of fibred manifolds, `J^rE` a vector bundle. |
| P1 Bochner | gilkey line 102–110, printed p. 289 (header line 83) | Lemma 2.1 unique connection and endomorphism with ω_ν = ½(g_{νμ}a^μ + Γ term); self-adjoint iff ∇ unitary and E self-adjoint, in the sentences after the lemma. |
| 2.1 symbols | taylor line 153, p. 5 | (1.15) S^m_{ρ,δ} estimate with ⟨ξ⟩. |
| 2.2 classical, Borel | taylor line 158, p. 5; melrose line 436–438 (p. 39), 468–519 (p. 40) | (1.17) and Proposition 2.3 with (2.55)–(2.57): uniform symbols of orders m−j, as the README says. |
| 3.1 kernel theorem | dyatlov line 338–362 (OCR, p. 11) | Statement A: C_c^∞(V) → D′(U) with kernel in D′(U×V) legible; proof deferred to Hörmander and Friedlander–Joshi (R03). |
| 3.1 Fourier convention | taylor line 82–94, p. 3 | (1.1) quantization formula. |
| 3.2 amplitudes | taylor line 193–219, pp. 6–7 | (1.21)–(1.28). |
| 4.1 composition, adjoints | taylor line 245–250 (p. 7), 261–279 (p. 8) | (2.3), (2.5)–(2.7); i^{|α|}D_ξ^αD_x^α equals (1/i)^{|α|}∂_ξ^α∂_x^α. |
| 5.1 mapping | taylor line 320 (p. 9), 441–443 (p. 12) | (3.1) L² bound for S^0_{ρ,δ}, (3.31) H^s → H^{s−m}. |
| 5.3 interpolation | bl line 917 (p. 24), 1384 (p. 40), 1570 (p. 47), 2667–2679 (p. 88), 3200–3233 (pp. 106–107), 3601 (p. 122), 4398 (p. 151), 4441–4458 (pp. 152–153) | Lemma 2.3.1, Theorems 3.1.2, 3.4.2, Lemma 4.1.1, Theorems 4.1.2, 5.1.1–5.1.2, 5.6.1, 6.4.3 and 6.4.5 with formulas (4) and (7) as cited. |
| 5.4 Zygmund | taylor line 445–450, p. 12 | (3.32)–(3.34). |
| 6.1 parametrices | taylor line 478–502, pp. 13–14 | (4.1) uniform inverse bound for |ξ| ≥ K, (4.6) two-sided parametrix. |
| 6.2 regularity | taylor line 509–525, pp. 14–15 | (4.7)–(4.11). |
| 7.1 powers | grubb_hansen, seeley | Not readable (below). |
| 7.2, 7.3, 5.2, 5.5 | none | R03. |
| 8.1–8.2 transplantation | berard line 222–227 (Théorème 14, p. 158), 237–240 (Lemme 16, p. 159), 241–253 (Théorème 17, p. 159), 254–272 (Commentaires 18 (i)–(iv), p. 159) | Isometric transplantation, pullback isometries onto H-invariants, Sunada isospectrality by min–max, Sobolev and Laplacian-commutation remarks; the H² domain equality is the README's own addition, as it says. |
| 9.1 wavefront | taylor line 781–799, p. 22 | Proposition 7.3, Corollary 7.4, (7.7). |
| 9.2 pullback, products, pushforward | bdh line 121 (Proposition 5.1, p. 4 of the extraction), 500 (Theorem 4.6), 769 (Theorem 6.3), 914 (Theorem 6.1) | Present at the cited theorem numbers. |

**Computed adversarial pass.** Each row records an instance and the values on both sides; “pass” refers to the instance only.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Fourier change of frequency (README 50, 57; Lean `quantizeSchwartzValue`) | ξ = 2πζ, n = 1 | (2π)^{−1}dξ = dζ; both phases e^{2πixζ}; integrand a(x,2πζ)𝓕u(ζ) | Pass. |
| Symbol of ∂_j (README 60) | u = e^{ixξ} | ∂u = iξu; D = −i∂ gives ξu | Pass. |
| Adjoint convention (README 63) | P = ∂ | σ_geom(−∂) = −ξ = (−1)^1·ξ; σ_F(−∂) = −iξ = conj(iξ) | Pass. |
| Check 3.1, a = 1 | u = e^{−x²}, x = 0 | ∫𝓕u = u(0) = 1 | Pass. |
| Check 3.1, a = ξ | u = e^{−x²}, x = 1 | Op(ξ)u = −iu′ = −i(−2/e) = 2i/e | Pass. |
| Example 3 (README 774) | same u | 2ix e^{−x²} | Pass. |
| Lean `Symbol.derivative_bound` weight | m = 1, |β| = 1, ξ = 0 and ξ = 2 | (1+0)^0 = 1; (1+4)^0 = 1: ∂_ξ ξ = 1 bounded | Pass. |
| Check 2.1 order of ξ | ξ = k | |k| ≤ ⟨k⟩; no order-0 bound since k → ∞ | Pass. |
| Check 2.1 local versus uniform | a = x, K = [−R,R] | sup_K |x| = R; sup over ℝ = ∞; `IsUniform` fails, local bound holds | Pass. |
| `HasCompactSpatialSupport` | a = χ(x)ξ; a = 1, n = 1 | support supp χ compact; for a = 1 every x gives 1 ≠ 0 | Pass. |
| Homogeneity Check (README 630) | ξ², t = 2 at ξ = 1 | 4 = 2²·1; degree 1 would give 2 | Pass. |
| Homogeneity parity Check (README 633) | |ξ|, degree 1 | |2·1| = 2 = 2·|1|; values at ±1 both 1 | Pass; positive homogeneity does not force oddness. |
| Cutoff model (README 646) | h(t) = e^{−1/t}, radii 1, 3/2, 2 | h(0)/(h(0)+h(1)) = 0; h(½)/(2h(½)) = ½; h(1)/(h(1)+h(0)) = 1 | Pass; denominator positive since |ξ| ≤ 1 and |ξ| ≥ 2 exclude each other. |
| Step negative control (README 650) | step at 3/2 | one-sided limits 0 and 1 | Excluded by smoothness. |
| Overshoot negative control (README 652) | χ + 4χ(1−χ) at χ = ½ | ½ + 4·¼ = 3/2 > 1 | Excluded by range. |
| `FrequencyCutoff` constants | constant 1; constant 0 | 1 violates `zero_near_origin` at ξ = 0; 0 violates `one_at_infinity` at |ξ| = 2 | Pass. |
| Classical remainder (README 663) | a = ξ²+1, N = 3 | terms ξ², 0, 1; remainder (1−χ)(ξ²+1) | Pass, compact frequency support. |
| Classical remainder a = ξ (README 666) | N ≥ 1, ξ = 3 and ξ = 1 | (1−χ(3))·3 = 0; (1−χ(1))·1 = 1 | Pass; smoothing remainder nonzero allowed. |
| Borel trivial sequence (README 665) | a₀ = 1, rest 0 | remainders 1 at N = 0, 0 for N ≥ 1 | Pass. |
| Borel equal orders (README 671) | a₀ = 1, a₁ = 2, orders 0,0,−1,… | b = 3; remainders 3, 2, 0 | Pass; `Antitone` admits equal orders. |
| Borel non-convergent series (README 674) | r = ⟨ξ⟩, a_j = (−1)^j r^{−j−1} | Σ_{j<N} a_j = (1−(−1)^N r^{−N})/(r+1); b − Σ = (−1)^N r^{−N}/(r+1); at ξ = 0: ½, −½, ½ | Pass; remainder order −N−1. |
| Borel limit hypothesis | all orders 0, all a_j = 0 | b = 0 and b = 1 both have order-0 remainders; difference 1 not smoothing | `Tendsto atBot` needed for uniqueness; stated. |
| `exists_asymptoticSum` at N = 0 | any a | r = b of order orders 0 | Pass, trivially. |
| Non-integer class (README 669) | ⟨ξ⟩^{1/2}+1 | constant 1 is not O(⟨ξ⟩^{−1/2}) | Pass. |
| Ellipticity Check (README 1301) | ξ² at ξ = 2 | inverse ¼; both products 1; value 0 at ξ = 0 | Pass. |
| Ellipticity rank (README 1303) | n = 0, V = ℂ, W = 0 | no nonzero covector; `IsElliptic` vacuous; ranks 1 ≠ 0 | Pass; README limits rank equality to positive dimension. |
| `exists_inversePrincipalSymbol` at n = 0 | any a | b = 0 works vacuously | Degenerate, true, not a defect. |
| Zero fibers | V = W = 0 | all coefficients 0; both inverse equations 0 = 0 | Pass. |
| Parametrix Check (README 1306) | P = 1−∂², circle | Q multiplier 1/(1+k²); PQ = QP = 1 at every k including 0 | Pass. |
| Kernel Checks (README 762–766) | identity; K ≡ 1; e^{−(x−y)²} at (0,1) | δ on diagonal; ∫φ = 1 gives constant 1; e^{−1} | Pass. |
| Composition Check (README 802) | ξ#x, x#ξ | xξ − i; xξ; [D,x] = −i | Pass. |
| Matrix composition Check (README 803) | e₁₂, e₂₁ | e₁₁, e₂₂; commutator diag(1,−1) | Pass; order does not drop. |
| Adjoint Check (README 805) | p = e^{ix}ξ | p* ∼ e^{−ix}ξ + (1/i)∂_ξ∂_x(e^{−ix}ξ) = e^{−ix}(ξ−1) | Pass. |
| Coordinate change (README 818, 865) | y = eˣ, f = x | −y²∂_y² = −∂_x² + ∂_x; on x: 1 versus 0 | Pass; difference order 1. |
| Output support (README 867) | a = χ(x), K ⊋ supp χ | Op = multiplication by χ; identity symbol has output outside proper K | Pass. |
| Square partition (README 869) | χ₁ = χ₂ = 1/√2 | Σχ² = 1; Σχ = √2 | Pass. |
| Uniform order zero (README 913) | a = 2·id | T = 2·id, norm 2 | Pass. |
| Local not L² bounded (README 917) | a = x, bump translated by k | input norm 1, output ≥ k | Pass. |
| Native Bessel weight | angular ξ = 2π, t = 1 | native √2; angular √(1+4π²) | Equivalent norms, not equal; README says so (1446). |
| Interval derivative (README 969) | f = 1 on (0,1) | H¹ norm 1, Df = 0, traces (1,1) | Pass: H¹ not H¹₀. |
| Unboundedness (README 971) | e^{λx}, λ = 1, 2 | ratios 1, 2 | Pass. |
| Critical p = 1 noncompactness (README 973) | φ(x/ε), r = n | ‖∂^nφ(·/ε)‖₁ = ε^{−n}ε^{n}‖∂^nφ‖₁ constant; sup constant | Pass. |
| W^{1,∞} density (README 976) | |x| | weak derivative sign x; any smooth g has ‖g′ − sign‖_∞ ≥ 1 | Pass. |
| Embedding exponents (README 945) | n = 3, r = 1 | n/(n−r) = 3/2 | Pass. |
| HLS exponent (README 1113) | n = 3, p = 2, δ = 1 | 1/q = 1/2 − 1/3 = 1/6 | Pass. |
| Compact margin (README 1116) | p = q = 2, mode N, gain δ | ratio N^{−δ} → 0; δ = 0 ratio 1 | Pass. |
| Morrey (README 1130) | n = 3, k = 2, p = 2 | 2 − 3/2 = ½ | Pass. |
| Integer Morrey (README 1131) | n = 2, k = p = 2 | 2 − 1 = 1; C^{0,β}, β < 1 | Pass. |
| Shear (README 1133) | φ(x,y) = (x, y+x³) | det dφ = 1; extra term 3x²∂_yf, growth 3k² | Pass. |
| Couple norms (README 1028) | (ℂ,ℂ), z = 1 | max = 1, inf = 1; sum without infimum 2 | Pass. |
| Strip quotient (README 1030) | F = e^{δ(z−θ)²} | F(θ) = 1; boundary norms → 1 as δ → 0; three lines gives ≥ 1 | Pass. |
| Asymmetric couple (README 1033) | second norm doubled, θ = ¼ | 2^{1/4}; reversed 2^{3/4} | Pass. |
| K-functional (README 1052) | t = ¼, 1, 4 | min(1,t): ¼, 1, 1 | Pass. |
| Real norm (README 1053) | θ = ½, q = 2 | ∫₀¹1 + ∫₁^∞ t^{−2} = 2, norm √2 | Pass. |
| Real norm q = ∞ (README 1055) | θ = ½ | sup t^{−1/2}min(1,t) = 1; z = 0 gives 0 | Pass. |
| Exponents (README 1014, 1086) | s₀ = 0, s₁ = 2, p₀ = 2, p₁ = 4, θ = ½; θ = ¼ | s = 1, 1/p = 3/8; s = ½ | Pass. |
| Besov block (README 1084) | j = 2, s: 0 → 1 | 2^{js}: 1 → 4 | Pass. |
| Besov q index (README 1087) | N unit coefficients | ℓ¹ = N, ℓ^∞ = 1 | Pass. |
| Hölder Checks (README 1190–1195) | constant 1; |x|^α; |x|^β, β < α, h = 1/16, α = ¾, β = ¼ | norm 1 (seminorm 0); quotient 1; (1/16)^{−1/2} = 4 | Pass. |
| Little Hölder Checks (README 1199–1206) | α-cusp; smooth f; |x|^β, α = ¼, β = ¾, h = 1/16 | quotient 1 at all scales; ≤ C|h|^{1−α} → 0; (1/16)^{1/2} = ¼ → 0 | Pass. |
| Zygmund Checks (README 1210–1218) | constant 1; block j = 2; δ₀ on ℝ | low block 1, annuli 0; 2^{2r} = 1, 4; blocks c·2^j = 2c, 4c; weight 2^{−j} gives c, c | Pass: δ₀ ∈ C^{−1}_*, ∉ C⁰_*. |
| Ehrling (README 1222) | constant section, ε = ½ | 1 ≤ ½ + C_ε needs C_ε ≥ ½ | Pass. |
| Nonlinear bootstrap (README 1364) | n = 4, p = 3 | 1/12 = 1/3 − 1/4; 1/6 = 2/12; 1 − 4/6 = 1/3 | Pass. |
| Compact multiplier (README 1253) | (1+k²)^{−1/2} | → 0; identity eigenvalues 1 | Pass. |
| Averaging (README 1255–1257) | trivial group; reflection on x | T ↦ T; (x − x)/2 = 0; (1+1)/2 = 1 | Pass. |
| Solvability (README 1359) | circle, Δu = 1 | mean of 1 is 2π ≠ 0 | Pass. |
| Spectral powers (README 1463) | k = 0, 1, 2 | 1, 2, 5; inverse roots 1, 1/√2, 1/√5 | Pass. |
| Resolvent homogeneity (README 1465) | (ξ,λ) → (2ξ,4λ) | (4ξ²−4λ)^{−1} = ¼(ξ²−λ)^{−1} | Pass. |
| Low-frequency resolvent (README 1467) | ξ = 0, λ = −1, −2 | 1; ½ | Pass. |
| Product Laplacian (README 1469, 1543) | (k,l) = (1,2) | 2 + 5 − 1 = 6 = 1 + 1 + 4 | Pass. |
| Product symbol (README 1523, 1640) | σ_P = ξ, σ_Q = η at (3,4) | A*A = 25·I, cross term −12+12 = 0; plus sign gives off-diagonal 24 | Pass. |
| Cutoff lower bound (README 1642) | unit cosphere | one of |ξ|², |η|² ≥ ½ so a cutoff is 1; A_χ*A_χ ≥ ½ I; at (1,0) equals I | Pass. |
| Torus cutoff Check (README 1644–1650) | P = e^{ix}D_x, ε = ¼, R = 4, modes (2,16), (3,16) | 16·4/260 = 16/65 < ¼ gives f = 0; 16·9/265 = 144/265 > ½ gives f = 1; radii √260, √265 > 8; cut-off P* coefficient 2·1 = 2; adjoint of cut-off P coefficient 2·f(2,16) = 0 | Pass as negative control; no self-adjointness of D_ε claimed. |
| Product kernels (README 1626, 1651) | (ker,coker) = (2,1), (3,2) | even 2·3 + 1·2 = 8; odd 1·3 + 2·2 = 7; 8 − 7 = 1 = (2−1)(3−2) | Pass. |
| Normalization symbol (README 1518) | scalar p = 2ξ | p(p*p)^{−1/2}|ξ| = ξ; squares ξ² | Pass. |
| Elliptic complex Checks (README 1683–1687) | circle, ξ = 1 and 0; k = 1, 2; zero complement | map i exact, 0 at ξ = 0; Green 1, ¼, ΔG = 1; G = 0 | Pass. |
| Bochner connection (README 486, 503) | w = e^{sin x}, D = ∂ | ∂* = −∂ − cos x; D*D = −∂² − cos x·∂; Gilkey ω = ½a = ½cos x; metric test on 1: 0 versus 2·½cos 0 = 1 | Pass; matches Gilkey's formula. |
| Laplace rescaling (README 502) | −2∂²; −∂⁴ | c = 2, value 8 at ξ = 2; order 4 excluded | Pass. |
| Dirac square (README 501) | ∂ on line, dx | D*D = −∂², σ_F(2) = 4 | Pass. |
| Symbol signs (README 464) | ∂² at ξ = 2 | σ_geom = 4, σ_F = −4 = i²·4 | Pass. |
| Rough Laplacian (README 465) | circle, exp(ikx) | k²: 0, 1, 4 | Pass. |
| Commutator Checks (README 420, 386) | [[∂²,x],x]; third commutator | 2·Id, divided by 2! gives 1; 0 | Pass. |
| Formal adjoint Check (README 423) | P = x∂, dx | P* = −x̄∂ − 1, zeroth term −1 | Pass. |
| Splitting Check (README 385) | D = ∂+3, x = 2 | D(x²) = 4 + 12 = 16 | Pass. |
| Complex dictionary Check (README 365) | δ = ∂ + 2i∂, f = x² + ix, x = 3 | 6 − 2 + 13i = 4 + 13i = (1+2i)(6+i) | Pass. |
| Bracket Check (README 327) | [x∂,∂] on x | −1; reversed +1 | Pass. |
| First-jet Checks (README 284–288) | t², t²+(t−1)² at 1; d → d + a dt on 1 | (1,2) both; f″ = 2, g″ = 4; (1,0) → (1,a) | Pass. |
| Section module Check (README 248) | f = 2+x, s = x at 3 | 15 versus 6 | Pass. |
| Ideal Checks (README 216–219) | t², t at 0; discrete base | t² ∈ I₀², t ∉; e² = e, I_x² = I_x, cotangent 0 | Pass. |
| `mem_smoothVanishingIdeal_sq_iff` both directions | fg with f(x) = g(x) = 0; f with f(x) = 0, df_x = 0 | d(fg)_x = 0; Hadamard with nested cutoffs gives finite sum in I_x·I_x, residual (1−χ)f ∈ I_x·I_x | Pass; needs T2 for bump functions, present. |
| Peetre Check (README 527) | ∂^j on jth circle | orders j; compact sets meet finitely many | Pass; no global bound. |
| P7a left action (README 1714) | S₃, q = (12), r = (23), f = δ_e | with the inverse, q·(r·δ_e) = δ_{qr} = (qr)·δ_e; without it, q·(r·f)(x) = f(rqx), a right action, and (12)(23) = (123) ≠ (132) = (23)(12) | Pass; the inverse is essential. |
| P7a normalization (README 1760, 1802) | degree d circle cover, f = 1 | ‖π*1‖² = 2π = d·(2π/d); J factor d^{−1/2}, d = 4 gives ½ | Pass; matches Bérard Lemma 16 after his degree-weighted norm. |
| P7a eigenvalue transport (README 1805) | invariant mode k = dj | d²j² both sides; k = 1 not invariant for d > 1 | Pass. |
| S₃ permutation characters (README 1807) | H = ⟨(12)⟩, K = ⟨(23)⟩ | fixed cosets 3, 1, 0 on e, transpositions, 3-cycles for both | Pass. |
| Closed-form Checks (README 156–162) | q = conj(u)v, j = id, α = 1, 2; circle energy form; H = 0 | A = id both shifts; −∂² with eigenvalues 0, 1, 4 at k = 0, 1, 2; dom {0} | Mathematics passes; supplier is R02. |
| Supplier cycle control (R01) | edges PDO→CKG, CKG→PDO; PDO→RG, RG→PDO | each path of length 2 returns | Fail: R01. |
| UO-D06 cycle control (R02) | edges PDO→UO-D06→VM V2.3; VM V5.3→PDO P5–P7 | path of length 3 returns | Fail if cited: R02 repair deletes the dependency. |
| Wavefront Checks (README 1849–1852) | 1; δ₀; δ(x) on ℝ² | WF ∅; {(0,ξ): ξ ≠ 0}; {(0,x₂;ξ,0): ξ ≠ 0} | Pass. |
| Pullback Checks (README 1899–1911) | projection; diagonal; δ₀⊗1; constant map; identity | (df)*η = (η,0), normal set ∅; (η,−η) ↦ 0 fails; covectors (ξ,0); f_*u = δ₀ from empty WF; ⟨u,φ⟩ | Pass. |
| Source control taylor (1.14) | eigenvalue −1 of Δ | ∫₀^∞ e^{−t}dt = 1 versus Δ^{−1} eigenvalue −1 | Source misprint (below). |
| Source control taylor (2.8) | m₁ = 0, m₂ = 2, p₁ = sin x, p₂ = ξ² | commutator 2iξcos x has order 1 = m₁+m₂−1; printed m₁+m₁−1 = −1 | Source misprint (below). |
| Source control taylor (2.9) | p₁ = p₂ = ξ(A + sin x·B), [A,B] ≠ 0 | true commutator 0; printed formula gives (1/i)ξcos x[A,B], order 1 ≠ m₁+m₂−2 | Source error; README 794–798 keeps the ordered form. |

## Not verifiable

- **grubb** (Distributions and Operators, chapter 8), **grubb_hansen** (Definition 2.1, §4) and **seeley** (pp. 288–307): the previous review's fetch attempts timed out or reached landing pages, and no new legal copy was located this round; the weakly parametric seminorm convention at README 1423–1431 and the contour construction are not source-certified.
- **mark_index, mark_riemann**: no identifiable edition, year or exercise; the sentence at README 1976–1979 cannot be checked.
- **pde_discussion** (Zulip): design context, not a mathematical source; not re-fetched.
- **berard** p. 158: the displayed definition of the quotient Sobolev norm after “15. Application” is lost in both the cached extraction and a fresh pdftotext of pages 7–8 (`berard line 231`–234 end mid-formula). The README's remark that his norms incorporate the covering degree is consistent with Lemme 16's isometry claim but was not read literally.
- **dyatlov** Lecture 7 is an image-only handwritten scan recognised by OCR; the statement's shape on p. 11 is legible, the surrounding text largely is not.
- RelativisticQuantumFieldTheory RQFT5–RQFT6: the brief supplies no files for it and it is absent from main; its consumer text was not read. The two VonNeumannAlgebras heads were both opened; V2 is in the merge-order one.

## Source issues

- **Misprint** in taylor at I.(1.14), printed p. 5: the source says the inverse of its nonpositive Laplacian is the integral of the heat semigroup over positive time; it should carry a minus sign, since the mode with eigenvalue −1 integrates to +1; affects the proof.
- **Misprint** in taylor at I.(2.8), printed p. 8: the source says the commutator has order m₁+m₁−1; it should be m₁+m₂−1; affects a stated result.
- **Error** in taylor at I.(2.9), printed p. 8: the source says commuting matrix symbols give the scalar Poisson-bracket form of the commutator symbol; it should be the ordered difference of derivative products unless the derivative factors commute; affects a stated result.
