<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/123#issuecomment-6391418948 -->
Review (claude) of 310e834

Verdict: rejected

1. **F01** (P1) The package owns nothing: a navigation-only roadmap is vacuous

   - **Location:** `packages/AnalyticNumberTheory/README.md` line 7: "This file supplies navigation; every mathematical target belongs to one of the two parts. … This index adds no mathematical target or Lean declaration." Also Suggested.lean line 9, and the empty namespace at lines 25–27.
   - **Claim:** The package is a roadmap: a specification of material for Tau Ceti, with its own scope, layers, targets and acceptance test.
   - **Witness:** All 484 entries copy Part I's 192 and Part II's 292 section headings exactly. There are 0 `*Needs:*` lines, 0 Checks and 0 declarations. A grep for `AnalyticNumberTheory([^P]|$)` finds no match on main or in the 344 open heads.
   - **Why no in-package fix exists:** Under main's "Writing a roadmap" rules, a roadmap specifies material and keeps non-overlapping boundaries. Giving this package a target means moving one out of Part I or Part II, which re-plans an existing roadmap. Keeping it empty leaves a roadmap folder with no content. Both prior repairs (F01, F02) left exactly this state, correctly from their side. The brief sends a package whose scope is wrong to a human.
   - **Exact repair (human decision):** Withdraw the package. Close the board package and remove the `AnalyticNumberTheory` line from the merge order (line 98, directly after its two parts). AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII stay the roadmaps under their own names.
   - **Tested on the refuting instance:** A grep for the unsuffixed name returns no match on main or in any open head, so withdrawal orphans no citation. ArithmeticStatistics at its board head b571a4c links Part II §§5.4–5.7, 5.21, 5.28 and 5.29 directly (its line 21), and Part I §2.5 (its line 25). The open head of ErdosProgressionPowers (e007747) cites the parts. Only the stale copy of that package in this board checkout still cites `AnalyticNumberTheory:AN.2/AN.3/AN.5` (its README line 55), and that copy is not under review.
   - **Note for the human:** The same index pattern was reviewed for ArithmeticStatistics without being questioned (board report REV-PKG-ArithmeticStatistics, F03). Deciding R01 also decides that pattern.

2. **F02** (P2) The Suggested.lean docstring says continued Hecke functions lack carriers; one exists at the pin

   - **Location:** `packages/AnalyticNumberTheory/Suggested.lean` lines 17–18: "The owners also explain which headlines lack carriers at the pins: canonical continued Hecke and Artin functions and quadratic period geometry in Part I;"
   - **Claim:** No continued Hecke L-function exists at the pins.
   - **Witness:** Pinned `TauCeti.continuedLFunctionOfWeight` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation.lean:275–284`) continues a unitary ideal weight's L-series by partial summation, holomorphic on `Re s > 1 − 1/[K:ℚ]`. The owner says "globally continued" (Part I Suggested.lean line 18).
   - **Exact repair:** Replace "canonical continued Hecke and Artin functions" with "the canonical globally continued Hecke and finite-image Artin L-functions".
   - **Tested:** The qualified claim holds at the pin. The modules under `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter` and `…/RayClass` contain no `LSeries` or `LFunction` (grep: 0 hits). The only continuations of number-field L-series are on half-planes: the one above and the Dedekind ones in `TauCeti/NumberTheory/NumberField/DedekindZeta.lean` (line 158 onward). The other four absence claims in lines 17–20 match the owners' docstrings: Part I Suggested.lean lines 18–28 and Part II Suggested.lean lines 21–35.

3. **F03** (P3) 484 mirrored headings are a third copy of two moving tables of contents

   - **Location:** `packages/AnalyticNumberTheory/README.md` lines 27–1543. For example, line 31 is "### 0.1 Exceptional real zero" and line 33 is its "Read in Part I" link. Also Suggested.lean lines 11–15, which list the owners' headlines.
   - **Claim:** The entries are stable navigation.
   - **Witness:** A scripted comparison found that all 484 titles and numbers equal the owners' headings. The earlier version of the same mirror had drifted: the repair report counts 22 stale destinations and 16 missing links. Nothing consumes the mirror (R01).
   - **Exact repair (only if the index is kept):** Delete the Layer 0–6 subsections (lines 27–1543). Replace them with one paragraph linking Part I `#how-to-read-the-build` and Part II `#how-to-read-the-build`. Cut Suggested.lean lines 11–15 to one sentence naming the two parts.
   - **Tested:** Both `how-to-read-the-build` anchors exist at the heads (the Summary at line 3 already links them). After the cut, no copied heading is left to drift.

