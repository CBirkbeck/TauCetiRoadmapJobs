# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #2909 at 6d1a84a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding: in 8.3 the compact dual `U` is defined only by its Lie algebra, which does not determine it, and the formal-degree formula of headline (1) is true for one choice and off by the degree of a covering for the others (for `SL₂(ℝ)`: `k − 1` with `SU(2)`, `(k − 1)/2` with `SO(3)`). Everything else checked out: the 37 module and declaration locators into the formal proof exist and carry the thresholds and constants stated in 2.4a, 2.4b, 6.8a and 8.3, and the classical locators agree with the texts. There are two small corrections and two format notes, none blocking. Scope, licence and organisation questions are left for the human reviewers.

## R01 (P2) — In 8.3 the compact dual is "the compact group with Lie algebra `𝔨 ⊕ i𝔭`", which is not one group, and the formal-degree formula holds for only one of the candidates.

The measure of 8.3 is fixed by giving `U` total mass one, so the formula `d(π_λ) = ∏|⟨λ, α^∨⟩| / ∏⟨ρ, α^∨⟩` depends on which `U` is meant; an implementer who takes the sentence as written can formalise a normalisation for which headline (1) is false, and BesselPoincareSeriesAndGramBounds uses `d(σ)` as the main term of its limit multiplicity. The statement (line 275) reads: "`U` the compact dual, the compact group with Lie algebra `𝔨 ⊕ i𝔭`". Compact connected groups with the same Lie algebra differ by finite coverings, and the probability Haar measures of a group and of its quotient by a central subgroup of order `m` correspond to volume forms on the Lie algebra that differ by the factor `m`.

Computed on `G = SL₂(ℝ)`, `D_k`, coefficient `cosh(t)^{−k}`: with `U = SU(2)` the polar constant is `1/π`, `∫_G |coef|² = 2∫₁^∞ u^{1−2k} du = 1/(k − 1)` (numerically `0.2500` at `k = 5`), so `d = k − 1`, the formula and the Check of 8.3. With `U = SO(3)`, which has the same Lie algebra, the volume form is doubled, `K = SO(2) ⊂ G` gets mass `2`, and `d = (k − 1)/2`. For `G = PSL₂(ℝ)` the roles are exchanged: `SO(3)` gives `k − 1` and `SU(2)` gives `2(k − 1)`. For `U(1, 1)`, `U(2)` and `SU(2) × U(1)` both have Lie algebra `𝔲(2)` and differ by the same factor. Only the Check on `SL₂(ℝ)` singles out `SU(2)`, and only for that group.

The smallest change: define `U` as the compact real form of the complexification of `G/A_G` that contains the image of `K` (so that `K → U` is injective and induces the identity on `𝔨`), with the hypothesis that makes it exist (`G/A_G` a subgroup of its complexification), in 8.3, in the Conventions and in headline (1); and add the negative control as a Check: for `SL₂(ℝ)`, the group `SO(3)` in place of `SU(2)` would give `(k − 1)/2`.

## C01 — The `SL₂(ℝ)` Check of 8.3 attributes the value `(k − 1)/(4π)` to VonNeumannAlgebras Layer 9, which states no value and names no Haar measure.

The Check (line 292) says that for even `k` "this is the formal degree computed in VonNeumannAlgebras Layer 9". That layer asks for the formal degree of the holomorphic discrete series of `PSL₂(ℝ)` for "a fixed Haar normalization" and states the constant only through `d_π` times the covolume (its lines 2513–2518); a reader who looks there for `(k − 1)/(4π)` finds nothing to compare. Say instead that the value agrees with the one of that layer once its Haar measure is taken to be `dx dy/y² ⊗ dk` with `vol(K) = 1`.

## C02 — The description and the References entry name the formal proof as the source of 2.4a and 2.4b only, while the head cites it at ten further targets.

The description says that 2.4a (b)–(d) and 2.4b "are cited to the formal proof", and the entry [FormalProof] in the References (line 455) says the same. At this head the README also gives a module and declaration of the formal proof at 2.4a (a), 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.3 (with the constant `c_{p,q}`), 9.1 and 10.2, under the convention "Statements of the formal proof". Text that would be right, in both places: "every target that names [FormalProof] gives the module and declaration; 2.4a (b)–(d) and 2.4b rest on it alone, and at the other targets it records the form the proof uses".

