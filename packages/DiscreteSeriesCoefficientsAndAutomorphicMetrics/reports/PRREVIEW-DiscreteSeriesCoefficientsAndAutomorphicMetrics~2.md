# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #2909 at 021930a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings, both in 2.4a. First, the `U(1, 1)` Check of 2.4a specialises the kernel bound (a) wrongly, so the one witness that pins the normalisation of (a) gives the wrong inequality. Second, the headline formula 2.4a (b) and the thresholds of (c) and (d) cite no source, and their route says the decisive steps are not given, so nothing in the roadmap supports them. There are six small corrections and two format notes, none blocking. For the human reviewers: most cited texts could not be read legally, and the original results rest on a formal proof announced on 20 November 2026.

## R01 (P2) — The first Check of 2.4a misstates the kernel bound (a) at `U(1, 1)`.

This Check is the only computed witness for the normalisation of (a) (the `‖X‖_HS` scale and the `√(2q₀)` cut-off), and it gives the wrong value. A reader who calibrates (a) against it gets a factor `√2` wrong in the linear regime. In the Check of 2.4a (line 45), the text says that (a) "is `cosh(t)^{−(h+1)} ≤ exp(−(h/8)·min(2t², t/√2))`". The same Check computes `‖X‖²_HS = 2|x|² = 2t²`, so `‖X‖_HS = √2·t`. With `q₀ = 1`, `√(2q₀) = √2`. So the second argument of the minimum in (a) is `‖X‖_HS/√(2q₀) = t`, not `t/√2`. The inequality the Check writes is true, but it is weaker than (a), so it is not what (a) says.

The smallest repair is to write `min(2t², t)` and replace the justification with `log cosh t ≥ min(t²/4, t/8)` for `t ≥ 0`. I checked that inequality numerically on `0 < t ≤ 50`: the margin is positive and tends to `0` only as `t → 0`.

## R02 (P2) — The headline formula 2.4a (b) and the thresholds of 2.4a (c) and (d) cite no source, and their route leaves the proof out.

These are headline (2) of the overview. BesselPoincareSeriesAndGramBounds (§§5.13, 5.16) and RowTowerAndRallisIdentities (§§5.3, 5.5) consume their exact constants: `h ≥ 120·n·q₀^{3/2}`, `h > max(8nq₀, npq + 1)` and `h > 8√(2q₀)·(N + 2nq₀)`. Neither 2.4a nor the References gives a locator for any of them. The route of (b), at line 39, ends with: "The vanishing of the Taylor series of such a solution when `h > 2n`, the computation showing that `Ψ` satisfies the system, and the analyticity of `Ψ` are not given here." It says the same for the uniqueness behind the variant of (c) and for (d). Those omitted steps are the proof. The family index names the formal proof these statements come from (Alpöge, announced 20 November 2026, with a public repository), but this README never cites it.

I checked the parts I could compute. (a) holds on random elements of `𝔭` for `U(2, 2)`, `U(2, 1)` and `U(3, 2)`, and the decay in (c) follows from (a) and (b). (b) reproduces the coefficient `cosh(r)^{−(h+1)}` of `U(1, 1)` and, for `U(2, 1)` with a scalar lowest `K`-type, the coefficient `cosh(r)^{−(h′+2)}`. So I do not suspect the formula. What is missing is support for the statement and its constants.

The smallest repair is to give, at 2.4a (b), at the variant of (c) and at (d), the locator in that formal proof (module and declaration) that establishes each, and to add the formal proof to the References. Where a constant is the roadmap's own and is not proved there, say so.

## C01 — Four supplier citations point to roadmaps that do not state the cited fact.