4. **F04** (P3) Every link names a pull-request branch instead of a repository path

   - **Location:** All 522 links, for example README line 33: `https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/analytic-number-theory-part-i/TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md#s0-1`.
   - **Claim:** The links address the owners' text durably.
   - **Witness:** 212 links name branch `roadmap/analytic-number-theory-part-i` and 310 name `…-part-ii`. These are moving pull-request heads. `sources.toml` pins different revisions (4ba2e21, ed5b737). Part II itself links Part I relatively (AnalyticNumberTheoryPartII line 11).
   - **Exact repair:** Rewrite the prefix `https://github.com/TauCetiProject/TauCetiRoadmap/blob/roadmap/analytic-number-theory-part-i/TauCetiRoadmap/` to `../`, and the same for part-ii. For example: `../AnalyticNumberTheoryPartI/README.md#s0-1`.
   - **Tested:** `s0-1` exists at AnalyticNumberTheoryPartI line 179. The merge order puts this roadmap after both parts, so relative links resolve on main.

The package is now a navigation index whose links all resolve. Every one of its 484 target entries is a heading copied from AnalyticNumberTheoryPartI or AnalyticNumberTheoryPartII. Both are open new-roadmap pull requests that come earlier in the merge order, and both are fully specified. The index owns no target and no headline theorem. No roadmap on main or in any of the 344 open heads cites it. No edit inside the package can give it a scope without re-planning the two parts. So withdrawing it is a human decision (R01). R02–R04 are the in-package repairs, needed only if a human keeps the index as an entry point.

## Previous findings, one by one

| Id | Previous claim | Repaired passage (quoted) | Status | Reason accepted? |
|---|---|---|---|---|
| F01 (P1) | Every link pointed to a missing owner | README line 7: "This file supplies navigation; every mathematical target belongs to one of the two parts." | **Repaired** as to its witness: 522/522 links resolve at the open heads, Part I 4ba2e21 (pull request 1126) and Part II ed5b737 (pull request 1167). These are the heads `roadmaps list` reports and GitHub returns now. A Summary was added at line 3. | **Accepted as not actionable here.** Submitting the two parts as review units needs work outside this package: they are their own roadmaps, already open on TauCetiRoadmap. |
| F02 (P2) | Suggested.lean states no signatures | Suggested.lean line 9: "This navigation index owns no headline theorem, so it declares none." | **Not repaired, legitimately.** The file still has 0 declarations. | **Accepted.** Every headline is owned and stated by a part. Restating them here would give one statement two owners. The consequence, a package with no acceptance test at all, is raised as R01. That is a new finding, not a re-raise. |
| F03 (P3) | No references and no manifest | `sources.toml` with two entries; README line 1554: "The sources manifest records these two owning documents." | **Repaired (applied differently).** The manifest records exactly the two works the index cites. Each sha256 equals the cache key of the extraction I read. | n/a |

Adversarial pass on what the repairs changed or added: the Summary, Scope, Conventions, supplier contracts, the 484 entries, 14 Examples/Dependencies links, References, the Suggested.lean docstring and the manifest. All are covered in the table below. The repaired pattern ("redirect to an owner") occurs everywhere in the package, so the whole README was checked mechanically.

## Verified sound

