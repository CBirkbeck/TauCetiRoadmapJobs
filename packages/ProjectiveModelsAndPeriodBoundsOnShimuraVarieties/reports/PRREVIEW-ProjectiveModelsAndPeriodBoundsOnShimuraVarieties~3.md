# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #2910 at 092ae89)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** needs changes

**Summary.** Two findings block acceptance. First, the conclusion of 6.7a never says that `P(w)` takes values in the period lattice of the fibre, so a period map changed by a real symplectic matrix also satisfies (a)–(e). Second, the statements the README does not prove (6.7a, 6.9a, 7.12a, 7.31a (a), the cubical extension in 7.31a (b), 7.31a (b′), 9.1) cite their sources with no theorem, page, file or declaration, so none of them can be checked. There are four small corrections and one format note. A human should note that the main source is a formal proof announced the day before this review, and that the two papers by Lan could not be read.

## R01 (P2) — The conclusion of 6.7a does not tie `P(w)` to the periods of `G`, so it does not state the logarithmic periods it is named for

The consumer ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties reads 6.7a as "the logarithmic periods at a boundary point" of a chart. As written, though, (b)–(e) of 6.7a (lines 139–142) link `P` to `G` only through `H(u)`. (c) asks that `π·H(u)` be the Hodge form of the fibre at `ψ_{ρu}` and that `Im(P(w)x·H(u)·(P(w)y)^*) = E(x, y)`. Nothing asks that `P(w)(Λ)` be the kernel of the exponential map of that fibre.

Counterexample, using the Tate curve of the Check (line 152). Take `P′(w) = P(w)∘γ` with `γ = (1 b; 0 1)` and real `b ∉ ℤ`.
- `γ` preserves `E`, so (c) still holds: `H` depends only on `Im(τ + b) = Im τ`.
- `γ` commutes with `T = (1 1; 0 1)`, so (d) holds with the same `T`.
- `γ` fixes `e₁`, so (e) holds with the same `W`.
- But `P′(w)(Λ) = ℤ + (τ + b)ℤ`, which is not the period lattice `ℤ + τℤ`.

The route (line 146) does define `P` as a flat frame of the kernels. The smallest repair adds this to (b) or (c): "for every `w`, with `u` the image of `w`, `P(w)(Λ)` is the kernel of the exponential map `ℂ^g → G(ψ_{ρu})` in the given frame, and `E` is the commutator pairing of `ℒ` on it". The same sentence belongs in the formal-proof form on line 144.

## R02 (P2) — The statements the README does not prove cite their sources with no locator, so none of them can be checked

A reader cannot confirm that a cited text proves the statement as written, and a reviewer cannot verify the seeded sample. These statements are affected:
- **6.7a:** the route lists unproved steps (line 146) and points to "Mumford; Faltings–Chai; … Schmid and Cattani–Kaplan–Schmid" with no theorem or page.
- **6.9a and 7.12a:** they rest on [FormalProof] alone (line 519), and 7.12a's route leaves several steps unproved (line 184).
- **7.31a (a):** "A theorem of Lan … 2016" (line 337), with no result named.
- **7.31a (b):** the extension of `ℒ_A` to a cubical `ℒ_G` (line 260) has neither a proof ("not given here", line 392) nor a source. The consumer cites exactly this sentence of 7.31a (b).
- **7.31a (b′):** "its proof is not given here" (line 395), with [FormalProof] as the only source.
- **9.1:** cites [DN] with no number.

[FormalProof] is a repository. Its top level and `src/` are public, but none of these statements could be found there without a file or declaration name.

The repair is one locator per statement:
- for [FormalProof], the file and declaration name of each form recorded at 6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 7.31a (b′) and 9.1;
- for 9.1, [DN] Théorème 2.3 (§2; DN line 408), which this review checked;
- for 7.31a (a), [Lan16] Propositions 6.1 and 6.4, pp. 32–35, which ShimuraCompactifications §7.31 already uses for the same minimal input;
- for the cubical extension in 7.31a (b), a theorem that proves it over a normal base, or a route.

## C01 — 6.2a (b) is now wider than [FormalProof], but the text still says its form is taken from there, and its route leaves out the case it adds

6.2a (b) (lines 52–55) now covers any field of characteristic zero and any semi-abelian `G`. The README contradicts itself about this:
- References (line 519) still says "The forms of 6.2a (b) … are taken from" [FormalProof].
- The Conventions paragraph (lines 17–20) says that a wider form is "this roadmap's own, proved by the route written here".
- The route says that the non-abelian generic fibre step "is not given here" (lines 98–100).

