# Review of OddOrderTheorem (pull request #1777 at be7ffb5)

**Verdict:** needs changes

Incremental re-review of the 14 changed lines since d80ab98, all in `TauCetiRoadmap/OddOrderTheorem/README.md` (the FiniteGroupInvariants supplier row and §1.2); `Suggested.lean` is byte-identical to d80ab98. The previous R01 is repaired: Proposition 1.2 now runs over chief series from `⊥` to `⊤`, and the new endpoint Check is correct. The gate passes with the build. The dependency check reports no problem. One P3 is new: the new source parenthetical describes the second math-comp lemma wrongly.

## R01 (P3) — the new parenthetical misdescribes `chief_stab_sub_Fitting`: its intersection is not over all chief factors

Location: `TauCetiRoadmap/OddOrderTheorem/README.md` lines 396–399: "math-comp `Fitting_stab_chief` and `chief_stab_sub_Fitting`, MC-BGsection1 lines 169–215, prove the nontrivial inclusions of its two equalities in relative form, for `G' ⊴ G`, with the intersection taken over all chief factors of `G` rather than over one series".

Claim: both math-comp lemmas intersect the centralizers of all chief factors of `G`.

Witness: this holds for the first lemma only. MC-BGsection1 line 170 defines `H` over every chief factor (`Gchief UV`). Lines 171–172 define `H'` as `G'` met with the intersection over chief factors `U ⧸ V` of `G` with `U ≤ F(G')` only. Line 190 proves `H' ≤ F(G')` for that `H'`. The restriction matters: `cent_sub_Fitting` (Proposition 1.3, lines 220–226, stated in the same §1.2 paragraph) uses `U ≤ F(G)` (line 225) to place `C_G(F(G))` inside `H'`. With "all chief factors", `C_G(F(G))` would have to centralize the factors above `F(G)` as a hypothesis, and that is what 1.3 sets out to prove.

Repair: replace the parenthetical with "math-comp `Fitting_stab_chief` (MC-BGsection1 lines 169–186) proves `F(G') ≤ ⋂ C_G(U ⧸ V)` over all chief factors `U ⧸ V` of `G`, and `chief_stab_sub_Fitting` (lines 171–172, 188–215) proves `G' ⊓ ⋂ C_G(U ⧸ V) ≤ F(G')` over the chief factors of `G` with `U ≤ F(G')`, both for `G' ⊴ G` and over chief factors rather than over one series; the second, with `G' = G`, gives Proposition 1.3 (lines 220–226)". Tested on `G' = G = S₄`. Its chief factors are `V₄ ⧸ 1`, `A₄ ⧸ V₄` and `S₄ ⧸ A₄`, with centralizers `V₄`, `A₄` and `S₄`. The first intersection is `V₄ = F(S₄)`. The second runs over `V₄ ⧸ 1` only and gives `V₄`. `C_{S₄}(F(S₄)) = C_{S₄}(V₄) = V₄` centralizes `V₄ ⧸ 1`, so the restricted lemma gives `C_{S₄}(V₄) ≤ V₄` (Proposition 1.3) directly.

## Previous findings

- R01 — repaired: lines 393–396 now say "chief series `s` of `G` from `⊥` to `⊤` (FiniteGroupInvariants §0.2, `ChiefSeries`, with the endpoint hypothesis `s.head = ⊥ ∧ s.last = ⊤` of its `chiefFactors_eq`; the carrier itself admits series with other endpoints)". The new Check (lines 411–415) uses the former witness `V₄ < A₄ < S₄` as a negative control. The supplier row (line 189) is updated to match. The repair also added the source parenthetical, which brings in the new R01 above.

## Verified sound

**Gate, dependency check, build and Lean.**

