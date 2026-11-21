# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #2909 at 324834b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** accepted

**Summary.** Accepted. The `U(1, 1)` Check of 2.4a now gives the right specialisation of the kernel bound. 2.4a (b)–(d) and 2.4b now cite the formal proof. The bounds of 2.4a (c) now assume `q₀ ≥ 1`. The new Blattner, Harish-Chandra, Müller and Mumford locators check out against the texts. There are two small corrections and one format note, none blocking. The main correction: the formal proof is cited as a whole, with no module or declaration, so a reader cannot find 2.4a (b)–(d) or 2.4b in it or compare their thresholds. For the human reviewers: those statements rest only on an unrefereed formal proof whose public mirror says it carries no licence.

## C01 — 2.4a (b)–(d) and 2.4b cite the formal proof as a whole, so neither the statements nor their thresholds can be found in it.

These are headline (2). BesselPoincareSeriesAndGramBounds and RowTowerAndRallisIdentities use them with their exact constants, and the formal proof is their only support. So a reader who wants to check a threshold such as `h ≥ 120·n·q₀^{3/2}` or `h > t₁ + n² + 3 + l` has nowhere to look. The sentence after 2.4a (d) (line 39) says that these statements, "with their thresholds, are statements of [FormalProof]". The sentence after 2.4b (b) (line 59) and the References entry (line 376) say the same. None of the three names a module or a declaration. The repository that the entry links has about 45,000 Lean files.

The smallest repair is the one the previous round asked for. After each attributed statement, give the module and the declaration of the formal proof that proves it. Where a constant here simplifies the formal hypothesis rather than copying it, say so. The attribution itself is now explicit, and nothing I computed contradicts the statements, so this does not block.

## C02 — Four cited works still carry no theorem or page number.

Harish-Chandra 1966 (route of 8.3), Müller 1998 (9.1, for general `f`), Harris 1989 (10.1, 10.2) and Zuckerman 1977 (route of 2.4b; References, line 375) are cited by the whole paper. Gross (§§4–8) and Knapp (Ch. VI) are cited by a range. Where the theorem is known, adding its number would let a reader check the hypotheses at the claim. Examples are the tensor-product theorem of Zuckerman 1977 and the theorem of Müller 1998 that drops `K`-finiteness.

## N01 — Line 31 of `Suggested.lean`, which the change rewrapped, is 109 characters long; rewrap it below 100.

## Questions for the author

- Which declarations of the formal proof state 2.4a (b), the variant of (c), (d) and 2.4b? Do their gap hypotheses reduce to the README's constants: `120·n·q₀^{3/2}`, `max(8nq₀, npq + 1)`, `8√(2q₀)·(N + 2nq₀)`, `t₁ + n² + 3 + l`? For example, is 2.4b (b) the theorem `Gp91.GlobalTheory.T.pieri_tensor_decomposition`, in the module `CompanionTheory.AutomorphicTheory.PieriRules.ThetaBesselIsometries.PieriTensorDecompositionStatement`? It decomposes the exterior powers and the dual under hypotheses `HypsG` and `Num k r lam u b bv ga h q0`. I could not locate where those hypotheses are defined in a repository of that size without the names.
- The formal statements I opened index the group by `Fin (2 * r + k + 1)`. If `r` is `q₀`, they cover only `p ≠ q`. 2.4a and 2.4b are stated for `p = q` too, and the first Checks of both use `U(1, 1)`. What do `r` and `k` stand for? The definition of `Rep k r` was not among the files I could identify.

## Previous findings