**Sources, seeded sample (15/15 index locators verified).** The index's only locators are its links into the two registered sources. For each sampled entry I opened the owner section at its anchor. I checked the number, the exact title, and that the section carries a statement, its hypotheses, a primary-literature locator and a `*Needs:*` line. The index adds no hypothesis of its own, so its "statement as written" is the heading.

| Index entry (README line) | Owner section | Number and title equal | Owner's primary locator (as recorded there) |
|---|---|---|---|
| 0.9 Siegel's theorem (63) | AnalyticNumberTheoryPartI line 313 | yes | Koukoulopoulos, Thm 12.9, pp.125–127 (line 327) |
| 1.5 Mean square of a Dirichlet polynomial (213) | AnalyticNumberTheoryPartI line 921 | yes | ref 62, Thm 2, Cor 2–3, pp.74–75, proof p.82 (line 927) |
| 1.6 Riemann and generalized Riemann hypotheses as statements (219) | AnalyticNumberTheoryPartI line 945 | yes | ref 53, Conj. 7.8 p.45; Conj. 10.4, Rem. 10.5 (line 965) |
| 1.8 Weil's explicit formula (Mestre's formalism) (227) | AnalyticNumberTheoryPartI line 985 | yes | ref 61 §I.1–I.2 pp.211–215; ref 63 §2.3 (line 997) |
| 2.22 Logarithmic functional equation at zero and one (335) | AnalyticNumberTheoryPartI line 1495 | yes | refs 64 and 73, (2-3)–(2-7) pp.1140–1141 (line 1503) |
| 2.26 Hecke negative-sign real quadratic formula (351) | AnalyticNumberTheoryPartI line 1547 | yes | ref 60 §7 (7.3) p.970 (line 1553) |
| 2.32 Bounded-degree Brauer-Siegel (383) | AnalyticNumberTheoryPartI line 1690 | yes | ref 64 pp.382–384; Stark §§2–3 (line 1696) |
| 3.4 Subpolynomial fixed-order divisor function (497) | AnalyticNumberTheoryPartI line 2094 | yes | ref 64 §2.2 pp.380–381 (line 2098) |
| 3.19 Logarithmic-derivative coefficient class (573) | AnalyticNumberTheoryPartI line 2395 | yes | ref 85 §1 p.1 (line 2417) |
| 3.42 Beurling PNT with all logarithmic remainders (699) | AnalyticNumberTheoryPartI line 3292 | yes | ref 90 Thm 1 p.2, §§3–4 (line 3302) |
| 4.4 Lerch differential equation (753) | AnalyticNumberTheoryPartII line 272 | yes | ref 94 Thm 2.3 p.13, Thm 4.1 p.33 (line 278) |
| 5.11 The selected adelic binary-cubic zeta integral (901) | AnalyticNumberTheoryPartII line 932 | yes | ref 107 §3.2 pp.11–14; ref 103 pp.511–516 (line 952) |
| 6.28 The representation on ℓ²(ℕ≥1) and its Hamiltonian (1333) | AnalyticNumberTheoryPartII line 2882 | yes | ref 112 Ch.3 §4.6 p.475 (line 2906) |
| 6.30 Completed KMS states and the bounded strip condition (1345) | AnalyticNumberTheoryPartII line 2956 | yes | ref 112 Ch.3 Defs 3.4–3.6 pp.445–447 (line 2972) |
| 6.46 Gibbs barycentre of a probability measure (1501) | AnalyticNumberTheoryPartII line 3658 | yes | ref 112 Ch.3 Thm 3.32 pp.474–476 (line 3674) |

The author flagged no locator as unverified (0 flags; the index carries no primary locator). No `needs-references.toml` was written, because the index cites no text the manifest lacks.

**Adversarial table.** Rows 1–10 cover the package's own claims. Rows 11–23 recompute the sampled owner statements and their worked examples as a cross-check. They are not a review of the two parts.