The statement itself is true: take the closure in `G` of the generic subtorus (a subtorus over the smooth curve, by the extension over a normal base that ShimuraCompactifications §6.2 uses). Its Lie algebra is a flat bundle with finite monodromy, whose subsheaves have degree `≤ 0`. The quotient has abelian generic fibre, so the written route applies to it.

The fix has two parts:
- either record the form [FormalProof] has at 6.2a (b), as the Conventions require, or drop 6.2a (b) from the sentence on line 519;
- either write the dévissage above in two sentences, or cite it.

## C02 — The Scope paragraph misdescribes what ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties uses

Line 484 says that this consumer uses 7.31a (b′), and that (b′) "is the form that … ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties use[s] for the cubical line bundle". At that roadmap's open head, every citation of 7.31a is to (b), never (b′). This includes its supplier contract, which takes "for a self-dual lattice and `w_0`, the cubical line bundle of the principal polarisation" from (b).

Either change the sentence to "7.31a (b)", or ask that roadmap to cite (b′).

## C03 — 9.1 says "the general case is [DN]", but [DN] proves only the complex case, for reductive groups

[DN] works over ℂ (DN line 41). Théorème 2.3 (DN line 408) is stated for:
- a reductive group with a good quotient;
- closed points with closed orbit;
- a conclusion that is a `G`-isomorphism.

Over a field `k` of characteristic zero, 9.1 does follow:
- the inertia group of `x` is the stabiliser of a geometric point over `x`;
- `N = (π_*L)^Γ` works, because invariants commute with the flat base change to `k̄`.

Line 461 would read better as "the case `k = ℂ` is [DN] Théorème 2.3; a general field of characteristic zero follows by flat base change of invariants".

## C04 — The supplier contract says SchemeAndStackFoundations Layer 2 provides the twisting lemma for relative ampleness, but that layer does not state it

7.17a's route (line 222), its *Needs:* line, and the contract on line 498 all take this from SchemeAndStackFoundations Layer 2: "a line bundle relatively ample for a projective morphism, twisted by a large power of the pull-back of a relatively ample line bundle on the target, is relatively ample". On main, that Layer 2 is sites and scheme cohomology (§§2.1–2.23). It takes relative ampleness from StableReduction Layer 2 (main README, the *Needs:* of §2.6), and neither layer states this lemma.

Cite it as Stacks, Lemma 29.38.8 (0C4K), at the route and in the contract (it needs a quasi-compact base). Alternatively, state it as a step of 7.17a with that locator.

## N01 — 6.7a and 6.9a, in Layer 6, use the setting of 7.31a (b′) from Layer 7

`E`, `w_0` and the moduli charts appear at 6.9a (line 156) and in the formal-proof form at 6.7a (line 144), but they are defined only in Layer 7. A sentence in Conventions defining `E` and `w_0` would remove the forward reference.

## Questions for the author