- R01 — repaired: "Here, with `t = |x|`, `‖X‖²_HS = 2t²` and `√(2q₀) = √2`, so (a) is `cosh(t)^{−(h+1)} ≤ exp(−(h/8)·min(2t², t))`, true because `log cosh t ≥ min(t²/4, t/8)`".
- R02 — partly repaired: "The formula (b), the variant of (c) under `h > max(8nq₀, npq + 1)` and (d), with their thresholds, are statements of [FormalProof]". The formal proof is now in the References, but no module or declaration is named (C01).
- C01 — repaired: boundary components now cite ShimuraVarieties §2.1; Weyl's formula now cites LieHighestWeight Layer 6; the trace class of `BC` now cites AutomorphicSpectralTheory §0.9; the minimality of `Λ` is derived from Blattner's formula (Hecht–Schmid, Theorem (1.3)).
- C02 — repaired: "(c) *(decay)* for `q₀ ≥ 1`, under the hypotheses of (b)", and headline (2) and the docstring of `Suggested.lean` now assume `p, q ≥ 1`.
- C03 — repaired: "`F = ℂ^n ⊗ (ℂ^n)^∨` has the zero weight with multiplicity `n` … `σ ⊗ F` contains `σ` exactly `n` times, once for `n = 1`".
- C04 — repaired: "RowTowerAndRallisIdentities also uses 9.1 (RowTowerAndRallisIdentities §§5.3, 5.9), and 6.8 and 8.3 for its model lifts (RowTowerAndRallisIdentities §5.7)". All three sections cite this roadmap at that roadmap's head.
- C05 — partly repaired: Harish-Chandra 1953, Müller 1989 and Mumford 1977 now carry theorem and page numbers, Zuckerman 1977 is in the References, and the citation of Schmid 1971 is gone. Four works still have no locator (C02).
- C06 — repaired: the description now says the versions of the family index differ and says how they merge.
- N01 — repaired: "`(𝔤/𝔮)^∨`, `𝔮` the Lie algebra of the parabolic subgroup of `G_ℂ` stabilising a point of `X̌` (not the Cartan complement `𝔭` of the Conventions)".
- N02 — repaired: "Mathlib `FDRep.average_char_eq_finrank_invariants` (one class)" in 7.5c and in From Mathlib.
- Question (9.1, general `f`) — answered: Müller 1989, Corollary 8.8, for `K_∞`-finite `f`, and Müller 1998 for general `f`. The 1998 text is not readable (it is settled as uncertified).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.4a Check 1 (R01) | `U(1,1)`, `h = 10`, `x = 0.7+0.3i` | `‖X‖_HS = 1.0770`; `min(‖X‖², ‖X‖/√2) = min(1.16, 0.7616)` equals the Check's `min(2t², t)`; `0.0538 ≤ 0.3860` | holds |
| 2.4a Check 1, justification | `t ∈ (0, 50]`, step `10⁻⁴` | `log cosh t − min(t²/4, t/8) ≥ 2.5·10⁻⁹`, smallest as `t → 0`; at `t = 1`: `0.434` vs `0.125` | holds |
| 2.4a (c) with `q₀ ≥ 1` (C02 earlier) | `q₀ = 0`; `q₀ = 1` | `q₀ = 0` now excluded, so no `0/0`; `q₀ = 1`: `√(2q₀) = √2`, `A = h/(8√2)` | holds |
| 2.4a (d), last sentence | `N = 0` | `8√(2q₀)·(0 + 2nq₀) = 16√(2q₀)·n·q₀`, the stated `max(npq + 1, 16√(2q₀)·n·q₀)` | holds |
| Headline (2), README and docstring | `p, q ≥ 1` against 2.4a (c) | both need `q₀ ≥ 1`; `U(n, 0)` excluded on both sides | agree |
| Conventions: `Λ` the unique minimiser | `U(1,1)`, `λ = (h/2, −h/2)`; `U(2,1)`, `λ = (2, 1, −3)` | `λ + ρ` pairs to `h + 1`; `(3, 1, −4)` pairs to `2, 7, 5`; difference `2⟨λ+ρ, β⟩ + ‖β‖² > 0` | holds |
| Conventions: Blattner support | hecht-schmid-1975 lines 98–101 | multiplicity `Σ_w ε(w)Q(w(μ+ρ_c) − λ − ρ_n)`; nonzero forces `μ − Λ` into the positive-root cone; `Q(0) = 1` | supports |
| 2.4b, Hecht–Schmid hypothesis | `ε = (+,−)`, `h = 2, 1`; `(+,−,+)`, `μ = (3,1,−1)`; `(+,+,−)`, `μ = (3,2,0)` | `⟨μ ± e_s, β⟩ ≥ h − 1`: `≥ 1` at `h = 2`; `0` at `h = 1` (`μ + e₂`) | holds; `h = 1` fails, as the Check says |
| 2.4b Check 3 (C03 earlier) | `n = 1`, `n = 2` | zero-weight multiplicity `1`, `2`; trivial summand `1`, adjoint zero weight `n − 1` | holds |
| 8.1 locator | hc-1953 lines 971–978, 1713–1715 | Lemma 34: `K`-finite vectors of a permissible representation with finite-dimensional isotypic parts are well-behaved (`x ↦ π(x)ψ` analytic) | supports, for semisimple `G` as stated |
| 8.2 locators | hc-1953 lines 1723–1728, 1817–1819 | Theorem 5: closed invariant subspaces ↔ submodules of the `K`-finite part; Theorem 8: infinitesimally equivalent ⇔ equivalent | supports |
| 8.3 (Needs changed) | compact `G`; `SL₂`, `D_k` | `d = dim π_λ` by Weyl (LieHighestWeight Layer 6); `d = k − 1 = dim Sym^{k−2}` | holds |
| 7.5c, Mathlib case (N02 earlier) | `Γ = {±1}` over `ℚ`, trivial and sign | `½(1 + 1) = 1 = dim M^Γ`; `½(1 − 1) = 0`; needs `2` invertible | holds |
| 9.1, discrete spectrum | muller-1989 lines 2108–2117 | Corollary 8.8, printed p. 84: `K`-finite `h ∈ C_c^∞(G(𝔸))` gives trace-class `R_d(h)`, `G` reductive over `ℚ` | supports the `K_∞`-finite case |
| 10.1 (`𝔮`, locators) | `X(N)`; mumford-1977 lines 681–682, 993–994 | `𝔤/𝔮 = 𝔭⁺` is one-dimensional and `(𝔤/𝔮)^∨` gives `Ω¹ = ω²`; Main Theorem 3.1: a unique good extension; Proposition 3.4 a): `Ω¹(log)` | holds |
| 10.2 (locators) | `X(N)`; mumford-1977 lines 170–172, 902–912 | Mumford: `c^α(Ē) = (−1)^d·vol·c^α(Ě)`; log Gauss–Bonnet gives `(−1)^d·vol = κ_K`; `deg ω = −κ = (2g − 2 + c)/2` | holds |
| Downstream consumers (C04 earlier) | RowTowerAndRallisIdentities at its head | §5.3 (its line 541) and §5.9 (line 1355) cite 9.1; §5.5 (line 672) cites 2.4a (d); §5.7 (line 892) cites 6.8, 8.3 | resolved |
| 2.4a (b)–(d), 2.4b attribution (R02) | References line 376; Announcement line 53 | the fourteen-part archive is confirmed; no module or declaration is named; the linked mirror has about 45,000 files | C01 |