- My run of `gate … --base origin/main --build` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0. This agrees with the worker's `gate.md`.
- `gate --depcheck … --movable` printed `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`, exit 0. It has no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, OddOrderTheorem is line 397 and InverseGaloisAndArithmeticFundamentalGroups line 54. FiniteGroupExtensionSplitting is on main. FiniteGroupInvariants is consumed as an open pull request that adds a new folder.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff d80ab985 HEAD -- …/Suggested.lean` is empty.
- `lake env lean` on `Suggested.lean` exits 0. Its only warnings are `declaration uses 'sorry'` at lines 52, 55, 59, 118, 128 and 144. The file is unchanged, so three results carry over from the previous report: the `#check @` comparison of the ten declarations (`signatures.md` lists the same ten, none with a dropped binder), the one-tactic padding probe (all six fail) and the headline audit. The three forms of the odd order theorem, `exists_dadeExtension`, `isDadeExtension_eq_indClassFunction` and `appendixC_prime_le` are stated. The docstring names the headlines that cannot be stated.

**The changed passages, checked against their suppliers and sources.**

- FiniteGroupInvariants, at the open head the brief gives (60b9e45): `Suggested.lean` line 39 has `NormalSubgroup G := {N : Subgroup G // N.Normal}`. Line 52 has its `IsModularLattice` instance. Line 66 has `abbrev ChiefSeries := CompositionSeries (NormalSubgroup G)`, with no endpoint condition. Lines 87–88 have `chiefFactors_eq … (hs : s.head = ⊥ ∧ s.last = ⊤)`, the hypothesis the README now quotes word for word. README `### 0.2` is at line 275. The supplier row at line 189 and §1.2 match these.
- Mathlib pin, `Order/JordanHolder.lean`: lines 81–82 give `IsMaximal := (· ⋖ ·)` for a weakly lower modular lattice, and line 153 gives `CompositionSeries X := RelSeries {(x, y) | IsMaximal x y}`. So a member of `ChiefSeries S₄` is any chain of covers among normal subgroups, and `V₄ < A₄ < S₄` is one. This confirms the claim in the new Check.
- MC-BGsection1 lines 131–138 (Lemma 1.1 first part; Lemma 1.2 second part, which assumes only that `M` is solvable) and 169–215 (Proposition 1.2, both lemmas, with Hypothesis `solG` at 162 and `G' ⊴ G` at 163). The line range is correct, and the hypotheses are solvable `G` and `G' ⊴ G`. The description of `H'` is R01.
- The statement as written is true. Every factor of a chief series from `⊥` to `⊤` is a chief factor, so `F(G) ≤ ⋂_{all} ≤ C_s`, where `C_s` is the intersection over one series. In the other direction, `C_s ⊴ G` and `[C_s ⊓ s_{i+1}, C_s] ≤ C_s ⊓ s_i`, so `C_s` is nilpotent and `C_s ≤ F(G)`. The *Needs:* line (FiniteGroupInvariants §0.2, Mathlib `Group.IsNilpotent`, `Subgroup.centralizer`) covers this route.
- "Used in §1.2 only": the other mentions of chief factors (§1.7 lines 629–643, §1.10 line 736) concern chief factors, not the `ChiefSeries` carrier. Neither *Needs:* line cites FiniteGroupInvariants §0.2.
- Remark (text the previous review passed, no change asked): math-comp's relative form for `G' ⊴ G` is not stated here. It is used for B&G 3.7 (MC-BGsection3 lines 1306, 1313), 3.8 (1452, 1490) and 4.20(a) (MC-BGsection4 line 1289). None of these is a target of this roadmap: §1.10 says that the nilpotence of Frobenius kernels is not an input, and §1.7 states only 4.18. So no consumer here needs the relative form.

**Citations and overlaps.**

- `citations.md` has three leads, and all resolve. `IsMinimalOddSimple.proper_solvable` is the structure field at `Suggested.lean` line 48. `TauCetiRoadmap.RepresentationTheory.CharacterTheory` and `…InductionRestriction` (README lines 160 and 168) are supplier headings for folders on main (`TauCetiRoadmap/RepresentationTheory/CharacterTheory`, `…/InductionRestriction`).
- `overlaps.md`: no open pull request changes this roadmap, drops a cited id or defines an id cited here. The change introduces no new object. The chief series stays owned by FiniteGroupInvariants and is cited. Ownership as recorded in the previous report is unchanged.

**Sources: the seeded sample, where it falls in the change.** Only §1.2 (and the §0.2 supplier row) changed. Both are checked above against MC-BGsection1 lines 131–138, 162–163, 169–215 and 219–227, and against FiniteGroupInvariants §0.2. The other sampled targets (0.2, 1.7, 1.9, 2.1–2.4, 2.7, 4.3, 4.4, 5.1, 5.3, 5.5, 6.1) are untouched, and their locators were verified in the previous report.

**Adversarial table.** Rows marked "(r8)" are carried from the previous report for statements the diff leaves untouched, with the values computed there. The first four rows are new.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 Proposition 1.2, series from `⊥` to `⊤` | `S₄`: `1 < V₄ < A₄ < S₄`; `Q₈`: `1 < Z < ⟨i⟩ < Q₈`; `S₃`: `1 < A₃ < S₃`; `C₅`; `G = 1` | `V₄ ∩ A₄ ∩ S₄ = V₄ = F(S₄)`; every factor central, meet `Q₈ = F(Q₈)`; `A₃ ∩ S₃ = A₃ = F(S₃)`; `C₅ = F`; only the length-0 series, empty meet `⊤ = 1 = F(1)` | correct | none |
| §1.2 endpoint Check (new) | `V₄ < A₄ < S₄`; also `1 < V₄ < A₄` (last `≠ ⊤`) | the normal subgroups of `S₄` form the chain `1 < V₄ < A₄ < S₄`, so `V₄ ⋖ A₄ ⋖ S₄`; `C(A₄/V₄) = A₄` (kernel of `S₃` on `A₃`), `C(S₄/A₄) = S₄` (`S₄' = A₄`), meet of order `12 ≠ 4`; the second gives `V₄ ∩ A₄ = V₄`, right by accident, so the head is the endpoint the control must break, and it does | correct, discriminating | none |
| §0.2 supplier row (FiniteGroupInvariants) | head `Suggested.lean` 66, 87–88 | carrier `CompositionSeries (NormalSubgroup G)`, no endpoints; `hs : s.head = ⊥ ∧ s.last = ⊤` | matches | none |
| §1.2 math-comp parenthetical | `G' = G = S₄`; MC-BGsection1 170, 171–172, 225 | `H` over 3 chief factors `= V₄`; `H'` over `V₄/1` only `= V₄`; `C_{S₄}(V₄) = V₄ ≤ H'` uses `U ≤ F` | first lemma right, second misdescribed | R01 |
| §0.1 odd order to sections (r8) | `C₃ ≤ C₆`; `S₃/A₃`; `C₇ ⋊ C₃` | `6` even, `3` odd; `2`; `1, 3, 7, 21` | correct | none |
| `IsMinimalOddSimple`, endpoints (r8) | trivial, `C₃`, `C₇ ⋊ C₃`, `A₅`, infinite | not nontrivial; commutative; `C₇ ⊴`; `60` even; `Nat.card = 0` | matches MC-BGsection7 61–66 | none |
| §0.3 (r8) | `S₃`; `A₅`; `C₇ ⋊ C₃` | `C((12)) = ⟨(12)⟩`; `A₄, D₁₀, S₃` self-normalizing; `N(C₇) = G` | correct | none |
| §1.1 complements, `O_p` (r8) | `A₃ ⊴ S₃`, `C₇ ⊴ C₇ ⋊ C₃`, `V₄ ⊴ S₄`, `C₂ ⊴ C₂²`; `D₈ ≤ S₄` | Sylow 2; Sylow 3; `gcd(4, 6) = 2`; non-conjugate; `⋂ D₈ = V₄` | correct | none |
| §1.2 Lemmas 1.1, 1.2, `F ≠ 1` (r8) | `V₄ ⊴ A₄`, `A₅`, `A₅ × C₃`, `S₄`, `C₆` | `S = C₂`; `Z(F(A₅)) = 1`; `C₃ ≤ Z(F) = C₃`; `Φ = 1 < F` | correct | none |
| §1.3 coprime action (r8) | `⟨(12)⟩` on `V₄`; `x ↦ x⁴` on `C₉`; `V₄` on `C₃²`; `C₂` on `𝔽₂²` | `[V₄, A] = C_{V₄}(A)` of order 2; `[C₉, A] = Φ`; `C(ab) = 1`; no invariant complement | correct | none |
| §1.4 4.3, 1.13, 4.5, 4.7, 2.5, 2.6 (r8) | `D₈`, `Q₈`, `C₉ ⋊ C₃`, `C₃³`, `Heis₂₇`, `C₇ ⋊ C₃` | `exp Ω₁(D₈) = 4`; `Ω₁(Q₈) = {±1}`; `SCN₃ ∋ C₃³`; `h = 4`; degrees `1, 1, 1, 3, 3` | correct | none |
| §1.5 constrained, stable, focal (r8) | `S₃`, `A₅`, `S₄`, `C₇ ⋊ C₃` | `O_{2',2}(S₃) = S₃`; `O_{2',2}(A₅) = 1`; `S₄` not `2`-stable; `G' = C₇` Hall | correct | none |
| §1.6 `p`-length, 1.21(e), 6.5, 6.6 (r8) | `S₃`, `S₄`, `S₃ × S₃`, `H₁ = H₂ = V₄` | lengths `1, 1, 2, 1`; quotient `C₂²`; `S₄` length 2; `KS = A₄`, `K · N(S) = S₄` | correct | none |
| §1.7 4.18 (r8) | `C₇ ⋊ C₃`; `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)`; `S₄` | length 1; `m₃ ≥ 6`, length 2; `2`-length 2 (even order) | correct | none |
| §1.8 A.4(c), Baer–Suzuki (r8) | `S₄`, `x = (12)`; `S₃` | `[V₄, x] = ⟨(12)(34)⟩`; `⟨(12), (12)^{(123)}⟩ = S₃ ∉ O₂`; `⟨x, x^g⟩ = A₃ = O₃` | correct | none |
| §1.9 `ZL`, 6.7 (r8) | `C₇ ⋊ C₃`; `𝔽₃³ ⋊ (C₁₃ ⋊ C₃)`; `S₄` | `Z(L(C₇)) = C₇ ⊴`; `Z(S) = 𝔽₃` not normal; `L ∈ {1, V₄}` | correct | none |
| §1.10 3.6 (r8) | `C₇ ⋊ C₃`; `C₅ × (C₇ ⋊ C₃)`; `C₉ ⋊ C₃` | `C_J(A₀) = 1`; `[J, A] = C₇ ≠ J`; `gcd = 3` | correct | none |
| §2.1 (1.1), (1.4), (1.8) (r8) | `C₃`, `S₃`; `C₇ ⋊ C₃`; `C = D = A₃` | `ε` real; `‖Ind ω − Ind ω²‖² = 2`; bound `2` attained | correct | none |
| §2.2 `DadeDatum` (r8) | `C₃ × S₃`; `S₄`; `A₃ ≤ S₃`; `A = ∅` | 9-element support; `gcd(2, 2) = 2`; fusion fails; vacuous | matches MC-PF2 94–98 | none |
| §2.3 `IsDadeExtension` (r8) | `C₃ × S₃`, `f = 1_A`; rescaled; `L = G` | `3/6 = 9/18`; `27/18`; `9/2`, `1/18`; `T = id` | second clause pins `f a` | none |
| §2.4 comparison (r8) | `⟨(12)⟩ ≤ S₃`; `A₃ ≤ S₃`; `A = ∅` | `1/2 = 3/6`; `0` vs `2`; `N_G(∅) = G` | `A ≠ ∅` present | none |
| §2.5 sign, restriction (r8) | `C₃`, `S = {ω, ω̄}`; `S₁ = {ω}` | two extensions only; `‖ω − ω̄‖² = 2`; `ℤ[S₁, L^#] = 0` | correct | none |
| §2.6 (3.1)–(3.5) (r8) | `C₃ × C₅`; `−σ`; `W₁ = 1`; `C₃ × C₃` | `|V| = 8`; `σ1 = 1`; `V = ∅`; not cyclic | correct | none |
| §2.7 (4.2), (4.3)(d), (4.6) (r8) | `C₇ ⋊ C₃`; `C₃ × C₅`; `A ∪ V^L` | no `W₂`; degree `1 ≡ δ_j`; `V^L ⊄ K` | correct | none |
| §2.8 (5.2), (5.3), (5.9)(a), gluing, dual (r8) | `C₃`, `τ(ω − ω̄) = 1 − ω`; `S₃ ≤ S₃ × C₃` | `‖1 − ω‖² = 2`; `R(ω) = {1, −ω}`; no conjugate pair; norms `5 = 5`; dual coherent | correct | none |
| §2.8 (6.3), (6.8) (r8) | `|L : K| = 3, 1`; `C₃ × C₅` | thresholds `37`, `5`; `43 > 37`; `H' = 1` | correct | none |
| §3.1 prime sets, `C₃ ≀ C₃` (r8) | `C₃³`, `C₃² × C₅`, `S₄`, `C₇ ⋊ C₃`; shift `t` | `α = β = {3}`; `α = ∅`; `2 ∉ σ`; `|C(t)| = 9`, `x³ = (1, 1, 1)` | correct | none |
| §3.2, §3.3 (r8) | `V₄ ≤ S₄`; `S₃`, `A₄`; `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` | four maximal subgroups; `M_σ = A₃`; `σ(A₄) = ∅`; `3`-length 2 | correct | none |
| §3.4 types (r8) | `C₇² ⋊ C₃²`; `C₇ ⋊ C₃`; `C₅ × (C₇ ⋊ C₃)` | `2³ ≡ 1 (7)`; `W₂ = 1`; no `E₀` | matches MC-BGsection16 110–162 | none |
| §4.1–§4.3 (r8) | `(M, A(M))` vs `(M, A₀(M))`; `C₇ ⋊ C₃`; `e = 3, h = 7` | agree on `CF(M, A(M))`; degree `3 = |L : H|`; `4/63` | correct | none |
| §4.4 (13.2), (13.15), (13.18), (13.19) (r8) | `(5, 3)`, `(7, 3)`; `e = q < p` | `31`, `57 = 3 · 19`; `11`, `12 = 30/3 + 2`; first alternative only | correct | none |
| §5.1 `appendixC_prime_le` (r8) | `(3, 2)`, `(5, 3)`, `(3, 5)`, `p = 2`, `p = q` | `gcd(4, 2) = 2`; `gcd(31, 4) = 1`, `5 ≤ 3` false; `3 ≤ 5`; vacuous | as MC-BGappC 41–48 | none |
| §5.2 (14.5), complement (r8) | `q < p`, `U ≤ H(L)`; `y ∈ H(T)` | `H(L) = U ⟹ L = S`; `|W^y| = pq` | correct | none |
| §5.3 (14.8) (r8) | `(5, 3)`, `(7, 3)`, `(7, 5)`, `(3, 2)` | `729 > 625`; `6561 > 2401`; `390625 > 117649`; `16 < 27` | `p ≥ 5` present | none |
| §5.4, §5.5 (r8) | `(7, 3)`, `(5, 3)` | `19 ≡ 5 (7)`; `31 ≡ 1 (5)`; `256 > 211` | correct | none |
| headline endpoint theorems (r8) | `C₇ ⋊ C₃`, `A₅`, one-tactic probe | solvable; `60` even; probe fails on all six | not padding | none |

## Not verifiable

- Bender–Glauberman 1994, Proposition 1.2: there is no legal copy, and the source is settled as `uncertified`. The README's form over one chief series could not be compared with the printed statement. Only the math-comp transcription (MC-BGsection1 lines 169–215, whose comments name the two equalities of Proposition 1.2) was read.
- Peterfalvi 2000 and Feit–Thompson 1963: not needed for the changed passages. The previous report gives their status (uncertified; image-only scan, no OCR on this worker).

## Source issues

- none