| # | Statement | Instances tried | Values computed (index or claim side / reference side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Each entry opens "the owning statement" | all 522 links, at heads 4ba2e21 / ed5b737 | 522 links, 0 unresolved; 192/192 Part I and 292/292 Part II `s…` anchors linked; 0 title or number mismatches | true; it is a full mirror | R03 |
| 2 | Layer headings | 7 layers | 7/7 titles identical (Part I lines 175, 788, 1033, 2032; Part II 150, 652, 1862) | true | none |
| 3 | Examples/Dependencies links per layer | 14 links | the k-th Examples heading lies in Layer k: Part I 778/1023/2022/3417; Part II 642/1852/3800; Dependencies 4 lines later | true | none |
| 4 | "Read Part I's four layers before Part II's three" (line 25) | layer count | Part I has Layers 0–3, so 4; Part II has Layers 4–6, so 3 | true | none |
| 5 | Part II "names the conventions it imports from Part I" (line 11) | Part II Conventions | AnalyticNumberTheoryPartII line 31 adopts Part I's power, character, Gamma and germ conventions | true | none |
| 6 | Supplier anchors (lines 17, 21) | `#exact-supplier-contracts`, `#layer-0`, `#layer-4`, `#from-analyticnumbertheoryparti` | all resolve; the last is Part II line 43 | true | none |
| 7 | Summary content of the two parts (line 3) | owner Summaries | match AnalyticNumberTheoryPartI line 7 and AnalyticNumberTheoryPartII line 7 | true | none |
| 8 | Docstring headline list (Suggested lines 11–14) | 9 named headlines (the two zeta moments counted separately) | found: `finite_order_hadamard`, `siegel_walfisz`, `bounded_degree_brauer_siegel`, `zetaSecondMoment.mean_square`, `zetaFourthMoment.asymptotic`; `lerchContinuation_solvable`, `quadratic_large_sieve`, `quadraticDoubleSeries_continuation`, `critical_scaling_measure_unique` | true at the heads | R03 (drift) |
| 9 | Docstring absence list (lines 17–20) | 5 items vs owners and the pin | 4 match; the Hecke item drops "globally", and the pin has a half-plane `continuedLFunctionOfWeight` | overclaim | R02 |
| 10 | "ArithmeticStatistics consumes … Part II, Layer 5" (line 1547) | ArithmeticStatistics at b571a4c | cites Part II §§5.4–5.7, 5.21, 5.28, 5.29; cites the index 0 times | true, but the index has no consumer | R01 |
| 11 | §0.9 Siegel, `siegel_lower_bound` | N=1, 2, 4 | N=1: only the trivial χ, excluded by χ≠1. N=2: no primitive character. N=4: L(1,χ₋₄)=π/4≈0.785>0 | consistent | none |
| 12 | §1.5 constant 6π | N=0, N=1, spacing at n=1 | N=0: 0≤0. N=1: difference 0. log 2=0.693 ≥ 1/2 ≥ 1/2. Each Hilbert form ≤ (3π/2)·2Σn\|aₙ\|², two forms give 6π | consistent | none |
| 13 | §1.6 strict `Re s>0` | principal χ mod 2; s=−2; even primitive χ at 0 | (1−2^(−s))ζ(s)=0 at s=2πi/log 2, Re 0, excluded; Re(−2)<0 excluded; s=0 excluded | consistent | none |
| 14 | §1.8 zeta instance | A=π^(−1/2), a=1/2, b=0 | A^s Γ(s/2) = π^(−s/2)Γ(s/2), the completed-zeta factor | consistent | none |
| 15 | §2.22 ℓ₀+ℓ₁ = −log Q + g(γ+log 2π) | E=ℚ(i), Q=4, g=1 | ℓ₀=4logΓ(1/4)−2logπ−3log2=0.783189; ℓ₁=0.245610; sum 1.028798 = γ+log(π/2) = 1.028798 | consistent | none |
| 16 | §2.22 exclusion | χ₈ (even) | L(0,χ₈)=0, so the quotient at 0 is undefined | consistent | none |
| 17 | §3.4 d_n(p^a) ≤ n^a | n=3, a=0..3 | C(a+2,2)=1,3,6,10 vs 3^a=1,3,9,27; large-p threshold p ≥ 3^(1/ε)=9 at ε=1/2 | consistent | none |
| 18 | §3.19 Checks | f≡1, μ, n^(it) | Λ_f=Λ, −Λ, n^(it)Λ respectively; \|Λ_f\|≤1·Λ in each | consistent | none |
| 19 | §3.42 non-example | each prime doubled | ζ_P=ζ², N(x)=Σ_{n≤x}d(n)∼x log x, π_P=2π(x)∼2Li(x); neither side holds | consistent | none |
| 20 | §4.4 sign | series Σzⁿ(n+c)^(−s) | (z∂_z+c)∂_cΦ = −sΣ(n+c)zⁿ(n+c)^(−s−1) = −sΦ | consistent | none |
| 21 | §5.11 Disc(g·f)=det(g)²Disc f | twist by det⁻¹ | Disc(λ·f∘g)=λ⁴det⁶Disc f, and λ=det⁻¹ gives det²; Check 3·2^(2s) | consistent | none |
| 22 | §6.28 Check | x₂x′₂ on ε_k | 2^(1/2)·2^(1/2)=2 if 2\|k, else 0; 2^(−1/2)x₂ sends ε_k to ε_2k, an isometry | consistent | none |
| 23 | §6.46 Check | Gibbs, β=2 | Σ_{2\|k}k^(−2)/ζ(2) = (π²/24)/(π²/6) = 0.25 = 2^(−2) | consistent | none |

