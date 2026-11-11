# Repair findings: YangMillsConnectionsAndCaloricGauge

The changes are in `packages/YangMillsConnectionsAndCaloricGauge/README.md`, `Suggested.lean`, `sources.toml`, and the top-level gaps list of `design/plan.json`. Target section numbers are preserved. The computations below are a mathematical audit, not an independent acceptance review or a claim that the planned analytic theorems have been formalised.

## RT-YangMillsConnectionsAndCaloricGauge~1a/F01 (P2) — applied

“Zero envelope majorizes only zero data” → all homogeneous blocks vanish; this means zero only in a realised space or as a quotient class. Added the constant-one counterexample and its exclusion from 𝒮′_h in §8.1. PDE §7.1 explicitly computes these blocks; the new realisation paragraph supplies the zero-detection argument.

## RT-YangMillsConnectionsAndCaloricGauge~1a/F02 (P2) — applied differently

Undefined local Besov notation → a restriction space with infimum extension norm, quotient/completeness and cutoff-independence targets, and constant, zero-extension and logarithmic-gauge Checks in §4.3. OhTataru-TopClass line 1495 uses an extension. Verification also exposed PDE's omitted inhomogeneous annulus; gap:inhomogeneous-besov-partition records the necessary supplier correction. The local norm uses that consistent partition.

## RT-YangMillsConnectionsAndCaloricGauge~1a/F03 (P3) — applied

Unqualified strictness → X ≠ 0 in both §1.5 Checks; the zero case is explicit. In §6.3 strictness requires positive energy in both dualities and is measured by 2 min(I₊, I₋). Recomputed the zero and I₊ = I₋ = 1 cases. No Lean padding was added.

## RT-YangMillsConnectionsAndCaloricGauge~1a/F04 (P2) — applied

Exponent equation alone → finite p* plus the exponent equation before every asserted embedding property in the Tau Ceti contract. The pin's `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:264` explicitly requires p* ≠ ∞. Added the valid (4,2,4) instance and excluded (4,4,∞) logarithmic-truncation Check in §8.1.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F01 (P1) — applied differently

Curvewise C¹ → explicit Fréchet differentiability, open locally Q-bounded domains, and operator-norm continuity targets in §9.5. §10.2 represents O − 1 in a specified C₀ graph Banach space, with derivative and resolvent targets. §§9.5, 10.2, 10.4 contain numerical negative controls. The source's curve argument is distinguished from the additional uniform estimate required here.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F02 (P1) — applied differently

An overclaimed PDE import → §8.1's homogeneous product target, series convergence, estimates, and endpoint Checks. Updated the contract and all consumers in §§9.5, 10.4–10.5 and layer dependencies. Separation by four, with remainder indices differing by at most three, respects the actual block supports. Negative-regularity multiplication is constructed by continuity, rather than assumed pointwise.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F03 (P3) — applied

PDE supplies every-index heat estimates and realised Besov spaces → PDE supplies positive-index heat estimates and homogeneous quotients. §8.1 proves the dilation extension and the unique representative theorem, including the ℓ¹ critical endpoint. Updated §8.4's usage through its §8.1 dependency. The shell Check now uses limiting block symbols, rather than exact equality throughout a shell.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F04 (P3) — applied

“§5.2 forces B = 0” → local Coulomb estimates give zero potentials; constant transitions trivialise on simply connected Euclidean space. Repaired the §5.2 Check and §10.1 route and Needs. §10.1 now cites §§3.3, 4.1, 4.3, 8.1. The local Besov continuity step names OhTataru-TopClass Lemma 3.16 as well as Lemma 3.17.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F05 (P3) — applied

“Every connection with finite critical curvature extends” → connections with a global potential on the stated enlarged punctured ball. Added the U(1) monopole Check with explicit spherewise Hölder bound and logarithmically divergent radial integral. This agrees with the global-potential assumption at OhTataru-TopClass line 1398.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F06 (P3) — applied

The shared Besov issue is repaired under RT-YangMillsConnectionsAndCaloricGauge~1a/F02. §4.3 now identifies the logarithmic map explicitly and uses the restriction norm. “Separated balls” in §3.3 → positively separated centres and bounded overlap. These changes also enter §4's dependencies and §10.1's continuity route.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F07 (P3) — not actionable in this package: eliminating the second owner requires editing FourManifolds

The overlap is real: `TauCetiRoadmap/FourManifolds/README.md` §5.3 at its supplied head plans the unit-ball SU(2) theorem. This roadmap precedes it in `merge-order/ORDER.txt` (13 versus 135). Scope now identifies this roadmap's Euclidean ownership. FourManifolds must cite the specialisation and retain its manifold transport and compactification. Its targets cannot be changed by editing this package.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F08 (P3) — applied

