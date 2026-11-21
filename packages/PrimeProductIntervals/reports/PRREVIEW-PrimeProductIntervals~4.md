# Review of PrimeProductIntervals (pull request #2865 at 35753e0)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired, and the changed statements were recomputed and are correct. `Suggested.lean` now elaborates at the pins with `sorry` as the only warning, and the global theorem, from the Chirre–Hagen inequality to every `x ≥ 9.6·10³⁷`, is stated there with the hypotheses of Theorem 3 of that paper. There are no small corrections and one format note. For the humans who approve: the deduction's only source is a manuscript deposited on Zenodo inside an archive, which I could not read through a classed source, so its locators are unchecked.

## N01 — Five declarations of `Suggested.lean` are not named in the README

Layers 1 and 2 state what `exceptional_cost`, `reciprocal_volume`, `mem_pairStarts` and `volume_pairStarts_le` assert (items 2 and 3 of Layer 1, the identity and the length bound of Layer 2) without their names, and `balancedProducts` is described only in the Summary; only the two Layer 3 theorems are named. Naming each at its statement would let a reader match prose to Lean.

## Previous findings

- R01 — repaired: line 40 reads `noncomputable def pairStarts (x a b u p q : ℝ) : Set ℝ`; the file elaborates at the pins, warnings only `sorry` on lines 29, 34, 53, 66, 76.
- R02 — repaired: `bounds_of_global_moment` (lines 76–82) takes the inequality for all `Y ≥ 10¹³`, `0 < d ≤ 1/10¹³` and concludes count and weight for `x ≥ 96·10³⁶`; Layer 3 names it under "Global estimate".
- C01 — repaired: `mem_pairStarts` is proved and its docstring calls it an endpoint check; the length bound is stated as `volume_pairStarts_le`.
- C02 — repaired: the Summary now reads "Layer 1 of SieveMethodsAndPrimePatterns develops Brun and Selberg sieves"; that layer on main is titled "Brun and Selberg sieves and polynomial values".
- C03 — repaired: the Henriksson entry carries DOI 10.5281/zenodo.24416597 and each layer statement has a locator (pages 1–3, equations (1)–(4), Theorem 1.1); Chirre–Hagen §4, Theorem 3 is cited at the global hypothesis. The Henriksson locators themselves are under Not verifiable.
- N01 — repaired: no `$` delimiters remain; displays are code blocks.
- N02 — repaired: one `public import Mathlib`; the module docstring names the two headline theorems; every declaration has a docstring.
- N03 — repaired: the external declaration names, "in this proposal" and the Lean version are gone.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Endpoint check, Layer 2 (seeded sample) | x=35, u=2, p=7, [3,8]; q=5, q=11 | q=5: [3,8]∩[7/2,7)∩(7,14] = ∅. q=11: [3,8]∩[7/2,7)∩(35/11,70/11] = [7/2,70/11] | as stated; a computation, no source | none |
| `mem_pairStarts` (now proved) | u,q,t>0 | p/u≤t ⇔ p≤ut; x/q<t ⇔ x/t<q; t≤ux/q ⇔ q≤ux/t | elaborates without `sorry`; marked as endpoint check | none |
| `volume_pairStarts_le` (new) | p≤0; p>0; b≤0; d=0; −1<d<0 with p<0 | p<0: p/u>p, set ∅. p>0, nonempty: p/u≤b, length ≤ p−p/u = dp/u ≤ db. −1<d<0, p<0: length pd/u > 0 = ofReal(db), so `0<d` is needed; `0<b` is not (b≤0 gives ∅) | true as stated; not closed by `simp [pairStarts]`, `measurability` or one `measure_mono` | none |
| Two scales (seeded sample), `bounds_of_two_scales` | bands a=3N/2,Y=2N and a=N/2,Y=2N/3 | 3d·4N²L²/(d·3N/4)² = 64L²/(3d) = N/24; 3d·(4N²/9)L²/(dN/4)² = N/24; N/2 − N/24 − 4N/24 = 7N/24; (7N/24)·d²N²/(16L²)/(2dN) = 7dN²/(768L²) = 14N/3 | README and Lean agree (Y ∈ {2N, 2N/3}, bound 3dY²L², d = 512L²/N) | none |
| Window and weight | d<1; x=9.6·10³⁷ | (1+d)² < 1+3d; 3dx = 1536L²N = 384√x·log²x (both 2.877796·10²⁵); least factor q, weight 1/p > 1/(3N); (14N/3)/(3N) = 14/9 | as stated; open window matches `balancedProducts` | none |
| Global estimate (seeded sample), `bounds_of_global_moment` | x=9.6·10³⁷; B=9797·10¹⁵ | B² = 9.5981209·10³⁷ < 9.6·10³⁷; log B = 43.72861 < 656/15 = 43.73333; 512(656/15)²/B = 9.99544·10⁻¹⁴ < 10⁻¹³; 2N/3 = 6.53·10¹⁸; dN = 512L² ≈ 9.79·10⁵ > 2.0001; 2.5571·log²(2.0001/d) = 2398.68 ≤ 3L² = 5736.60 | true; (log N)²/N decreases for N > e² | none |
| Chirre–Hagen, Theorem 3 against line 46–51 and the Lean hypothesis | read at arXiv v1 | J_θ(x,δ) ≤ 2.5571·δ·log²(2.0001/δ)·x² for x ≥ 10¹³, δ ∈ (0,10⁻¹³], under RH; J_θ as in Conventions; Theorem 3 opens §4 | README and Lean match the source | none |
| `thetaMoment` junk value | integrand on [1,Y], d ≥ 0 | θ monotone, so the integrand is bounded and measurable on [1,Y]: interval integrable, no junk 0 | `exceptional_cost` not falsified by the convention | none |

