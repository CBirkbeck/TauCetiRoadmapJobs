# FIX-PKG-KatoEulerSystems~5

All six findings verified and applied. Only `packages/KatoEulerSystems/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no headline, no Lean name and no supplier gap was affected.

## F01 (P1) — applied

Verified. For every `n ≥ 1` and `j ≠ 0`, `H⁰(ℚ(ζ_(p^n)), ℤ_p(j)) = 0`, because κ maps `G_(F_n)` onto an infinite open subgroup of `ℤ_p^×`. Rubin2000 line 6657 (App. B, Lemma 3.1) uses `H¹(F_n, T/p^nT)`. `SelmerIwasawaCohomology` §3.7 already makes the same distinction.

§4.6: "specialization … equals cup product with `ζ_(p^n)^(⊗j)`" → the image of `φ_j(x)` in `H¹(F_n,(T/p^nT)(j))` equals the cup product with the invariant generator `t_n^j` (the dual generator for `j<0`). The integral twist is the diagonal limit under corestriction plus coefficient reduction. The localization square is proved on the completed induced modules (§3.2 added to *Needs*). Two Checks added: `p = 3`, `n = j = 1`, and root compatibility. Layer 4 Examples updated. Other occurrences: §5.3 twists the Iwasawa class before specializing and needed no change.

## F02 (P2) — applied

Verified. Kato2004 line 5978 (Thm 16.6(1)) puts η in `F_λ(α) ⊗ D_crys`. For `y² = x³ − x` at 3, `α² = −3` and `α ∉ ℚ_3`.

§6.2 now does the following:
- α is a root in an algebraic closure of E, and L is a finite extension of E containing α.
- The realizations, the zeta class and the regulator are base-changed to L, and η lies in `L ⊗_E D_crys`. The regulator takes values in `ℋ_(∞,L)`, and character values extend further where needed.

§6.3 now says that Kato's L-function has coefficients in L. §6.4 now says that the equality holds in `ℋ_(∞,L)`, with values in `L(μ_(p^n))`. The CM Check now names `L = ℚ_3(√−3)`. A new §6.2 Check covers the CM case, and Layer 6 Examples were updated.

## F03 (P2) — applied

Verified. At `p=3`, `u=4`, `k=2`, the old product evaluated at Kato's point `s=4` gives `log_3 4`, which has valuation 1 and is not 0. ModularSymbolsPadicLFunctions §3.2 (head) uses its own shifted coordinate, with weight lowered by two.

§6.5 Check: `∏_(j=0)^(k−2) log_p(γ^(−j)s)` → `∏_(r=1)^(k−1) log_p(u^(−r)s)`. This uses Kato's unshifted coordinate `s = θ(γ)` on each tame component, with γ generating `1+pℤ_p` (`1+4ℤ_2` at `p=2`). Computed values: `log_3 1 = 0` at `s=4`, and `−log_3 4 ≠ 0` at `s=1`. The check notes that the supplier's product holds in the supplier's coordinate.

## F04 (P1) — applied

Verified. Substitute `u=a+Nm` and `v=b+Nn`. Then `(a/N τ + b/N + mτ + n)^(−k) = N^k (uτ+v)^(−k)`. Mathlib's `EisensteinSeries.eisSummand` (`Mathlib/NumberTheory/ModularForms/EisensteinSeries/Defs.lean:183`) is the integer summand.

§3.2: "`C_k` times the full lattice sum" → an explicit display `C_k N^k ∑′_((u,v)≡(a,b) mod N)(uτ+v)^(−k)`. The display defines the class sum and says that the prime affects only the zero class. The Möbius passage to `eisensteinSeriesMF` is kept. A Check was added for `N=3`, `k=4`, at both the zero and the nonzero class (computed below). `eisSummand` was added to the Mathlib conventions and to *Needs*. No other integer-lattice comparison occurs in the README.

## F05 (P1) — applied

Verified. For `y²=x³+x` at 5, `Ẽ(𝔽_5)` has order 4 and `[5] = id` on it, so the full inverse limit has order 4.

§7.5: `E(ℚ_(n,p)) ⊗ ℤ_p` → the p-adic completion `E(ℚ_(n,p))^∧`, which is the p-Sylow subgroup of the profinite group. There is an exact sequence `0 → E₁ → E^∧ → Ẽ(𝔽_p)[p^∞] → 0`. The norm is multiplication by p, which is nilpotent on that finite p-group. Inverse limits are exact on compact groups. A negative-control Check (the 5-adic case) and a Layer 7 example were added.

## F06 (P3) — applied

Verified. Eight paragraphs of the form "The API is name, name, …" were replaced by prose bullets that state each law with its hypotheses: §§2.1, 2.3, 3.1, 3.2, 3.4, 5.1, 5.4 and 6.2. The review cited six of them; §§3.2 and 3.4 have the same pattern.

Checks are now split per definition in §§2.1, 2.3, 3.1 and 5.1, with at least three per definition. New Checks:
- the §2.1 polynomial at `k=4`, and Rubin versus Mazur–Rubin;
- the reviewer's §2.3 operator test: −1 versus 3;
- the §3.1 dual-exponential range;
- the §3.4 Euler factor at `ℓ|M`, the `ζ(s)ζ(s−1)` factor, and multiplicativity of η;
- the §5.1 eigenspace swap and the `Λ_ℚ`-span;
- the §5.4 transfer polynomial.

§6.2 states projection additivity for arbitrary `η₁, η₂` and says explicitly that the sum need not be normalized. None of this added anything to `Suggested.lean`.

## Adversarial pass (new or changed statements)

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| §4.6 finite twist | p=3, n=j=1, κ(σ)=4 | mod 3: 4≡1, so the invariants have order 3; integrally 4t=t gives t=0 | finite coefficients required; Check added |
| §4.6 root compatibility | ζ_9³=ζ_3 versus ζ_3² | reductions t_2→t_1 versus t_2→t_1^(−1) | the second choice breaks the diagonal system; Check added |
| §4.6 p=2, n=1 | F_1=ℚ | κ(G_ℚ)=ℤ_2^× is infinite, so H⁰(ℚ,ℤ_2(j))=0 for j≠0 | statement holds at p=2 |
| §6.2 coefficient field | y²=x³−x, p=3 | #Ẽ(𝔽_3)=4, a_3=0, α²=−3, v(α)=1/2<1 | α∉ℚ_3; L=ℚ_3(√−3) |
| §6.2 projection additivity | η₂=−η₁ | ℒ_0=0=ℒ_η−ℒ_η; ⟨ω,0⟩=0 | additivity holds without normalization |
| §6.4 CM factor | α=√−3, r=1, k=2 | (1+α/3)² = 1+2α/3−1/3 = 2/3+2α/3 | lies in L, not in ℚ_3 |
| §6.5 witness | p=3, u=4, k=2 | new: s=4 gives 0; s=1 gives −log_3 4, valuation 1; old: s=4 gives log_3 4 | repaired |
| §6.5 order | h=k−1 | the product has k−1 factors, so it has order k−1; interpolation r ≤ k−1 = h | uniqueness fails, as claimed |
| §3.2 N^k | N=3, k=4, class (0,0) | C_4·2ζ(4)=6/(16·45)=1/120; class sum 2ζ(4)/81 gives 1/9720; with ×81 gives 1/120 | repaired |
| §3.2 N^k | class (0,1), m=n=0 | (1/3)^(−4)=81 versus 1^(−4)=1 | factor 3⁴ confirmed |
| §7.5 universal norms | y²=x³+x, p=5 | Δ=−64; points ∞,(0,0),(2,0),(3,0); a_5=2; [5]=id; full limit has order 4; 5-primary limit 0 | completion required; Check added |
| §7.5 anomalous | Ẽ[p^∞] of exponent p^a | p^a·x=0, so the limit is 0 | holds |
| §2.1 polynomial | k=4, r=2, ℓ=3, a=2, ε=1 | P(t)=1−(2/3)t+3t²; at t=X/3: 1−(2/9)X+(1/3)X²; at t=X: 1−(2/3)X+3X² | Check added |
| §2.1 convention | k=2, r=1, ℓ=3, a=2, ε=1 | Rubin: 1−(2/3)x+(1/3)x²; Mazur–Rubin: 1−2x+3x² | Check added |
| §2.3 operator | T′=2, S′=0, σ=id, ℓ=3 | 1−2+0=−1 versus 1+2=3 | Check added |
| §3.4 Euler factor | T′(2)=3, trivial diamond operators | 1−3x+2x²=(1−x)(1−2x); 1−3x+x² has discriminant 5 and does not factor | Check added |
| §3.4 η | f=1; f² | log 1=0 gives η_(1,g)=0; log|f²|=2log|f| | multiplicative; Check added |
| §5.1 conjugation | γ∈V^± | ι=+1 maps into the σ_(−1)=−1 eigenspace; a plus relation swaps them | Check added |
| §5.4 transfer | k=2, ℓ=3, a=2, ε=1 | 1−2X+3X² versus the §2.1 polynomial 1−(2/3)X+(1/3)X² | Check added |

## Checks run

- **Elaboration.** `lake env lean packages/KatoEulerSystems/Suggested.lean` exited 0 with exactly two warnings, "declaration uses `sorry`" at lines 36:8 and 60:8. No build was needed.
- **Signatures.** `Suggested.lean` is unchanged, so the worker's `#check @` signatures (3 declarations, 0 lost binders) still apply. They agree with the README §7.9 statements, which this round did not change.
- **Depcheck.** Output, verbatim:

      depcheck: 56 roadmaps, 646 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** No missing citations and no missing Lean names.

## Notes for the maintainer

- **Ownership.** No new carrier was introduced. Every edit restates objects this package already owns, or cites suppliers already in its contracts:
  - SelmerIwasawaCohomology §§3.1–3.2, 3.7;
  - AutomorphicGaloisRepresentations §5.2;
  - ModularSymbolsPadicLFunctions §3.2;
  - Mathlib `EisensteinSeries.eisSummand`.
- **Unchanged names.** No Lean names changed. The cited supplier sections were re-resolved at main and at the open heads.
- **Sources.** No new source was fetched and no missing-text request was made.
- **Suspicious text.** The review contained no instructions directed at this job.