Layer summaries now include the actual Needs: Layer 5 includes §1.3; Layer 6 includes §3.2; Layer 9 includes §1.3 and PDE §1.4; Layer 10 includes Layers 3–4 for §10.1. The build paragraph agrees. Homogeneous product dependencies point to §8.1, and §4 includes the restriction-space supplier gap.

## RT-YangMillsConnectionsAndCaloricGauge~1b/F09 (P3) — applied differently

“Write J … is an interval” → “Here J … is an interval.” Retained the lower-case title: the requested capitalisation conflicts with the brief's explicit `# Roadmap: <lower-case title>` requirement. This is a style conflict, not a mathematical defect.

## Source and ownership evidence

The legal cached texts used to resolve the substantive findings are:

| Claim | Exact evidence read | Consequence |
| --- | --- | --- |
| Puncture removal needs a global potential | OhTataru-TopClass line 1398, Theorem 3.12 | The Check retains the theorem's hypothesis. |
| Local summable regularity and continuity | OhTataru-TopClass line 1474, Lemma 3.16; line 1487, Lemma 3.17; line 1495 | The norm is defined by extensions, with a quotient construction; zero extension is not imposed. |
| Differentiability of the flat limit | OhTataru-YMHF line 2514 and line 2552, Lemma 5.33 | The statement says C¹, but the displayed proof varies one parameter; the roadmap separately owns the required uniform operator estimate. |
| Improved flat regularity and normalised gauge derivative | OhTataru-YMHF line 3053, line 3065, line 3069, line 3074 | The elliptic equation determines ψ, its normalisation excludes constants, and the displayed derivative has the stated gauge sign. |
| Divergence norm for the derivative of Cal | OhTataru-YMHF line 3082 | Its ℓ¹L² norm is part of the Fréchet target, not just the Ḣ¹ norm. |
| Higher regularity and caloric chart | OhTataru-YMHF line 3275 and line 3294; chart at line 3305 | The higher topology and Banach manifold claim remain; the curve argument is not substituted for the operator-norm target. |
| Bilinear theory used by the source | OhTataru-YMHF line 2287 | This use is not itself a statement of the two missing product bounds; §8.1 states and gives their dyadic route. |
| Pointwise and integrated duality identities | OhTataru-TopClass line 901; OhTataru-Threshold line 237 | Positivity is needed only for the strict Checks. |

`BahouriCheminDanchin-FourierAnalysis` was fetched through the sources service under its sole manifest key. The service recorded it as uncertified/paywalled. Definition 2.68, Proposition 2.71 and Theorems 2.82, 2.85 are cited by locator only; no book text was obtained or guessed. The product argument and representative argument are explicitly given in the roadmap. Previously settled uncertified works remain settled and were not requested again. There is no outstanding missing-source request.

Main-branch PDE §7.1 defines ψ(ξ) = χ(ξ/2) − χ(ξ), P₀ = χ(D), and Pⱼ = ψ(2⁻ʲD) for j ≥ 1. Summing these written symbols gives 1 + χ(ξ) − χ(ξ/2), not 1. At |ξ| = 2 this is 0. The consistent partition Δ₋₁ = χ(D), Δⱼ = ψ(2⁻ʲD), j ≥ 0, gives 0 + 1 = 1 there. The new supplier gap requests this correction with the existing Besov completeness and cutoff comparisons. This is a prerequisite for the local carrier finding; it does not silently change PDE or claim it supplies a corrected target already. Only the top-level gaps list in `design/plan.json` changed; a structural comparison verified all other top-level data are identical.

Ownership was searched by object using `roadmaps grep`, the board packages, main, and the supplied sibling heads. PDE §7.3 owns inhomogeneous Hölder–Besov estimates, whereas the new §8.1 targets are homogeneous products on the already owned realised four-dimensional spaces. The restriction construction of §4.3 is the local interpretation needed for the existing nonlinear gauge-continuity target, using PDE's whole-space carrier. There is no duplicate construction of the supplier's whole-space Besov space. RiemannianGeometry R6 owns the generic nearest-point retraction; no ownership changed there. InstantonFloerTheory owns its SO(3) transport and Floer applications and cites FourManifolds for its local core. Its specialisations do not supply this roadmap's arbitrary-group critical Euclidean theory.