The rows for the untouched statements (`exceptional_cost`, `reciprocal_volume`, the length and pair-count estimates) stand as in the previous review, of `37a574a`.

- Source locators checked against the text: 2 (ChirreHagen lines 34–41 for the definition of J_θ, lines 669–677 for §4, Theorem 3; arXiv:2512.23534v1, to which the cited DOI resolves).
- Library and cross-roadmap: no Selberg sieve in the pinned Tau Ceti (unchanged); ExplicitPrimeCounting and SieveMethodsAndPrimePatterns are on main and both relative links resolve; SieveMethodsAndPrimePatterns Layer 1 has the cited subject. Both are named as context, not as suppliers.
- Near-matches: none in the pinned Mathlib or Tau Ceti for `volume_pairStarts_le` or `bounds_of_global_moment` (no same-name hit; no statement about `Chebyshev.theta ((1 + d) * v)`).
- Elaborated types of all ten declarations compared with the README: no binder lost; the two Layer 3 theorems carry `96 * 10 ^ 36 ≤ x` and the constants of Layer 3.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `sorry` is the only warning (lines 29, 34, 53, 66, 76). No `set_option`, no sorried data, no change outside the folder.
- Pull request text read against this head: one proved identity and five `sorry` statements, both deductions in Layer 3, the build at the pins; nothing contradicted.
- Overlap check: the three closest-roadmap lists are empty; read the scope of ExplicitPrimeCounting, ProbabilisticAndMetricNumberTheory (Layer 5) and SieveMethodsAndPrimePatterns (Layer 1); nothing shared: none states the relative mean square of theta increments, its exceptional set or a count of semiprimes in a window.
- Source independence: changed passages only; 3 passages compared with 1 source (ChirreHagen), none shared beyond the formula of Theorem 3; largest share Henriksson, 6 of 8 locators in the layers and scope, text not read, so the passages citing it were not compared; no layer added, removed or reordered.
- Research link: Layer 3 takes as hypothesis the explicit RH bound for Selberg's integral of Chirre–Hagen (2026, Theorem 3), proved there for Goldbach numbers in short intervals, and applies it to the composite reading (Tao 2025, Zhang 2026 §1.1) of a question of Erdős–Graham (1980). Rests on the README and on both texts read.

## Not verifiable

- Henriksson, Theorem 1.1, Theorem 1.2, §2, equations (1)–(4) and the page numbers of Layers 1–3: the DOI resolves to a Zenodo record (v2, one archive file) on a host the sources service does not class; the manuscript inside it was not read. The mathematics at each locator was recomputed independently.
- Chirre–Hagen: "§4, Theorem 3" was confirmed in arXiv:2512.23534v1; the published numbering and the volume and article number were not compared.
- Erdős–Graham, p. 92, and the sentence that only the preceding sum excludes primes: the linked scan is on a host not classed as legal; not read.
- Tao's comment: the discussion site is not a classed host; known only through Zhang §1.1, read in the previous review.

## Source issues

- none

## For the human reviewers

- **Scope.** The deduction (Layers 1–3) has one source, Henriksson's manuscript (README line 74), deposited on Zenodo and not refereed; the description says an AI model is the principal contributor to its proof. No refereed source states the headline.
- **Licence.** DOI 10.5281/zenodo.24416597 resolves to a record of type software titled as a proof package, one archive, licence CC-BY-4.0; the manuscript is inside the archive and was not read.
- **Licence.** README line 75 names an earlier companion Lean project (DOI 10.5281/zenodo.24414348) partly adapted from S. Hubbard's Apache-2.0 LeanLab code and says the roadmap imports no code; `Suggested.lean` was not compared with either.
- **Not tested.** Henriksson has the largest share of locators (6 of 8 in the layers and scope) and its text was not read: wording and arrangement were not compared with it.
- **Licence.** The Erdős–Graham scan (References, line 71) is on a university page that the sources service could not class as an author's page.