- **10.1 (lines 264, 289, 345).** These lines attribute "the parabolic subgroups of its boundary components" to ShimuraData. ShimuraData has no boundary components; they are in ShimuraVarieties §2.1 ("Rational boundary components and incidence") and ShimuraCompactifications Layer 1.
- **8.3 (lines 215, 229, 325).** These lines attribute Weyl's dimension formula to RepresentationTheory/CompactGroups, which does not state it. It is in RepresentationTheory/LieHighestWeight Layer 6 and, for unitary groups, ClassicalGroups Layer 5.
- **9.1 (lines 239, 337).** These lines cite OperatorTheory/OperatorIdeals for "the trace class of a product of two Hilbert–Schmidt operators". OperatorIdeals does not state this (it follows from OI-A22). AutomorphicSpectralTheory §0.9, already a supplier here, states `‖BC‖₁ ≤ ‖B‖_HS‖C‖_HS`.
- **2.4a (Conventions, line 17; supplier contract, line 309).** These lines attribute to AutomorphicFormsOnReductiveGroups §2.4 that `Λ` minimises `‖μ + 2ρ_c‖²`. That section (its line 380) states only that the lowest compact type has highest weight `λ + ρ_n − ρ_c`. Say that "lowest" is meant in Vogan's sense, or cite the minimality with its own locator.

## C02 — At `q₀ = 0` the first two bounds of 2.4a (c) divide by zero.

The first two bounds of (c) contain `d(g)/√(2q₀)` and `δ/√q₀`. Unlike (a), (d) and the third bound of (c), they do not assume `q₀ ≥ 1`, and the hypotheses of (b) allow `q₀ = 0`. Then `d(g) = δ = 0`, and both expressions read `0/0`. The third Check calls this case "empty or trivial". Add `q₀ ≥ 1` to those two bounds, or treat the compact case separately.

## C03 — The multiplicity Check of 2.4b (line 65) draws its conclusion from the wrong fact.

The trivial summand of `ℂ^n ⊗ (ℂ^n)^∨` gives one copy of `σ`. The number of copies is the multiplicity of the zero weight, which is `n` in the regular range. For `n = 1` there is exactly one copy. Would "its zero weight has multiplicity `n`, so `σ ⊗ F` contains `σ` `n` times" serve?

## C04 — The Downstream consumers credit 8.2 to a consumer that no roadmap identifies.

The sentence at line 293 that 8.2 is used by "the archimedean local theta correspondence for `U(p, q)`" names no roadmap. No open or merged roadmap cites 8.2. In particular, ThetaKernelsForUnitaryDualPairs does not cite this roadmap. The use of 6.8 is RowTowerAndRallisIdentities' (it cites §§6.8, 8.3). Name the consumer and its section, or drop the clause.

## C05 — The standard results are cited by whole paper, and two cited works are missing from the References.

Harish-Chandra 1953 (8.1, 8.2), Harish-Chandra 1966 (8.3), Müller 1989 and 1998 (9.1), Mumford 1977 (10.1, 10.2) and Harris 1989 carry no theorem or page number. Knapp (Ch. VI) and Gross (§§4–8) carry only chapter or section ranges. A reader cannot check the hypotheses at the claim. Schmid 1971 (route of 2.4a) and Zuckerman 1977 (route of 2.4b) are cited in the text but are absent from the References. 2.4b follows from Zuckerman's tensor-product theorem together with the Casselman–Wallach equivalence of AutomorphicFormsOnReductiveGroups §2.7, so a locator there would support it.

## C06 — The description says the family index is identical in every pull request of the family, and it is not.

The description says: "The family index (…) is carried, with identical content, by every pull request of the family". The family README at the head of the SlopesOfHermitianVectorBundles pull request differs from this head at lines 9–17, 34–36 and 117–119. Its credit paragraph and its rule on section numbers are reworded, and its Chow-forms entry differs. Several other family pull requests carry that version as well. Bring the index to one text, or say in the description which version this pull request carries and in what order the conflicting versions merge.

## N01 — In 10.1, `𝔭` is the parabolic, not the Cartan `𝔭` of the Conventions.

In "(𝔤/𝔭)^∨" in 10.1 (line 260), `𝔭` is the Lie algebra of the parabolic, whereas the Conventions fix `𝔭` as the Cartan complement. A different letter, or a clause saying which is meant, would avoid misreading `𝔤/𝔭` as `𝔨`.

## N02 — The Mathlib case of 7.5c could be cited in the README.

The finite-group case of 7.5c is Mathlib's `FDRep.average_char_eq_finrank_invariants`, which `Suggested.lean` names. "From Mathlib" could cite it for the first bullet of 7.5c.

## Questions for the author