- What proves the extension in 7.31a (b) of the cubical `ℒ_A` to `G` over a normal `Y` that need not be regular? On a normal base, a Weil divisor on `G` need not be Cartier. No source is cited, and I did not consult Moret-Bailly's *Pinceaux*.
- Does the statement of 6.7a in [FormalProof] identify `P(w)(Λ)` with the period lattice? I could not locate it in the repository without a file name.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 6.2a (a) constant `c_λ` | `g = 1`, principal, `dz` | `∫ i dz∧dz̄ = 2 Im τ`; `c_λ·2 Im τ = Im τ/π`; README `Im τ/π` | agrees | none |
| 6.2a (a) general `g` | `H`-orthonormal `dz₁` | `∫ iα∧ᾱ∧c₁^{g−1} = 2(g−1)!·vol = 2(g−1)!√deg λ`; README same | agrees | none |
| 6.2a (a) determinant identities | lattice in `z`, Riemann form `H` | `det h = π^{−g}/det H`; `‖·‖²_Fal = √deg λ/det H`; `‖·‖²_Del = π^{−g}‖·‖²_Fal` | all three agree | none |
| 6.2a (a) growth bound | Tate curve, frame `du/u` | `‖du/u‖² = 4π²·Im τ/π = 2 log(1/|q|)`: logarithmic, `≥ c` near `q = 0` | agrees | none |
| 6.2a (a) two polarisations | `λ′ = λφ`, `φ` Rosati-symmetric | eigenvalues of `φ` constant in `[m, M] ⊂ (0, ∞)`, so `mH ≤ H′ ≤ MH` uniformly | true | none |
| 6.2a (a) exponent sharpness | `E_t × E_t`, `rk Q = 2` | det of Gram matrix `≍ t²`; upper bound `C²(1+t)²` | attained | none |
| 6.2a (b) (headline) | split torus; `G_m × E` boundary curve; non-abelian generic fibre | `deg O^r = 0`; `O ⊕ ω` nef; extension by subtorus gives `deg F ≤ 0 + 0` | true; route gap | C01 |
| 6.2a (b), Check 1 | constant surface over `ℙ¹` | `O² → O(1)` surjective, quotient of degree `1 ≥ 0` | agrees | none |
| 6.7a (a)–(e) | Tate curve, `P′ = P∘(1 b; 0 1)`, `b ∉ ℤ` | (c), (d) and (e) hold for `P′`; lattice `ℤ+(τ+b)ℤ ≠ ℤ+τℤ` | under-determined | R01 |
| 6.7a, Check | `q = u`, `τ = w/2πi` | `H = 1/Im τ = 2π/log(1/|u|)`; `P(w+2πi)(m,n) = P(w)(m+n,n)`; `E(e₁,e₂) = −1` | agrees | none |
| 6.9a, Checks | `G_m`; supersingular; trivial `L` | `V = id` (ShimuraCompactifications §6.18), so `α = (1,0)`, `β∘α = 0`; `dV = 0`; `K(L) = B` violates the hypothesis | agree | N01 only |
| 6.9a vs de Rham | principally polarised `A` | Hodge `0→ω→H¹→Lie A^∨→0`; conjugate `0→Fr^*Lie A^∨→H¹→Fr^*ω→0`; ranks `d, d, 2d` | agrees | none |
| 7.12a, fibre condition | abelian point; boundary point | `deg λ` constant on flat normal `Y`, so `K` trivial; line bundles on a torus extension come from `B` modulo `c(X)`, so `K(M)` is well defined | consistent | R02 (locator) |
| 7.17a (a), Check (headline) | `X(N)`, `pol = 1` | `12 deg ω = N·#cusps`; degree `#cusps(aN/12 − d) > 0` iff `a > 12d/N`; `a = 0` gives `−d·#cusps` | agrees | none |
| 7.17a, route | `L ⊗ f^*M^a` | Stacks 0C4K gives relative ampleness for `a ≫ 0`; SchemeAndStackFoundations Layer 2 lacks it | true, wrong citation | C04 |
| 7.31a (b), cubical data | `ℒ_A = (1, λw₀)^*𝒫` | `φ = λw₀ + w₀^∨λ = λ(w₀+w̄₀) = λ`; `(1,w₀)^*Λ(ℒ_A) = ℒ_A`; `(a×1)^*Λ = (1×λā)^*𝒫` | agree; extension unsourced | R02, question |
| 7.31a (b) gluing (headline) | `V_𝔭 = W ∪ {𝔭}` | complement is a finite set of closed points, so open; `V_𝔭 ∩ V_𝔭′ ⊆ U₀` | sound | none |
| 7.31a (b′) | `d ≡ 7 (16)` | `−d ≡ 1 (4)`, so `w₀` is integral and `w₀+w̄₀ = 1`; complex dimension `Σ_Φ(p+q) = (p+q)[E:ℚ]/2`; `dim Sh = [E⁺:ℚ]pq` | consistent | R02 (locator) |
| 7.31a (b′), marking | `L = 𝔐L + 𝔐̄L` | `𝔐̄L ↠ L/𝔐L` and `𝔐̄L ∩ 𝔐L = ML`, so `η` is well defined | consistent | none |
| 7.31a, Checks 1, 3, 4, 5 | `N = 6, 12, 18`; `diag(p⁻¹,1)`; `ℓ` odd | `Γ(2) ∋ −I`; `N = 12` has parts 3 and 4; `N = 18` fails at 3; conjugate is `[[1,p⁻¹],[0,1]]`; `v_ℓ((1+ℓ^k)²−1) = k`; `dim A₈ = 36` | agree | none |
| 9.1, Checks | `ℙ¹`, `t ↦ −t` | `O([0])`: fibre `T₀`, action `−1`, degree 1 odd; `O(2[0]) = π^*O(1)`, degree 2 | agree | none |
| 9.1 vs [DN] | `k` not algebraically closed | inertia is the stabiliser of a geometric point; `(π_*L)^Γ` commutes with `⊗k̄` | 9.1 true; DN covers ℂ only | C03, R02 |