## N01 — Harish-Chandra 1966, Müller 1998, Harris 1989 and Zuckerman 1977 are cited by the whole paper, and Gross and Knapp by a range; a theorem number where one is known would let a reader check the hypotheses at the claim.

## N02 — Layers 2 and 8 need each other at the level of layers (2.4a uses 8.1; the route of 8.3 uses 2.4a and 2.4b). The targets are acyclic (8.1, 2.4a, 2.4b, 8.3) and the overview says so; placing 8.1 and 8.2 before Layer 2 would remove the forward citation, if that is wanted.

## Questions for the author

- Does the class of real reductive groups of AutomorphicFormsOnReductiveGroups §2.4 contain groups that are not subgroups of their complexification (a finite cover of `SL₂(ℝ)` such as the metaplectic group has discrete series)? For those no compact group with Lie algebra `𝔨 ⊕ i𝔭` contains `K`, and 8.3 needs another normalisation. That class is defined in ArithmeticLocallySymmetricSpaces ALS.0.1–ALS.0.3, which I did not open.
- In the formal statement of 2.4b (b) the group is that of the form with `r` hyperbolic planes and a diagonal block of `k` entries `+1` and one `−1`, with `k ≥ 1`, so the signature is `(r + k, r + 1)` and the range is `p ≥ q ≥ 1`, as the README says. Is the case `p < q` meant to follow by exchanging the signs, or is it left out on purpose?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.4a (a) kernel bound | `U(1,1)`, `h ∈ {0.5, 1, 5, 50, 500}`, `t ∈ (0, 30]` | `(h+1)·log cosh t ≥ (h/8)·min(2t², t)`: 0 violations; route: mean `0`, second moment `Σ_{b≤i<a}|Y_ab|²`, sum `≥ h‖Y‖²/2` | holds |
| 2.4a (a), formal locator | `prod_leadMinor_decay`, `norm_Phi_le` | same exponent `−(h/8)·min(hs X, √(hs X)/√(2q₀))`; no threshold on `h` | agrees |
| 2.4a (b) formula | `X = 0`; `U(1,1)`; `FormulaGap` | Schur: `dim·∫⟨u,σ(k)w⟩⟨σ(k)w,v⟩ = ⟨u,v⟩`; `cosh^{−(h+1)}` = coefficient of `D_{h+1}`; formal threshold `120·n·rkR^{3/2} ≤ h` | holds, agrees |
| 2.4a (c) decay | three bounds; `DecGap`, `decHS`, `decE`, `coef_dec_of_isDS` | `√2·δ ≤ d(g)` (spectrum of `X` symmetric); `min(t²,t/s) ≥ t/s − 1/s²`; `‖g‖²_HS ≤ n·e^{2d}`; variant: `8nq₀ < h`, `npq+1 < h` | holds, agrees |
| 2.4a (d) integrability | `U(1,1)`; `N = 0`; `coefWeightedN` | `∫cosh^{−(h+1)}·sinh 2t` finite iff `h > 1`; `8√(2q₀)(0+2nq₀) = 16√(2q₀)nq₀`; `16√2 = 22.6 < 120` | holds, agrees |
| 2.4b (a) | `U(1,1)`, `h ≥ 2`, `h = 1`; `q₀ = 0`; `thrS` | weights of `ℂ²⊗D_{h+1}` = `D_h ⊕ D_{h+2}`; `h = 1`: weight `1` not in `D_3`; `thrS = max(2n, 16nq₀+8√(2q₀)) = t₀` | holds, agrees |
| 2.4b (b) | `ZuckSm thr`; `thrStar`; `Hpk` | `thr = max(npq+1, 16nq₀+8√(2q₀), 2n) = t₁`; hypothesis `t₁+n²+3+l < h`, `l+1 ≤ μ_a−μ_c`; signature `(r+k, r+1)`, `k ≥ 1` | agrees |
| Conventions, Blattner | hecht-schmid-1975 lines 98–101; `U(1,1)` | nonzero multiplicity forces `μ − Λ` in the positive cone; `Λ + 2ρ_c = λ + ρ`; `Λ₁ − Λ₂ = h + 1` | supports |
| 6.8 lowest-weight modules | `SL₂`, `D_k⁺`; `HolomorphicDiscreteSeries` | `K`-types `k, k+2, …`; formal: `IsDS` in the holomorphic chamber gives `IsLowestWeightOver` | holds |
| 6.8a Poincaré bound | `Γ = 1`; parabolic `Γ` on the disc; `SumBoundStatement`, `sumBd_sum` | `det(1−ZZ^*) = |det D|^{−2}`; sum at `s = 1`: `11.42, 12.44, 12.51 → 4π`; at `s = 0.8`: `20.6, 34.2, 53.3`; formal `2f(p+q)² < s` | holds, agrees |
| 7.5a integration, mass | `GL₁/ℚ`; norm-one torus; index `2` | one class, `Γ = ±1`, mass `1/2`; `|Cl|/|μ(k)|`; `mass J′ = 1 = 2·(1/2)` | holds |
| 7.5a duality of lattices | `M = ℚ`, form `p·xy`, `∇ = Δ = ℤ`; `ClassSumDualLeF` | `∇^∨ = p⁻¹ℤ`: (ii) at `s = 1`, (i) iff `p` divides `s`; pairing with the form supported on one class gives `⟨m, f′(t_i)⟩` | holds, agrees |
| 7.5b kernel operators | `k = |Γ_t|δ`; kernel `1` on `Γ = ±1`; conversion | identity; `K_k 1 = 1/2`; `k_level = ρ′(t′_p)⁻¹k_ratρ(t_p)` satisfies the level law | holds |
| 7.5c dimension | `Γ = ±1`, trivial and sign; central form | `½(1+1) = 1`, `½(1−1) = 0`; `2·½·1 = 1`; Mathlib needs `|Γ|` invertible | holds |
| 8.1 analytic vectors | hc-1953 lines 971–974, 1713–1715 | Lemma 34, p. 228: `K`-finite vectors with finite-dimensional isotypic parts are well-behaved (analytic) | supports, semisimple case |
| 8.2 unitary equivalence | hc-1953 lines 1723–1728, 1817–1819 | Theorem 5, p. 228; Theorem 8, p. 231: infinitesimal equivalence is equivalence | supports |
| 8.3 formal degree | `SL₂(ℝ)`: `SU(2)` and `SO(3)`; `U(1,1)`; compact `G`; `cPQ` | `c_{1,1} = 1/π`; `∫|coef|² = 0.2500 = 1/(k−1)` at `k = 5`; with `SO(3)`: `(k−1)/2`; `c_{n−1,1}⁻¹ = π^{n−1}/(n−1)!` | R01 |
| 9.1 trace class | muller-1989 lines 84–85, 2116–2117; `GL₁` | Corollary 0.2; Corollary 8.8, printed p. 84, `K`-finite `h`; `[GL₁]¹` compact | supports `K`-finite case |
| 10.1 good metrics | `X(N)`; mumford-1977 lines 681–682, 993–994 | `‖dz‖² = Im τ`, logarithmic in `|q|`; `|q|²·Im τ → 0` for `ω(−cusps)`; Main Theorem 3.1, Proposition 3.4 a) | holds |
| 10.2 proportionality | `X(N)`; `X(N)²`; mumford-1977 lines 170–172, 902–912 | Mumford's `(−1)^d·vol` equals `χ(Sh)/χ(X̌)` by logarithmic Gauss–Bonnet; `deg ω = −κ`; `κ_{K×K} = κ² = (deg ω)²` | holds |
| Headlines (1)–(4), README and docstring | against 8.3, 2.4a, 7.5a/7.5c, 10.1/10.2 | same hypotheses (`p, q ≥ 1`, `h ≥ 120nq₀^{3/2}`, `Sh_K(ℂ)` connected); (1) inherits R01 | agree |

