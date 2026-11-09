# Review of GromovWittenTheory (pull request #990 at c8ad671)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 13 lines of `TauCetiRoadmap/GromovWittenTheory/README.md` changed since `e18b995`, the head the previous review read. The three findings of that review on the folder's text (R01, R02, R03) are repaired, and the repairs introduce no new problem: every value in the two new Checks and the rewritten supplier contract recomputes. Two findings remain, both P3 and both carried from the previous review because nothing about them changed: the branch still builds against a Tau Ceti pin that lacks eight of the files the contracts name, and pull request #1998 still writes the same folder with no stated order. The gate, the dependency check and the elaboration pass on an independent rerun.

## R01 (P3) — The README and the docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R04 (R01 of the review before it, R02 of the one before that), still not repaired.

**Location:** `README.md:66` (“### From Tau Ceti (commit 2fd255d)”) and the contract at lines 68–75; `Suggested.lean:31–39` (“the pinned Tau Ceti has …”); `lake-manifest.json:8`.

**Claim:** The branch manifest pins Tau Ceti `a91d3aa` (Mathlib `6b7abb3c`); main pins Tau Ceti `2fd255d9`. At `a91d3aa` the files `Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`, `AlgebraicGeometry/Curves/NodalGluing/Basic.lean`, `Topology/Sheaves/Cech/Colimit.lean`, `Topology/Sheaves/Cech/Pullback.lean`, `Geometry/Manifold/SmoothSingular/Basic.lean`, `Geometry/Manifold/SmoothSingular/Integral.lean`, `RingTheory/NovikovSeries/Basic.lean` and `RingTheory/NovikovModule/Basic.lean` are absent, so `TauCeti.NovikovSeries`, `TauCeti.NovikovModule`, `TauCeti.Topology.cechCohomology`, `SmoothAlmostComplexStructure` and `GluedCurve` do not exist at the pin the branch builds against. The contract and the docstring are true only at `2fd255d`.

**Witness:** `git merge-base --is-ancestor origin/main HEAD` fails at `c8ad671`. `lake-manifest.json:8` reads `a91d3aaf…`; `origin/main:lake-manifest.json` reads `2fd255d9…`. The previous review's table lists all 62 contract declarations resolving at `2fd255d`.

**Repair:** Merge or rebase the branch onto origin/main (the worker's rebase step). No line of the folder changes.

## R02 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

This is the previous R05 (R02 of the review before it, R05 of the one before that), still not repaired.

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (all three files), and this pull request's description, which does not mention #1998.

**Claim:** #1998 (algebraic Gromov–Witten theory and quantum cohomology, head `c41b144`) adds a different roadmap under the same folder name; the heads conflict in `README.md`, `Suggested.lean` and `metadata.toml`, and neither description says which one moves. The objects are distinct (Behrend–Fantechi classes on algebraic stacks there; analytic stable maps, implicit atlases and Čech cohomology here), so this is a naming and order conflict, not a double owner.

**Witness:** `scratch/overlaps.md` (index of 2026-11-09T08:30): “#990 and #1998 conflict in `TauCetiRoadmap/GromovWittenTheory/README.md`, `…/Suggested.lean`, `…/metadata.toml`”. `roadmaps list` shows both as new roadmaps named GromovWittenTheory at heads `c8ad671` and `c41b144`. The description quoted in `scratch/pull-request.md` is unchanged.

**Repair:** State in this pull request's description that this roadmap keeps the folder `GromovWittenTheory`, the name HamiltonianFloerOperations already cites on main (`README.md:17`, “GromovWittenTheory G0/G5–G7”), and that #1998 takes another folder name before either merges. No folder line changes.

## Previous findings

- R01 — repaired: §6.3's second Check (`README.md:564`) now says every right-hand term has insertion degree `2m + 2` and vanishes by §5.4, computes the left side as `−(∫_X c_(m−1)(TX) ⌣ γ₁ ⌣ γ₂) λ₁`, proves `ξ^* λ₁ = 0` by the residue trivialization of `ξ^* 𝔼₁`, and excludes the `ψ̄₁` model by `∫_(M̄_(0,4)) ψ̄₁ = 1`. Every step recomputes (table below).
- R02 — repaired: the `(0, 3, ℓ)` divisor Check left §5.3 and is now §8.4's fourth Check (`README.md:751`), stated as the all-`k_i = 0` instance of the divisor equation along the map-level forgetful map of §5.2, with the remark that `I_(0,3,ℓ)` is basic. §5.3 received a new non-basic Check, the conic count `2 · 1 = 2` (`README.md:496`), whose values and degrees recompute.
- R03 — repaired: the AnalyticStableMaps contract (`README.md:80`) now cites §0.1 for the signed virtual dimension, §0.2 for the closed Cauchy–Riemann index and §4.1 for the nodal augmented index, and §4.3's statement, `*Needs:*` line and the Layer 4 Dependencies cite §0.1 and §4.1. Each cited section says what is cited at the AnalyticStableMaps head `41557ba` (lines 120, 138, 687).
- R04 — not repaired: `lake-manifest.json:8` still reads `a91d3aa`, and `origin/main` is not an ancestor of `c8ad671`. It is R01 above.
- R05 — not repaired: the description in `scratch/pull-request.md` still does not mention #1998, which `roadmaps list` still shows at `c41b144` under the same folder name. It is R02 above.
- No repair report on the board marks any finding “not actionable in this package”; the repair commit's message names only the three text repairs.

## Verified sound

**Gate, dependency check and build.**
- Independent rerun of the full gate at `c8ad671`: every check `0`, `OK`, exit 0. The worker's gate at this head passes with `build=0`.
- Dependency check with `--movable` against the board's merge order and main content: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 307; its open suppliers precede it: ImplicitAtlases (214), AnalyticStableMaps (215), TopologicalSheafCohomology (306).
- `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` in the branch worktree: exit 0, 25 s, no output. The file (66 lines) has the single `import Mathlib`, the module docstring, the namespace and no declaration; no `set_option`, no sorry'd data, no `lemma`. With no declaration there is nothing to probe for padding and no `#check @name` comparison to run; the headline theorems are the four the previous review listed, none statable at either pin, each named in the docstring with its missing carrier (unchanged since `e18b995`).
- `git diff --stat origin/main...HEAD` outside the folder: empty.

**The changed passages, step by step.**

1. *Contract with AnalyticStableMaps (`README.md:80`), §4.3 (`:440`, `:448`) and Layer 4 Dependencies (`:457`).* At the AnalyticStableMaps head `41557ba`: §0.1 (line 120) defines `v = 2((m−3)(1−g) + ⟨c₁(TX,J),β⟩ + n)`, states the energy–area identity for the metric `g_J(v,w) = (ω(v,Jw) + ω(w,Jv))/2` and the uniform energy–area comparison over a compact family of tame structures on compact `X`; §0.2 (line 138) proves the closed index `m·χ(Σ) + 2⟨c₁(TX,J), u_*[Σ]⟩ = m(2 − 2g) + 2⟨c₁, u_*[Σ]⟩` for connected `Σ` of genus `g`; §4.1 (line 687) assembles the nodal augmented index from “the component index of §0.2” and says “the expected dimension is v of §0.1”. The contract's three sentences match these three sections word for word in content. With the Conventions' `d_(g,n,A) = 2((1 − g)(m − 3) + c₁(A) + n)` (`README.md:48`), `v = d_(g,n,A)` for `β = A`.
2. *§5.3, the conic Check (`README.md:496`).* `(0, 6, 2ℓ)` is non-basic (§5.1's list is `(0,3,A)`, `(1,1,A)`, `(g,0,A)` with `g ≥ 2`, `README.md:463`, matching KM94 line 146), so the Check is inside §5.3's hypothesis, and KM94 2.2.4 (lines 186–191) states exactly the numerical form used. Values: `⟨2ℓ, H⟩ = 2`; the number of conics through five general points is `1`; product `2`. Degrees: `d_(0,6,2ℓ) = 2(−1 + 6 + 6) = 22 = 5·4 + 2`; `d_(0,5,2ℓ) = 2(−1 + 6 + 5) = 20 = 5·4`; both classes have `r = t`, codimension zero. The wrong model (factor `1` for every nonzero `A`) gives `1 · 1 = 1` on the line Check (`⟨ℓ, H⟩ = 1`) and `1 ≠ 2` here, so the Check discriminates.
3. *§6.3, the second Check (`README.md:564`).* Right side: `g_(ab) = ∫_X Δ_a ⌣ Δ_b` is nonzero only for `deg Δ_a + deg Δ_b = 2m`, so its inverse `(g^(ab))` has the same support (§6.1, `README.md:526`); each term `I_(0,4,0)(γ₁, γ₂, Δ_a, Δ_b)` has insertion degree `2 + 2m > 2m` and is `0` by §5.4's genus-zero formula (`README.md:503`). Left side: §5.4's Hodge–Euler formula `p_(1*)(c_m(𝔼₁^∨ ⊠ TX) ⌣ p_2^*(γ₁γ₂))` with §3.4's expansion `c_m = Σ_k (−λ₁)^k c_(m−k)(TX)` (`README.md:383`): the `k`-th term has `X`-degree `2(m − k) + 2`, which is `2m` only for `k = 1`, so fibre integration over `X` keeps `−λ₁ ∫_X c_(m−1)(TX) γ₁ γ₂` alone, exactly as written; for `ℂP¹`, `γ = (pt, 1)`: `c₀ = 1`, `∫ pt = 1`, left side `−ξ^*λ₁`. `ξ^*λ₁ = 0`: over a point of `M̄_(0,4)` the self-glued curve has arithmetic genus `0 + 1 = 1`, so §3.2's residue-matched differentials form a line (`README.md:360`, dimension `Σ g_v + b₁`); a section with zero residue at the first glued branch has zero residue at the second (opposite residues), hence is a residue-matched differential on the genus-zero stable curve, whose space has dimension `0`; so the residue is a nowhere-vanishing section of `(ξ^*𝔼₁)^∨`, `ξ^*𝔼₁` is trivial and `c₁ = 0`. The wrong model: §8.1's clutching law (`README.md:681`) gives `ξ^*ψ̄₁ = ψ̄₁` on `M̄_(0,4)`, and `∫_(M̄_(0,4)) ψ̄₁ = 1` (`README.md:685`), so `−ξ^*ψ̄₁` has integral `−1 ≠ 0` and is excluded. KM94 2.2.7, lines 242–246, is the identity being tested, with the branches ordered as in (2.12).
4. *§8.4, the fourth Check (`README.md:751`).* §8.4 states the divisor equation for every map-stable signature whose forgetful map exists; the map-level forgetful map `M̄_(0,3)(ℂP², ℓ) → M̄_(0,2)(ℂP², ℓ)` is constructed in §5.2 for `A ≠ 0` (`README.md:479`). With all `k_i = 0` the correction sum is empty, the divisor insertion is the first one as in the equation's display (`README.md:742`) and in the `ℂP¹` Check before it, and §8.3's third bullet (`README.md:719`) identifies the brackets with §2.2's numerical operations: `⟨I_(0,3,ℓ)(pt, pt, H)⟩ = 1` (§2.2's second Check) and the pointed-unstable `⟨pt, pt⟩_(0,2,ℓ) = 1` (§2.2, `README.md:296`). Degrees: `2 + 4 + 4 = 10 = 2(−1 + 3 + 3)`, `4 + 4 = 8 = 2(−1 + 3 + 2)`. The remark that `I_(0,3,ℓ)` is basic agrees with §5.1 and KM94 line 146.

**Sources read at the locators the changed passages cite.** `KM94` (arXiv v2): 2.2.2 and (2.2), lines 137–142, p. 4; the basic list (2.3), line 146, p. 4; 2.2.4 (non-basic, numerical and class-valued forms), lines 186–196, p. 5; 2.2.7 and (2.12), lines 242–246, p. 6. The other sampled targets (§0.2, §1.1, §2.1–§2.3, §3.3, §5.2, §5.4, §6.5, §7.1–§7.2, §8.3, §8.5) are untouched by the diff; the previous review verified their locators at `e18b995` and the text at those lines has not changed.

**Cross-roadmap citations resolved this round.** AnalyticStableMaps at `41557ba`: §0.1 (120), §0.2 (138), §4.1 (687), §11.1 (998), §12.2 (1045). The dependency check resolves every other `*Needs:*` edge; `scratch/citations.md` lists no citation or Lean name found nowhere.

**Ownership and overlaps.** `scratch/overlaps.md` lists no id this roadmap cites that an open pull request drops, no id only an open revision defines, and no dropped id of this pull request that others cite. Its one entry is the #1998 folder conflict (R02). The closest open roadmaps (AnalyticStableMaps #987, ImplicitAtlases #974, FukayaTheory #1045, DGFloer #1798, Orbifolds #1187) were compared in the previous full review; the diff adds no new object.

**Adversarial pass.** Coefficients ℚ; `d = d_(g,n,A)`, `t = 6g − 6 + 2n`, `s` the insertion degree. Rows for untouched statements carry the previous report's values (marked r13); rows for changed statements are computed here.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Contract: ASM §0.1 `v` equals `d_(g,n,A)` (changed) | `ℂP²`, `(0,4,ℓ)`; `(0,2,0)`; `(2,0,β)` with `c₁ = −2`, `m = 2` | `2(−1 + 3 + 4) = 12 = d`; `2(m − 3 + 2) = 2m − 2` (ASM §0.1 Check); `2(1 − 2) = −2`, signed as ASM says | Correct |
| Contract: ASM §0.2 closed index (changed) | constant map, genus `g`; `id_(ℂP¹)`; a line in `ℂP²` | `2m − 2mg`; `2 + 4 = 6`; `4 + 6 = 10` (ASM §0.2 and §4.1 Checks) | Correct |
| Contract: ASM §4.1 index equals `v` (changed) | smooth genus-`g` domain with `n` marks | `m(2−2g) + 2c₁ + 2(3g − 3 + n) = 2((m−3)(1−g) + c₁ + n)`; nodal conic of ASM §4.1: `10 + 10 − 12 + 4 − 4 + 2 = 10 = 2(−1 + 6)` | Correct |
| §5.3 conic Check (changed) | `ℂP²`, `(0,6,2ℓ)` with `pt⁵, H`; `(0,5,2ℓ)` with `pt⁵`; wrong model | `⟨2ℓ,H⟩ = 2`, `N₂ = 1`, product `2`; `s = 22 = d`, `s = 20 = d`; wrong model `1` here, `1` on the line Check | Correct, discriminating |
| §6.3 second Check (changed) | `X` general, `deg γ₁ + deg γ₂ = 2`; `ℂP¹`, `(pt, 1)`; `ψ̄₁` model | right: every term `s = 2m + 2 > 2m`, so `0`; left: only `k = 1` survives fibre integration, `−(∫ c_(m−1) γ₁γ₂) λ₁`; `ξ^*𝔼₁` trivialized by the residue (genus-0 residue-matched space has dimension `0`), so `0 = 0`; `ℂP¹`: `−ξ^*λ₁ = 0`; wrong model `∫ −ψ̄₁ = −1 ≠ 0` | Correct, discriminating |
| §8.4 fourth Check (changed) | `ℂP²`, `(0,3,ℓ) → (0,2,ℓ)`, `δ = H` first, `k = (0,0)` | left `1` (§2.2); right `⟨ℓ,H⟩ · ⟨pt,pt⟩_(0,2,ℓ) = 1 · 1`, empty correction sum; `s = 10 = d`, `8 = d` | Correct |
| Headline 1 grading; §1.1; §4.1; §0.2 (sign, grading, internal grading, Cauchy product, closedness); §0.3; §2.1; §2.2; §3.2; §3.3 | as in r13 | as in r13 (e.g. `r = 12 − 4 − 6 = 2 = t`; `∫^wt [pt]^∨ = 1/2`; Gram determinant `−1`; dimensions `1, 0, 2, 1`) | Correct (r13) |
| Headline 2 (§3.4); §4.2; §5.1; §5.2; §5.4; §6.1; §6.2; §6.3 first Check; §6.4–§6.6 | as in r13 | as in r13 (e.g. `χ(ℂP¹) = 2`, `−1/24`; `Σ g^(ab) g_(ab) = 0` on `T²`; `2/1 = 2`; excess `3 = 2 + 1`) | Correct (r13) |
| Headline 3 (§7.1–§7.2); §8.1; §8.2; §8.3; Headline 4 (§8.4 first three Checks); §8.5; §8.6; §0.4 | as in r13 | as in r13 (e.g. `x ⋆ x = q`; `∫ψ̄₁ = 1`, `∫ψ̄₁ψ̄₂ = 2`; `ψ₁ = −2[pt×ℂP¹] + [Δ]`; dilaton `−1`; TRR `1 + 1 + 0 = 2`) | Correct (r13) |

## Not verifiable

- The #1998 head was read only through `roadmaps list` and `scratch/overlaps.md`.
- The untouched constructions the previous review listed (§3.2's scalar operator, §3.3's concordance, §6.5's capped trace, §8.5's supported divisor class) have no source text; they are unchanged and were not re-read.

## Source issues

- none new this round. The previous review's register entries (KM94 (2.9) and 2.4.5; Kontsevich–Manin 1998 §1.1 and Lemma 1.5.3; Kock (5.1.7.2)) stand.