- 9.1 (discrete spectrum): which theorem of Müller 1989 or 1998 gives trace class for every `f ∈ C_c^∞(G(𝔸)¹)`, and not only for `K_∞`-finite `f`? Neither text could be read legally, so I could not check that the statement as written is the one proved.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.4a (a) kernel bound | `U(1,1)`; random `𝔭` in `U(2,2)`, `U(2,1)`, `U(3,2)` | `log Φ − log(bound)` at most −0.009, −0.003, −0.022; every `Δ_i ≥ 1.000` | holds |
| 2.4a (a) route | moments of `S_J` | mean `Σ_{r≤i}Y_rr = 0`; variance `Σ_{b≤i<a}|Y_ab|² = V_i`; `|S_J| ≤ √(2q₀)‖Y‖` | holds |
| 2.4a Check 1 | `X = [[0,x],[x̄,0]]`, `x = 0.7+0.3i` | `‖X‖_HS/√2 = 0.7616 = t`; Check writes `t/√2 = 0.5385` | R01 |
| 2.4a (b), headline (2) | `X = 0`; `U(1,1)`; `U(2,1)` scalar `λ = (c₀, c₀−1, d)` | Schur gives `⟨σ(k₁)u,v⟩`; `cosh^{−(h+1)}`; `∫(1+(c−1)s)^{−2}ds = 1/c`, total `cosh^{−(h′+2)}` matches weight `Λ₁−Λ₃` | holds; unsupported (R02) |
| 2.4a (c) | from (a), (b) | `√2·log‖g‖_op ≤ d`; `min(t²,t/s) ≥ t/s−1/s²`; `‖g‖²_HS ≤ n·e^{2d}` give `n^{A/2}e^{A/s}‖g‖^{−A}` | holds for `q₀ ≥ 1`; `q₀ = 0` gives 0/0 (C02) |
| 2.4a (d) | `U(1,1)` | thresholds `3` and `32√2 ≈ 45.3`; exact integrability needs `h > 1` (`∫cosh^{−(h+1)}sinh 2t`) | consistent, not sharp; constants unsupported (R02) |
| 2.4b (a) | `U(1,1)`, `h ≥ 2` and `h = 1` | weights `h` once, `h+2j` twice = `D_h ⊕ D_{h+2}`; at `h = 1` the leftover is `D_1`, a limit | holds; negative control holds |
| 2.4b (b) | `l = 0`, `l = n`; gaps of `μ + e_I` | `σ = σ_μ`; `det ⊗ σ = σ_{μ+(1,…,1)}`; `μ_a−μ_{a+1} ≥ 2` suffices for strict decrease | holds (Zuckerman plus Casselman–Wallach) |
| 2.4b Check 3 | `n = 1`, `n = 2` | zero-weight multiplicity `n`: one copy, two copies | reasoning slip (C03) |
| 6.8 | `SL₂`, `D_k⁺` | `K`-types `k, k+2, …`; highest weights `λ₀ + (weight of S(𝔭⁺))` by the PRV bound | holds |
| 6.8a | `Γ = 1`; parabolic `Γ` on the disc; route | `∏det^s ≤ 1`; sum `≍ y^{1−s}`, bounded iff `s ≥ 1` (threshold 8); `D*D − B*B = 1` gives `|det D|^{−2}`; ratio `4^{2fn²−s}` | holds |
| 7.5a, headline (3) | one class `Γ = {±1}`; index 2; `GL₁/ℚ`; norm-one torus | mass `1/2`; `⟨1,1⟩_J = 1/2`; `mass J′ = 1 = 2·½`; `ℚ^× ∩ ℤ̂^× = {±1}`; `Γ_i ∩ A_∞ = 1` | holds |
| 7.5a pairing | Thorne, arXiv v1, Lemma 6.4 proof | weights `1/#(t⁻¹G(L⁺)t ∩ V)`, perfect when the orders are prime to `ℓ` | matches "perfect after inverting `N_J`" |
| 7.5b | identity kernel; kernel `1`; model conversion | `Σ|Γ_i|⁻¹|Γ_i|δ_ij f = f`; `K_k 1 = 1/2`; `k_level` satisfies the level law (computed) | holds |
| 7.5c, headline (3) | `Γ = {±1}`, trivial and sign coefficients; central form | `1 = ½+½`; `0 = ½−½`; `2·½·1 = 1`; `t_i⁻¹zt_i = z` gives `Z_J ⊂ Γ_i` | holds |
| 8.1 | admissible Banach representation | `V(δ)` finite-dimensional with smooth part dense, so `V(δ) ⊂ V^∞`; `𝒵(𝔤)`-finite, hence analytic | route sound; source unread |
| 8.2 | closure of admissible `W` | coefficients against `W^⊥` analytic and flat at `1`; `P_δ(W̄) ⊂ W(δ)` | holds |
| 8.3, headline (1) | `SL₂`, `D_k`; `U(1,1)`; `U(2,1)`; compact `G` | `d = k−1 = dim Sym^{k−2}`; `(4π)⁻¹dxdy/y²`; `c₁,₁ = 1/π = 1/vol ℙ¹`; `c₂,₁ = 2/π² = 1/vol ℙ²`; Weyl | holds |
| 9.1 | `GL₁/ℚ`; `SL₂` whole space | `[G]¹ ≅ ℤ̂^×` compact, finite rank on each level; continuous part a nonzero direct integral, not compact | holds; Müller unread (question) |
| 10.1, headline (4) | `X(N)`, `ω` | `‖dz‖² = −log|q|/2π`; connection `dq/(2q log|q|)` has Poincaré growth; frame `q·dz` violates (i) of the supplier's §5.3 | holds |
| 10.2, headline (4) | `X(N)`; `X(N)×X(N)` | `κ = (2−2g−c)/2`, `ω ↔ O(−1)`, `deg ω = (2g−2+c)/2`; `(deg ω)² = κ²·(−1)(−1)`; `χ(X̌) = |W/W_P| > 0` | holds |
| 7.5a comparison | `A_∞` action on `V_ℂ` | a `G_∞`-invariant inner product forces `A_∞ ≅ ℝ_{>0}^r` to act trivially, so the integrand is `A_∞`-invariant | holds |