The rows for the statements the change leaves untouched (6.8, 6.8a, 7.5a, 7.5b, the 7.5a comparison) stand as in the previous review, of 021930a.

- Source locators checked against the text, 15:
  - hecht-schmid-1975 lines 98–101, 121–122 and 132–133 (Theorem (1.3), p. 130; Theorem (1.4) and Corollary (1.5), p. 131).
  - hc-1953 lines 971–978 (§7, p. 209), 1713–1715 (Lemma 34, p. 228), 1723–1728 (Theorem 5, p. 228) and 1817–1819 (Theorem 8, p. 231).
  - muller-1989 lines 84–85 (Corollary 0.2) and 2108–2117 (Corollary 8.8, printed p. 84).
  - mumford-1977 lines 170–172 (Theorem 1.4, p. 242), 681–682 (Main Theorem 3.1, p. 256), 902–912 (Theorem 3.2, p. 262) and 993–994 (Proposition 3.4 a), p. 264).
  - Announcement line 53.
- Library declaration opened at the pin: `FDRep.average_char_eq_finrank_invariants`, Mathlib RepresentationTheory/Character.lean:214, under `[Fintype G] [Invertible (Nat.card G : k)]` (line 212).
- Cross-roadmap citations resolved:
  - On main: ShimuraVarieties §2.1 (its line 432), RepresentationTheory/LieHighestWeight Layer 6 (line 771), RepresentationTheory/CompactGroups Layer 0 (line 94), and AutomorphicSpectralTheory §0.9 (line 174), which states `‖BC‖₁ ≤ ‖B‖_HS‖C‖_HS`.
  - At its open head: RowTowerAndRallisIdentities §§5.3, 5.5, 5.7 and 5.9.