- Source locators checked against the text, 14: hc-1953 lines 971–974 (§7, p. 209), 1713–1715, 1723–1728, 1817–1819; hecht-schmid-1975 lines 98–101, 121–122, 132–133; muller-1989 lines 84–85, 2116–2117; mumford-1977 lines 170–172, 681–682, 902–912, 993–994; thorne-2012 lines 1472–1500; Announcement line 53.
- Formal-proof locators checked, 37 of 37: every module exists in the public repository and contains the named declaration; statements opened and compared for 2.4a, 2.4b, 6.8, 6.8a, 7.5a, 7.5b, 8.1, 8.3, 9.1 and 10.2.
- Library declarations opened at the pin: `FDRep.average_char_eq_finrank_invariants` (Mathlib RepresentationTheory/Character.lean:214, hypotheses line 212), `ContRepresentation` (RepresentationTheory/Continuous/Basic.lean:55), `LieAlgebra.Orthogonal.indefiniteDiagonal` (Algebra/Lie/Classical.lean:175), `NumberField.AdeleRing`, `IsDedekindDomain.FiniteAdeleRing`, `LieGroup`, `TauCeti.OperatorIdealFamily.traceClass` (Analysis/OperatorIdeal/Family/TraceClass.lean:59). No discrete series, Shimura datum, algebraic modular form or formal degree at either pin.
- Cross-roadmap citations resolved, every cited section in 23 roadmaps: on main AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, VonNeumannAlgebras, RepresentationTheory (CompactGroups, ClassicalGroups, LieHighestWeight), OperatorTheory/OperatorIdeals, AdelicAlgebraicGroups, ShimuraCompactifications, ShimuraData, ShimuraVarieties, CharacteristicClasses, NoncompactQuantumSymmetry, HilbertModularVarietiesAndShimuraCurves, GeometryOfNumbersAndQuadraticArithmetic, BallQuotientsAndComplexHyperbolicLattices; at open heads AutomorphicBundles, SingularHermitianMetricsAndL2Methods, LevelOneAutomorphicFormsForClassicalGroups and the five consumers.
- Dependency check: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`; no change outside the folder and the family index.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: exit 0, no output; the file declares nothing, so there was no signature to compare and no one-tactic probe to run.
- Headlines: four in the overview; none statable at the pins, each named in the docstring with what it lacks. No padding.
- Overlap check: read BesselPoincareSeriesAndGramBounds, RowTowerAndRallisIdentities, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaKernelsForUnitaryDualPairs (open), AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory, BallQuotientsAndComplexHyperbolicLattices (main); nothing shared. The open ones cite this roadmap; analyticity and unitary equivalence for semisimple groups with finite centre are NoncompactQuantumSymmetry M0, and 8.1, 8.2 say how they differ.

Source independence: 19 passages compared with 6 sources, none shared; largest share FormalProof, 37 of about 56 locators; it has no table of contents, and its directory tree does not match the layers; contents compared with mumford-1977 and hc-1953: independent.

Research link: 8.3 is Harish-Chandra's formal degree (1966), 10.1–10.2 Mumford's proportionality (1977), 7.5a–7.5c Gross's algebraic modular forms (1999), 9.1 Müller's trace class theorem (1989, 1998); 2.4a–2.4b come from Alpöge's formal proof (2026). Rests on the README's References and the sources read.

## Not verifiable

- Harish-Chandra 1966 (8.3), Gross 1999 (7.5a), Müller 1998 (9.1, general `f`): settled as uncertified; not read.
- Harris 1989, Zuckerman 1977, Knapp 1986, Harish-Chandra 1955–1956: not read.
- The formal proof: I read the cited statements and the definitions they unfold to one level; I did not build it, and "follows from" was checked by reading statements only. The definitions behind `dHS`, `dOp`, `CcGA`, `IsLowestWeightOver` and `TensRaw` were not opened.

## Source issues

- none

## For the human reviewers

- Scope: 2.4a (b)–(d) and 2.4b rest only on a formal Lean proof announced on 20 November 2026 (README line 455; Announcement line 53), not refereed; its public repository describes it as a claimed proof under independent verification. 6.8a cites no published source.
- Licence: the public repository of the formal proof carries no licence. The README cites 37 of its module paths and declaration names (lines 45–62, 83–95 and elsewhere) and reproduces none of its code.
- Organisation: the roadmap extends AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and AutomorphicBundles, and numbers 2.4a, 6.8a, 7.5a–7.5c after sections of the first; it is not titled a Part II of any of them.
- Not tested: the source with the largest share of locators is the formal proof, which has no table of contents; the arrangement was compared with its directory names only. Six cited works were not read (listed above).