§2.26 and §6.30 were read but not recomputed: they need the Eisenstein-series and KMS-strip data owned by the parts.

**Duplication audit by object.** The index restates no mathematical object. The Suggested.lean namespace `TauCetiRoadmap.AnalyticNumberTheory` declares nothing, so it clashes with neither `TauCetiRoadmap.AnalyticNumberTheoryPartI` nor `…PartII`. The only duplication is the heading mirror (R03). No Mathlib or Tau Ceti object is restated. Library declarations opened at the pins: `TauCeti.continuedLFunctionOfWeight` (Cancellation.lean:275–284), `UnitaryIdealWeight` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.lean:865`), `TauCeti/NumberTheory/LFunctions/PrimeIdealBoundary.lean` (half-plane Dedekind boundary data). Ownership against open work was checked with `roadmaps grep` over main and all 344 open heads, which include the 41 sibling roadmaps the brief lists. At least 18 open roadmaps cite the parts; none cites the index.

**Supplier-order audit.** The two suppliers are AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII. They are merge-order lines 96–97, before this roadmap's line 98, and both are open new-roadmap pull requests. The index has no `*Needs:*` lines, and the brief declares no gaps. Exact depcheck output, exit 0:

```text
depcheck: 42 roadmaps, 412 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Shape and Lean.** The pins match `lake-manifest.json`: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Running `lake env lean` on Suggested.lean from the content checkout exits 0 with empty output: 0 declarations, so no sorry warning. The file has a single `import Mathlib`, no `set_option`, no sorry'd data and no `lemma`. The `#check @name` binder comparison is empty (0 declarations), so no binder changed. The one-tactic padding probe has nothing to probe, so there is no padding. Headline theorems owned here: none (R01). For comparison I read main's `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/Chebotarev/README.md`; each specifies its own layered targets, and neither is an index. Style scan: no LaTeX delimiters, process words or local paths in the README or the Lean file. `metadata.toml` has `topic = "math.NT"`.

## Not verifiable

- **The owners' primary-literature locators** (right column of the sample table) were not checked against their texts. The index makes no claim at those locators. Fetching them through the sources service would add to this index's manifest works its README does not cite. They belong to the parts' own reviews. Their recorded links point to legal hosts: Numdam, arXiv, GDZ, author pages and publisher open archives.
- **Ownership of the parts' 484 targets against sibling roadmaps** was not checked. That is the parts' review, not this index's.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "310e834", "job": "REV-PKG-AnalyticNumberTheory~2", "model": "opus", "worker": "fable-rev76"} -->