- Source locators checked against the text: [DN] Théorème 2.3 and Lemme 2.2 (DN lines 390–493, ground field at DN line 41); Faltings 1983, §§3–4, pp. 340–342 (comparability of polarisations, logarithmic singularities, the Lemma on non-negative curvature); Stacks 0C4K.
- Cross-roadmap citations resolved (34): ShimuraCompactifications §§0.15, 6.1, 6.2, 6.4–6.9, 6.18, 7.3, 7.16, 7.17, 7.19, 7.20, 7.31; PELModuli M0.5, M0.7, M4.5, M4.6; SchemeAndStackFoundations §§0.8, 0.9, 0.20, 4.11, 4.12 and Layer 2 (drift, C04); ArakelovGeometryAndAbelianHeights §§2.0, 2.1, 2.2, 2.8, 5.3; AbelianSchemesAndArithmeticModuli A4.3, A5.2, A5.6; SingularHermitianMetricsAndL2Methods §§2.5, 3.2a, 5.3 at its open head.
- Library opened at the pins: `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71` (`IsAmple`, absolute only); `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (over a field). There is no semi-abelian, torus-over-a-base or Hodge-bundle carrier, which confirms the docstring's claim that nothing is statable.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, DiscreteSeriesCoefficientsAndAutomorphicMetrics, TaylorBoundsAndDepthsOnHeightTwoFormalGroups (open), and ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, PELModuli (main). Nothing shared:
  - ArakelovGeometryAndAbelianHeights §5.3 owns logarithmic growth of the determinant only; 6.2a (a) extends it to the Gram matrix and cites it.
  - DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.1 owns good invariant metrics on Shimura varieties; 6.2a (a) covers arbitrary degenerations.
  - ShimuraCompactifications §7.31 takes the minimal input as a hypothesis; 7.31a (a) supplies it.
  - AlgebraicModuliForArithmeticGeometry §5.3 descends finite algebras, not line bundles; 9.1 is owned here.
- Dependency check output: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Automatic checks: all passed. No changes outside the folder beyond the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output. It has no declarations, so there was nothing to `#check` or to probe with one tactic.

Source independence: 5 passages compared with 2 sources (9.1 statement, 9.1 route and 9.1 Checks against [DN] §2; 6.2a (a) comparability and the 6.2a (b) route against Faltings 1983 §§3–4), none shared. Largest share is [FormalProof], with 15 of about 40 source mentions; the README gives almost no theorem-level locators. Contents comparison with [FormalProof] was not possible: it is a Lean repository whose statements were not located. The layers are numbered after the layers of ShimuraCompactifications, which is a roadmap and not a source.

Research link: The headline targets are inputs that the README says Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions uses (2026, [FormalProof], [Announcement]). 6.2a is the semipositivity of Hodge bundles of Faltings 1983, and 7.17a and 7.31a extend Lan's integral compactifications (2016, 2017). This rests on the README; for Faltings 1983 it also rests on the text, read at §§3–4.

## Not verifiable

- [FormalProof] forms recorded at 6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 7.31a (b′) and 9.1: I opened the repository's top level, `src/` and `src/Statements.lean` (the four end statements only). No file or declaration is given, and the forms were not located.
- [Lan16] (Forum Math. Sigma 2016) and [Lan17] (IMRN 2017): the author's page returned HTTP 403, and the publisher's page is in no licence class.
- Mumford 1972, Schmid 1973, Cattani–Kaplan–Schmid 1986, Faltings–Chai 1990, Kollár 1987, Griffiths 1970, EGA II: the README gives no locator to check.

## Source issues

- **Misprint** in DN at Théorème 2.3 (HAL version, p. 11): the statement names the bundle `F` and then says that `E` descends; it should say `F`; affects nothing.

## For the human reviewers

- Scope and source: 6.9a, 7.12a and 7.31a (b′) rest only on [FormalProof] (README line 519), a Lean repository announced on 20 November 2026 and not refereed. The literature does not state these forms, as far as the README's references show.
- Not tested: [FormalProof], the source with the largest share, was not checked for wording or arrangement, because its statements could not be located.
- Licence: the licence of the [FormalProof] repository was not read.