The cited supplier sections were checked on main: PDE §§1.2, 1.4–1.6, 2.2–2.3, 3.2, 6.1, 6.3, 7.1–7.3; SmoothBundlesConnections B3.1, B4.1–B4.2; CharacteristicClasses C4 item 1, C5a.3; RiemannianGeometry R6; DifferentialGeometry Layers 0–1, §§5.2–5.4, 10.3–10.5; AlgebraicTopology Stage 6 item 5 and Stage 8 item 3 (with its numbering map); LieGroups Layers 0–2, 5A and Layer 6's named root and rank-one blocks; Yamabe Y2 item 1. FourManifolds is an overlap comparison, not a supplier. No dependency on an open revision was introduced. No section or Lean name cited by consumers was deleted or renamed.

The pinned declarations were located in their actual files, rather than relying on the resolver's library search. In particular:

| Pin file and locator | Mathematical interface verified |
| --- | --- |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean:105`, `:278` | The two unitary-group carriers are submonoids; the special unitary condition includes determinant one. |
| `Mathlib/Analysis/Normed/Algebra/Exponential.lean:128`, `:521`; `MatrixExponential.lean:145` in that directory | Exponential, commuting addition law, and invertibility of matrix exponentials. |
| `Mathlib/Topology/Homotopy/Basic.lean:333`, `:354`; `HomotopyGroup.lean:441` | Free homotopy equivalence and the distinct cubical based homotopy-group carrier. |
| `Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:602` | Finite-dimensional coefficient hypothesis and the finite Sobolev exponent are retained in the embedding interface. |
| `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`; `Mathlib/Analysis/Normed/Module/Ball/RadialEquiv.lean:71` | Spherical measure and radial decomposition; sphere measure is not ambient measure restricted to a null sphere. |
| `Mathlib/Analysis/Distribution/FourierMultiplier.lean:143`; `TemperedDistribution.lean:160` in that directory | Tempered-distribution multiplier and the Lp inclusion, with their growth/integrability hypotheses. |
| `Mathlib/Topology/Algebra/Module/Complement.lean:87`; `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:70` | Complemented subspaces; smooth embedding includes immersion as well as topological embedding. |
| `Mathlib/Geometry/Manifold/Immersion.lean:802`; `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31`, `:66` | A fixed complement and the local normal form; the inverse theorem needs an invertible derivative and positive differentiability order. |
| `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`; `Wkp/Basic.lean:145` in the Sobolev directory | Weak derivative has completeness/local integrability; the Wkp carrier is scalar, not a matrix-valued critical gauge. |
| `TauCeti/Analysis/Sobolev/W1p/Morrey.lean:156`; `TauCeti/Analysis/Sobolev/Morrey.lean:181` | Morrey's strict dimension/exponent inequality, not the critical embedding into C⁰. |
| `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:117`, `:134`, `:149`, `:155`, `:246`, `:264`, `:275`, `:321`, `:362` | Gradient closure, dense tests and all four finite-exponent embedding assertions. The identity-on-tests theorem itself has p* ≠ ∞. |
| `TauCeti/Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`, `:111`, `:157`; `TauCeti/Analysis/PDE/HeatKernel/Basic.lean:76` | Pointwise star, paired wedge, even-degree star square, and the scalar heat kernel. They do not construct weak connection spaces. |

## Adversarial mathematics pass

Standing context is real finite-dimensional Euclidean space, d ≥ 3 for critical connections and d = 4 for the heat theory, compact G ⊂ U(N), N ≥ 1, with its prescribed positive Ad(G)-invariant metric. No assertion extends to characteristic-p coefficients or d = 2 critical L¹ theory. Empty local domains give zero restrictions and zero integrals. The zero Lie algebra is allowed; denominators involving γ₀ occur only in the noncommutative case. Values in the table are explicit instances and negative controls, not proofs of all planned results.

| Statement | Instances tried | Values computed on the two sides | Result and change |
| --- | --- | --- | --- |
| Dimension and scaling convention | λ = 2, d = 4; d = 3 | Curvature factor 4, squared density factor 16, volume factor 1/16, so E factor 1; L² curvature norm in d = 3 has factor √2 | Retained. |
| Gauge and right Maurer–Cartan signs | SU(2), O = exp(x₁i)exp(x₂j), at 0 | R₁ = i, R₂ = j, dR₁₂ = 2k; F[−R]₁₂ = −2k + 2k = 0, F[R]₁₂ = 2k + 2k = 4k | Correct sign retained through §§1.3, 3.2, 10.1–10.2. |
| Form norm and orientation | F₁₂ = F₃₄ = i with norm²(i) = 2 | Norm²(F) = 4; paired wedge coefficient = 4; all-index uncorrected coefficient = 16 | Normalisation retained; nonzero condition added for strict failure. |
| Fourier and heat convention | Frequency ξ = e₁ | Δ multiplier −4π²; heat multiplier exp(−4π²t); positive multiplier would grow as exp(4π²t) | Retained through §§8–9. |
| §1.1 group, metric and splitting | U(1), SU(2), finite G, T² semidirect C₂ | Abelian and finite brackets 0; SU(2) bracket [i,j] = 2k, norm² = 8; disconnected swap changes squared length 1 to 2 | Retained; disconnected invariance has content. |
| §1.2 nearest-point derivative | Circle at 1; finite {±1}; unitary matrices at 0 | dπ(a+ib) = ib; finite-group derivative 0; distance²(0,g) = N for every g | Retained; 0 excluded from tube. |
| §1.2 nearest-point versus a retraction | Shear t = 1, when in the tube | Polar distance² = 5 − 2√5 ≈ 0.528; Gram–Schmidt distance² = 1 | Retained. |
| §1.3 composition, curvature and covariance | U(1), A = ix₁dx₂, O = exp(iφ); constant central c | F before = F after = i dx₁₂; O·A = A − i dφ; Ad(c)A = A | Retained. |
| §1.3 adjoint derivative | X = i, Y = j, g = exp(πk/4) | Correct bracket [Ad(g)i, Ad(g)j] = [j,−i] = 2k; misplaced bracket Ad(g)[j,j] = 0 | Retained source correction. |
| §1.4 transgression | A = −R, k = 2 | tr(A dA) + (2/3)tr(A³) = tr(R³)/3; F = 0 | Retained. |
| §1.4 Cartan integral and supplier polarisation | Positive frame maps to (k,i,j) | Trace cubic −12; integral −24π²; divided by 3 gives −8π²; an extra 1/2 factorial would give −4π² | Retained, reused in §§6.2, 6.4, 7.6. |
| §1.5 splitting, inequality and equality | F = X dx₁₂ with norm²(X) = 2; X = 0 | Plus/minus norm² = 1 each; norm²(F) = 2, wedge 0; at X = 0 both are 0 | Strictness repaired. |
| §1.6 bracket constant | SU(2); abelian algebra; zero algebra; metric multiplied by 4 | √8/(√2√2) = √2; abelian and zero maxima 0; rescaled constant √2/2 | Retained; closed balls handle rank zero. |
| §1.6 cubic bound | ω coefficients (i,j,k) in the displayed self-dual basis | Norm² = 6, triple pairing 4; signed cubic −24√2; absolute upper bound (2√6/3)√2·6^(3/2) = 24√2 | Retained. |
| §2.1 critical Sobolev class | Logarithmic map in d = 4; finite group | Radial derivative integrals ∫₁∞t⁻²dt = 1, ∫₁∞t⁻⁴dt = 1/3; no limit at 0; finite-group derivative 0 | Retained and reused as local Besov non-example. |
| §2.1 vortex exclusion | d = 3, U(1), angle around an axis | Critical first-derivative radial integral contains ∫₀¹ρ⁻²dρ = ∞; a constant map gives 0 | Retained. |
| §2.2 smoothing with disjoint open sets | Opposite half-balls; W empty | Required 0/1 cutoff has limits 0 and 1 at the common boundary; positive flat bump has both limits 0; W empty gives O′−O = 0 | Retained positivity correction. |
| §2.3 products and inverses | U(1), exp(iφ), exp(iψ); finite group | Product exp(i(φ+ψ)); inverse derivative −i dφ; finite-group derivatives and every positive-order product term 0 | Retained. |
| §2.4 critical adjoint action | O = exp(√L i), B = √L j; B = j | Input fourth-power integrals finite multiples of 1; rotating output contains ∫dr/r = ∞; bounded B instead gives finite ∫₁∞L⁻²dL = 1 | Retained top-order boundedness. |
| §2.5 annular class and extension iff | Constant −1 in {±1}; degree-one sphere map | Constant extends with degree 0 but is not homotopic to +1; degree-one boundary has degree 1 versus 0 for an extendible map | Both directions retained. |
| §2.5 exterior derivative condition | Constant versus homogeneous degree-one map | Constant derivative integral 0; nonconstant angular map has C∫₁∞dr/r = ∞ | Retained; no global Lp condition imposed on unitary O. |
| §3.1 cocycles and curvature | Three constant transitions c₁₂c₂₃ = c₁₃; finite group | Composition gives c₁₃·0 = 0; F = 0 in each chart; cocycle condition still constrains transitions | Retained. |
| §3.2 rough gauge invariance | U(1), A − i dφ; degree-one punctured pure gauge | Curvature dA − i d²φ = dA; pure gauge has F = 0 = Ad(O)0 | Retained. |
| §3.3 patching and quantitative cover | Separated centres distance c; two flat charts | Disjoint radius-c/2 balls in radius-(1+c/2) ball give multiplicity at most (1+2/c)^d; transition constant c patches zero potentials to zero | Centre terminology repaired; flat case used explicitly. |
| §3.4 concentration radii | F = 0; BPST at r = 1 and r → 0 | Flat radii (∞,0); BPST ball energy 4π² at 1 and 24π²r⁴ + O(r⁶) near 0 | Retained. |
| §4.1 Coulomb estimate and uniqueness | A = 0; abelian gauge; infinitesimal Neumann problem | Bound C₀·0 = 0 forces transformed potential 0; Δφ = −i div A; harmonic Neumann ψ has gradient norm 0 | Retained; used instead of §5.2's bounded remainder. |
| §4.2 puncture removal | Degree-one pure gauge; finite critical curvature | Original derivative norm contains ∫₀¹dr/r = ∞; transformed potential 0; shrinking curvature integral → 0 | Check repaired to retain global potential. |
| §4.2 monopole negative control | d = 3, n = 1 | Flux 2π versus exact-potential flux 0; spherewise lower bound (2π)^(3/2)/(√(4π)r), radial integral ∞ | Added; fails both hypotheses. |
| §4.3 interior higher regularity and convergence | Abelian Aₙ = n^(−3/2)sin(nx₁)i dx₂; constant curvature | First-order norm O(n^(−1/2)) → 0; second derivative L^(4/3) grows as √n; constant curvature higher derivatives 0 | Retained higher-data hypothesis. |
| §4.3 restriction norm | Constant c ≠ 0; smooth cutoff extension; zero extension | Cutoff extension norm finite; quotient norm ≥ C‖c‖_Lp(B) > 0; zero-extension derivative has nonzero surface measure and is not Lp | New carrier excludes zero-extension model. |
| §4.3 quotient and cutoff independence | Extensions U and U+V with V zero on B; zero datum | Their difference restricts to 0, hence quotient distance 0; zero datum has norm 0; equivalent global norms give the same finite nonzero restriction class | New API is extension-independent. |
| §4.3 continuity | Constant gauge; logarithmic map | Constant Maurer–Cartan norm 0 and constant limit; logarithmic map has at least two cluster values at 0 | Summable derivative condition now has a defined carrier. |
| §4.4 ball gauge and rescaling | Small curvature; (R,r) replaced by (R/2,r/2) | Coulomb bound C‖F‖; ratio (R/2)/(r/2) = R/r | Retained. |
| §5.1 good representative | Degree-one gauge with cutoff identically 1; BPST exterior | Bad cutoff gives ∫₀¹dr/r = ∞; BPST remainder coefficient −1/[r²(1+r²)], size O(r⁻³), gradient O(r⁻⁴) | Retained vanishing inner cutoff. |
| §5.2 flat and translated global gauges | Flat connection; BPST translated by b | Zero Coulomb potentials patch to (O∞,B) = (1,0); radii (∞,0); translating y = x−b preserves remainder norm | Flat Check now uses §§3.3, 4.1. |
| §5.3 comparison identity | U(1), θ′ = θ+ψ outside a ball | Composite derivative i(−dθ′+dψ+dθ) = 0; reversed roles give 2i dψ | Retained; converse changes the potential. |
| §5.4 class quotient and perturbation | {±1}; O(4) reflection; bad SU(2) global gauge | Two constant homotopy classes become one quotient class; reflection exchanges the two π₃ factors; perturbation curvature tail has ∫₁∞r dr = ∞ | Retained constants quotient and good-representative hypothesis. |
| §5.5 trivial-class characterisation | a ∈ Ḣ¹; BPST | First has O∞ = 1 and χ = 0; BPST gauge degree −1 and c₂ = 1 | Retained; both directions separate these classes. |
| §5.6 based/free comparison | Connected U(1), SU(2); disconnected {±1} | π₃(U(1)) = 0, π₃(SU(2)) = ℤ; two free constant classes in {±1} versus one based zero class | Connected hypothesis retained. |
| §6.1 characteristic numbers and continuity | Abelian finite energy; SU(2) BPST; dilation by 2 | Abelian integral 0; BPST χ = 8π²; top density factor 16 times volume 1/16 gives invariant integral | Retained. |
| §6.2 transgression and topological invariance | O∞ = Φ; constant O∞ | Boundary integral −8π² versus 0; Stokes gives the same interior values | Retained. |
| §6.3 integrated bound and equality iff | (I₊,I₋) = (1,1), (0,1), (0,0) | E−abs(χ) = 2, 0, 0 respectively; formula 2min gives 2,0,0 | Strictness repaired; both equality directions tested. |
| §6.4 charge integrality and sign | Φ, quaternion conjugation, constant | Degrees 1,−1,0; charges −1,1,0; χ values −8π²,8π²,0 | Retained; matches §§1.4, 7.6. |
| §7.1 harmonic equation | Flat; U(1) constant curvature; nonconstant ψ(x₁) | Weak divergence 0,0,iψ′ respectively; constant nonzero curvature has infinite E | Retained finite-energy qualification. |
| §7.2 regularity and small-curvature bounds | Flat; a BPST rescaling on a small ball | Flat covariant derivatives 0; scaling gives derivative size λ^(n+2) and L² curvature size invariant on corresponding balls | Retained. |
| §7.3 removal and decay | Punctured pure gauge; BPST | Removed potential 0; BPST abs(F) = √48/(1+r²)², so r⁴abs(F) → √48 | Retained. |
| §7.4 Weitzenböck and Kato consequences | Self-dual BPST at its centre; abelian curvature | ½Δabs(F)² = −768, gradient term 0, cubic pairing 768; abelian cubic 0 | Correct minus sign retained. |
| §7.4 scalar differential inequality | BPST u = 48^(1/4)/(1+r²) | Δu = −8·48^(1/4)/(1+r²)³; −(√6/3)√2 abs(F)u gives the same value | Retained. |
| §7.5 sharp gap | SU(2); pair of opposite-factor instantons | Single duality energy 8π² = 16π²/2; pair E = 16π², χ = 0, gap 32π²/2 = 16π² | Retained. |
| §7.6 BPST construction | x = 0; radial integral; orientation reversal | A(0) = 0; i-component 2(dx₁₂−dx₃₄); radial integral 1/12 times 96π² = 8π²; charge flips 1 to −1 | Retained. |
| §7.7 ground state | SU(2), metric scaled by 4, abelian algebra | 16π²/(√2)² = 8π²; scaling gives 32π² and γ₀ = √2/2; abelian infimum of empty family +∞ | Retained; division only for γ₀ > 0. |
| §8.1 first homogeneous carrier | Constant 1; test φ; cutoff χ_Ru | Constant has gradient 0 but infinite L⁴ norm; test's gradient norm plus L⁴ norm is equivalent to gradient norm; cutoff error bounded by C times the L⁴ tail → 0 | Retained image characterisation. |
| §8.1 finite-exponent embedding | (d,p,p*) = (4,2,4), (4,4,∞) | Equations 1/4+1/4 = 1/2 and 0+1/4 = 1/4 both hold; endpoint log-log gradient integral C/3 bounded, supremum tends to ∞ | Contract repaired. |
| §8.1 realisation and uniqueness | Constant; critical ℓ¹ tail | Constant low pass 1 versus required limit 0; weighted sizes 2^k give tail 2^(K+1) → 0, sizes 1 give ∞ | Added representative theorem; no false zero detection. |
| §8.1 fractional norm and heat trace | σ = −1, g = sign(x₁); g+c | Norm 1; constant shift has same blocks but low-pass limit c ≠ 0; heat norm distance is 1 for every positive time | Retained realised norm and proper heat-continuity subspace. |
| §8.1 Riesz normalisation | Smooth φ, σ = −1 | Γ(3/2)/(2π²Γ(1/2)) = 1/(4π²); potential tail (∫φ)/(4π²r³) | Retained 2π convention. |
| §8.1 heat estimate at all indices | k = 0,−1 | Lower support frequencies 1,1/2 give L² exponential bounds exp(−4π²t), exp(−π²t); dilation factors 1/2,1/4 | Added dilation theorem. |
| §8.1 homogeneous trichotomy | Pairs (0,4), (4,0), (0,0), (0,3) | Multiplicity 1 in Tᵤv, Tᵥu, R, R respectively; overlapping the last pair would give multiplicity 2 | Constructed homogeneous variant; separation respects support. |
| §8.1 product estimates | λ = 2, σ = 0; zero input | Output L² norm scales by 1/4; input norms each by 1/2; zero input gives product 0 and three zero series | Added target. |
| §8.1 product summability | σ = 0 | Low/high kernel sum Σₘ≥4 2⁻ᵐ = 1/8; comparable high-to-low sum Σₘ≥0 2⁻²ᵐ = 4/3 | Both are finite, giving ℓ¹ output by Cauchy–Schwarz. |
| §8.1 product endpoints | σ = −2,1 | At −2, nonzero mean square gives ∫₀^ε dr/r = ∞; at 1, v_N(0) = √Nφ(0), bounded input norms, output at least c√N | Both excluded endpoints fail. |
| §8.1 envelopes and compatibility | Constant 1; zero; dⱼ = 1, σ̃ = 0 | All constant blocks 0 but sup norm 1; zero distribution and envelope norms 0; Σⱼ<0 1 = ∞ | Zero-envelope claim repaired, sum-finiteness retained. |
| §8.1 graph space ℋ | Divergence-free a; block divergence sizes 1/k | First divergence norm 0; Σ1/k² < ∞ but Σ1/k = ∞ for the second | Retained proper inclusion ℋ ⊊ Ḣ¹. |
| §8.2 covariant inverse and sign | A = 0, ξ = e₁; pure gauge | Inverse multiplier −1/(4π²); Δ(−F/(4π²)) = F; conjugation gives Ad(O)ΔAd(O⁻¹) | Retained; no division at frequency 0. |
| §8.3 L² energy and decay | Free heat, initial norm 1 | Sup norm 1, squared gradient spacetime integral 1/2, sum bound attained at 1+1/√2; terminal norm 0 | Retained. |
| §8.3 dyadic L¹ versus ordinary L¹ | K = 4 separated heat blocks of Ḣ⁻¹ size 1/2 | Input square sum 1; dyadic L¹ square sum comparable to 1; disjoint-time lower bound for ordinary L¹ comparable to 2 | Retained distinction, valid for arbitrary K. |
| §8.4 endpoint and forcing powers | Free heat; β = 0; p = ∞ step | Exponential block decay; Duhamel near 0 has size t‖G‖, matching power 1; step trace distance 1, not 0 | Retained endpoint qualifications. |
| §9.1 curvature evolution | A coefficients (i,j,k,0) | ∂ₛF₁₂ = −32k, Δ_AF₁₂ = −16k, forcing −2[−2j,2i] = −16k | Retained order and sign. |
| §9.1 energy and gauge fixing | Abelian frequency e₁; ∂ₛO = OAₛ | Energy derivative −32π⁴abs(α)²e^(−8π²s); dissipation density 16π⁴abs(α)²e^(−8π²s); transformed Aₛ = 0 | Factor 2 and gauge ODE retained. |
| §9.2 weighted estimates | λ = 2; n = 0, q = 4 | Curvature L⁴ factor 2; weight s^(1/2) factor 1/2, product 1; spurious extra weight at p = ∞ would give 1/√2 | Retained corrected weight. |
| §9.3 maximal solution | Flat; abelian Helmholtz splitting; dilation by 2 | Flat flow a, lifespan ∞; transverse mode decays as exp(−4π²sabs(ξ)²), longitudinal mode fixed; lifespan scaling 1/4 | Retained. |
| §9.4 caloric size and continuation | Flat; static BPST; λ = 2 | Flat Q = 0, endpoint ∞; BPST time integral ∞; scaling factors in ∫abs(F)³ are 64·1/16·1/4 = 1 | Retained finite-endpoint continuation restriction. |
| §9.5 flat and linearised limits | U(1), b = ∇ψ+b_df; pure gauge | Limits A∞ = ∇φ, B∞ = ∇ψ, transverse heat norm → 0; pure gauge limit a | Retained full objects and negative-index limit. |
| §9.5 Fréchet upgrade | Abelian projection; sine model at 0 | Derivative difference and remainder 0 for the projection; u_n has norm π/√n, operator difference 2, relative error 1 for sine | Added operator-norm target and negative control. |
| §9.5 open domain | Flat abelian data; small energy | Q = 0 for a flat input; any nearby data below the strict small-energy threshold have finite Q, with Q² bounded by C times energy | Openness route uses a strict tail energy bound. |
| §9.6 dichotomy | Data below small-energy bound; hypothetical bubble | First branch Q finite; a nontrivial bubble has energy ≥ E_GS whereas initial energy ε < E_GS | Retained; concentration-centre convergence not assumed. |
| §9.7 threshold and charge balance | SU(2) bubble with χ = 8π² in total class 0 | Bubble energy ≥ 8π²; exterior charge −8π² forces exterior energy ≥ 8π²; total ≥ 16π² | Retained total energy threshold. |
| §10.1 flat gauge | a = 0; a = −P;x with P = exp(x₁²i) | Normalised zero input gives O = 1; O = cP⁻¹ gives O·a = 0 and O⁻¹dO = a | Replaced the incomplete §5.2 route. |
| §10.2 ambient Banach carrier | U = 0; nonzero constant; compact φM | Norm 0 for zero; constant derivative 0 but nonzero limit excludes it; cutoff graph norm finite | Defined codomain; no uncharted-set C¹ assertion. |
| §10.2 ambient versus group constraint | M = 1, φ positive somewhere | Multiplication by 1+φ expands vector norms by 1+φ > 1; hence 1+U is not unitary there | Ambient linear space does not silently impose gauge values. |
| §10.2 normalised derivatives | U(1), ã_t = it dφ, φ compactly supported | ψ = iφ, dO = iφ; dCal = i dφ − i dφ = 0; wrong ψ sign gives 2i dφ | Added exact derivative formula and sign Check. |
| §10.2 Cal, orbit metric and invariants | Abelian input; pure gauge; constant conjugation | Cal is transverse projection; pure gauge maps to 0; d(Ad(c)a,a) = 0; E and Q unchanged | Retained quotient before normalisation. |
| §10.3 caloric bounds in homogeneous norms | λ = 1/2; nonzero divergence h | Gradient L^(4/3) and ℓ¹L² factors 1; inhomogeneous L^(4/3) factor 2; quadratic symbol −6k/5 | Retained homogeneous qualification and nonabelian witness. |
| §10.4 split charts and projection | Abelian slice, unit sphere, corner graph | Chart derivative inclusion, PL = id; sphere derivative on e⊥ is identity; t ↦ (t³,abs(t)³) has derivative 0 at 0 | Retained immersion requirement; sine check added before invoking it. |
| §10.5 tangent and div–curl decomposition | a = 0; w = Dc₀; tangent w | Leray formula c = −Δ⁻¹div w; pure direction gives b = 0,c = −c₀; tangent gives c = 0,b = w | Retained; product dependency now §8.1. |
| Neumann and normal div–curl gaps | f = V = a = 0; f = 1,V = 0 | Zero data admit constant u, gradient norm 0; incompatible data give integral volume(B₁) > 0 versus boundary flux 0 | Existing hypotheses retained. |
| Hardy supplier gap | d = 4,p = 2,u(r) = (1+r)⁻² | After cancelling sphere area, squared weighted norm 1/6, squared gradient norm 1/5; 1/6 ≤ 1/5 | Existing constant p/(d−p) = 1 is consistent. |
| Compact rank-one metric gap | SU(2), metric multiplied by 4 | γ₀ changes √2 to √2/2; embedded BPST energy changes 8π² to 32π² = 16π²/(√2/2)² | Existing supplier gap retained. |
| Vector-valued Sobolev gap | Zero coefficient space; basis e changed to 2e | Zero functions and weak derivatives 0; coordinate of xe changes x to x/2, reconstructed value remains xe | Coordinate comparison must commute with derivatives; not a new scalar carrier. |
| New inhomogeneous partition gap | Frequency size 2 | Written supplier sum 0+0 = 0; consistent low and zeroth-annulus symbols 0+1 = 1 | Supplier correction recorded, not assumed present. |

## Check outcomes and maintainer consequences

- Lean elaboration: ran `lake env lean` on `packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean` from the pinned content checkout. Exit code 0, no output. No Tau Ceti module import or targeted module build was needed.
- Mechanical declaration/binder audit: 0 definitions, 0 instances, 0 theorems, 0 examples, 0 section variables. Consequently the requested scratch list of `#check @name` has 0 entries; there are no elaborated target binders to compare or repair. The final file was elaborated successfully; there are no declaration signatures to elaborate separately. It has one `import Mathlib` and no `set_option`. Its docstring now records the operator topology, homogeneous products and normalised-gauge carrier missing from the full headlines. No substitute theorem was added.
- Dependency check after the repairs: exit code 0. Exact output:

    depcheck: 236 roadmaps, 2135 edges, 0 problem(s)

  There was no UPWARD, CYCLE or moved line.
- Citation resolver: no cross-roadmap citations found nowhere and no Lean names found nowhere. Its library search reported unavailable pins, so pinned-library verification was performed directly as recorded above.
- `git diff --check`: exit code 0, no output. The plan's data outside `gaps` compare equal to HEAD. No metadata change, tooling change, merge-order edit, commit, push, or external write was made.
- No separate gate failures were supplied in the brief. The six supplier-gap slugs agree between README and the plan; five are unchanged and `inhomogeneous-besov-partition` is new. This new PDE correction and the FourManifolds ownership change require work outside this package. They are not certified as completed by this repair.
- The Fréchet targets now explicitly include the uniform linearised-limit and normalised-gauge estimates needed by the C¹ caloric manifold. Those remain mathematical proof obligations of the roadmap, with the source proof's limitation disclosed; elaboration of an empty acceptance namespace does not verify them.