- Source locators checked against the text: one (thorne-2012 lines 1463–1530, Lemmas 6.3–6.4 in arXiv v1). Gross, Mumford and Harish-Chandra 1966 are paywalled; Harish-Chandra 1953, Müller 1989 and 1998, and Harris could not be fetched from any known legal host; Knapp and Harish-Chandra IV–VI are books or paywalled.
- Library declarations opened at the pins: `FDRep.average_char_eq_finrank_invariants` (Mathlib RepresentationTheory/Character.lean:214), `ContRepresentation` (RepresentationTheory/Continuous/Basic.lean:55), `LieGroup` (Geometry/Manifold/Algebra/LieGroup.lean:72), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105), `LieAlgebra.Orthogonal.indefiniteDiagonal` (Algebra/Lie/Classical.lean:175), `NumberField.AdeleRing`, `IsDedekindDomain.FiniteAdeleRing`, and `TauCeti.OperatorIdealFamily.traceClass` (TauCeti Analysis/OperatorIdeal/Family/TraceClass.lean:59). All elaborate with `#check`.
- Cross-roadmap citations resolved:
  - Main, all present: AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7, 6.1, 6.8, 7.4, 7.5; AutomorphicSpectralTheory §§3.4, 4.4, 4.5; VonNeumannAlgebras Layer 9; AdelicAlgebraicGroups §§2.3, 2.4, 3.4; ShimuraCompactifications §§2.3, 2.6, 2.7, 6.7, 7.12; CharacteristicClasses C2.3, C2.5, C2.6, C4.1, C4.2; CompactGroups §4.1; ClassicalGroups Layer 5.
  - Open heads, all present: AutomorphicBundles §§0.5, 5.1–5.3; SingularHermitianMetricsAndL2Methods §§5.1–5.5.
  - Four attributions misplaced (C01).