- Dependency check against the candidate merge order: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`.
- Gate and elaboration: every gate check passes except the two set aside below. `lake env lean` on `Suggested.lean` gives no output and exit 0. The file declares nothing, so there were no signatures to compare, and the change touched only its docstring.
- Headlines: unchanged, and none is statable at the pins. The docstring's headline (2) now assumes `p, q ≥ 1`, as the README does. There is no padding.
- Overlap check: read RowTowerAndRallisIdentities (open) again at §§5.3–5.9. The previous reading still holds, because the change adds no owned object. That reading covered BesselPoincareSeriesAndGramBounds, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ThetaLiftsForDefiniteUnitaryGroups and ThetaKernelsForUnitaryDualPairs (open), and AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and BallQuotientsAndComplexHyperbolicLattices (main). Nothing is shared: the other roadmaps cite this one, and no open pull request changes it or drops an id it cites.

Source independence: changed passages only. I compared 12 passages with 4 sources: hecht-schmid-1975 lines 98–101 and 121–133; hc-1953 lines 971–978, 1713–1715, 1723–1728 and 1817–1819; muller-1989 line 2116; mumford-1977 lines 170–172, 681–682, 902–912 and 993–994. None shares wording beyond standard terms. The largest shares are hc-1953 and mumford-1977, 4 of 16 locators each. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: 7.5a–7.5c and 10.1–10.2 are Gross's (1999) algebraic modular forms and Mumford's (1977) proportionality, and 8.3 is Harish-Chandra's (1966) formal degree. 2.4a (b)–(d) and 2.4b come from Alpöge's 2026 formal proof of the Riemann hypothesis for Dirichlet L-functions, whose theta-chain and Bessel–Poincaré roadmaps use them. This rests on the README's overview, its References and the family index.

## Not verifiable

- The formal proof (2.4a (b)–(d), the variant of (c), 2.4b): the README names no declaration, so the statements and thresholds were not compared with it. I read only the README and file list of the linked mirror and two of its statement files.
- Müller 1998 (9.1, general `f`): settled as uncertified; not read.
- Harish-Chandra 1966 (8.3) and Gross 1999 (7.5a): settled as uncertified; not read.
- Harris 1989 (10.1, 10.2), Zuckerman 1977 (2.4b) and Knapp 1986 (6.8): not read.
- Thorne 2012, Lemma 6.4: read in arXiv v1 (1107.5989v1), as the README now says; the published numbering was not checked.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review lists the three files of the family index (its README, `Suggested.lean` and `metadata.toml`), which belong to this pull request; the dependency check run against main's merge order reports the roadmap as not yet in the order, which the intake settles for a new roadmap (against the candidate order it reports no problem).

## Source issues

- none

## For the human reviewers

- Scope: 2.4a (b)–(d) and 2.4b rest only on a formal Lean proof announced on 20 November 2026 (README line 376; Announcement line 53), which is not refereed. 6.8a cites no source.
- Licence: the README of the formal proof's linked mirror says the submission was published without a licence and is mirrored unmodified for verification only. The roadmap cites it (README line 376). In the files I read, the roadmap does not reuse any of its text.
- Not read: Gross 1999, Harish-Chandra 1966 and Müller 1998 (settled as uncertified), Harris 1989, Zuckerman 1977 and Knapp 1986. The passages citing them were not compared with them. The sources with the largest share, hc-1953 and mumford-1977, were read.
- Organisation: the README describes itself as extending AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory and AutomorphicBundles, and numbers its sections after the first (2.4a, 6.8, 7.5a–7.5c). It is not titled as a Part II of any of them.