- Consumer citations spot-checked: BesselPoincareSeriesAndGramBounds §§5.13, 5.13d, 5.16, 5.18; RowTowerAndRallisIdentities §§5.3, 5.5; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a (b); ThetaLiftsForDefiniteUnitaryGroups §§1.2, 1.4, 1.6, 5.4; HermitianFormsAndLattices §5.5.
- Dependency check against the candidate merge order: `depcheck: 171 roadmaps, 1998 edges, 0 problem(s)`. The roadmap is placed at line 193, after AutomorphicBundles.
- Gate: every check passes except the two set aside below. `lake env lean` on `Suggested.lean` gives no output and exit 0. The file declares nothing, so there were no signatures to compare; a separate `#check` probe elaborated every library name the docstring cites.
- Headlines: (1) 8.3, (2) 2.4a (b) and (c), (3) 7.5a and 7.5c, (4) 10.1 and 10.2. None is statable at the pins: the pins have no real reductive groups, discrete series, reductive groups over number fields, Shimura varieties or Chern classes. The docstring names each headline and what it lacks. Nothing is stated, so there is no padding.
- Overlap check: read RowTowerAndRallisIdentities, BesselPoincareSeriesAndGramBounds, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaLiftsForDefiniteUnitaryGroups and ThetaKernelsForUnitaryDualPairs (open), and AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and BallQuotientsAndComplexHyperbolicLattices (main). Nothing is owned twice: the open roadmaps cite this roadmap's sections; AutomorphicFormsOnReductiveGroups owns the scalar holomorphic discrete series, which 6.8 extends; SingularHermitianMetricsAndL2Methods defers 10.1–10.2 to this roadmap. Searches by object (formal degree, trace class on `L²_cusp` and `L²_disc`, analytic vectors, class-set mass, Hirzebruch–Mumford proportionality) find no other owner. HilbertModularSurfaces §4.3 is a volume formula for Hilbert modular surfaces, not this theorem.

Source independence: 2 passages compared with 1 source (thorne-2012 lines 1493–1503 against the pairing bullet and route of 7.5a), none shared; the other nine cited works could not be read. Largest share: hc-1953, mumford-1977 and harris-1989 with 2 of 13 locators each. Contents compared with: none readable. The layer and section numbers follow AutomorphicFormsOnReductiveGroups, a roadmap, not a source.

Research link: 7.5a–7.5c and 10.1–10.2 are Gross's (1999) algebraic modular forms and Mumford's (1977) proportionality, and 8.3 is Harish-Chandra's (1966) formal degree. The family's theta-chain, Bessel–Poincaré and arithmetic-volume roadmaps use them for Alpöge's 2026 formal proof of the Riemann hypothesis for Dirichlet L-functions. This rests on the README's overview, its Downstream consumers and the family index.

## Not verifiable

- Gross 1999, §§4–8 (7.5a): paywalled (Springer DOI); cited by locator only.
- Mumford 1977 (10.1, 10.2): paywalled (Springer DOI); no theorem number given.
- Harish-Chandra 1966 (8.3): no legal copy found by the sources service.
- Harish-Chandra 1953 (8.1, 8.2): the AMS landing page is on a host the service does not classify; not read.
- Müller 1989 and 1998 (9.1): JSTOR and Springer; not read.
- Harris 1989 (10.1, 10.2): Wiley returned 403; not read.
- Knapp 1986, Ch. VI, and Harish-Chandra IV–VI (6.8): book and JSTOR; not read.
- Thorne 2012, Lemma 6.4: read in arXiv v1 (1107.5989v1); the numbering of the published version was not checked.
- 2.4a (b), the variant of (c), (d), and 2.4b: no source is cited (R02, C05).

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review (so that no other roadmap is edited unseen) lists the three files of the family index (its README, `Suggested.lean` and `metadata.toml`), which belong to this pull request; the dependency check run against main's merge order reports the roadmap as not yet in the order, which the intake settles for a new roadmap (against the candidate order it reports no problem).

## Source issues

- none

## For the human reviewers

- Not tested: no cited text except Thorne 2012 could be read legally, so the wording and arrangement were not checked against the sources with the largest share (hc-1953, mumford-1977, harris-1989, two locators each).
- Scope: 2.4a, 2.4b and 6.8a cite no published source; the family index (`RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14) bases the family on a formal Lean proof announced on 20 November 2026.
- Organisation: the README describes itself as extending AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and AutomorphicBundles, and numbers its sections after the first (2.4a, 6.8, 7.5a–7.5c); it is not titled as a Part II of any of them.
