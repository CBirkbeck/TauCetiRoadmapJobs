# Review of OddOrderTheorem (pull request #1777 at b3bd1fe)

**Verdict:** accepted

This is an incremental re-review of the 13 changed lines since be7ffb5. All of them are in `TauCetiRoadmap/OddOrderTheorem/README.md`, in the source parenthetical of §1.2 (Propositions 1.2 and 1.3). `Suggested.lean` and `metadata.toml` are byte-identical to be7ffb5. The previous R01 is repaired, and the repair introduces no new problem. The gate passes with the build, and the dependency check reports no problem. No finding remains.

## Previous findings

- R01 — repaired: lines 398–401 now say "`Fitting_stab_chief`, lines 169–170 and 174–186, proves `F(G') ≤ ⋂ C_G(U ⧸ V)` over all chief factors … `chief_stab_sub_Fitting`, lines 171–172 and 188–215, proves `G' ⊓ ⋂ C_G(U ⧸ V) ≤ F(G')` over only those chief factors `U ⧸ V` of `G` with `U ≤ F(G')`".

## Verified sound

**Gate, dependency check, build and Lean.**

- My run of `gate … --base origin/main --build` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK` and exited 0. This agrees with the worker's gate.
- `gate --depcheck … --movable` printed `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)` and exited 0. It has no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, OddOrderTheorem is line 397 and InverseGaloisAndArithmeticFundamentalGroups is line 54.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff be7ffb5 HEAD` on `Suggested.lean` and `metadata.toml` is empty.
- `lake env lean` on `Suggested.lean` exits 0. Its only warnings are `declaration uses 'sorry'` at lines 52, 55, 59, 118, 128 and 144. The file is unchanged, so three results carry over from the previous report. First, the `#check @` comparison of the ten declarations: `signatures.md` lists the same ten, and none has dropped a binder. Second, the one-tactic padding probe: it fails on all six theorems. Third, the headline audit: the three forms of the odd order theorem, `exists_dadeExtension`, `isDadeExtension_eq_indClassFunction` and `appendixC_prime_le` are stated, and the module docstring names the headlines that cannot be stated.

**The changed passage, line by line against MC-BGsection1.**

- Lines 162–163: the section hypotheses are `solG : solvable G` and `nsG'G : G' <| G`. The README's "relative form for solvable `G` and `G' ⊴ G`" is right.
- Line 169: `Gchief UV` is `chief_factor G UV.2 UV.1`, so the pair is `U ⧸ V` with `U = UV.1` and `V = UV.2`. Line 170 defines `H` as the intersection of the quotient-action stabilizers `'C(U/V | 'Q)` over every chief factor. Lines 174–186 prove `'F(G') \subset H`. Since `F(G') ≤ G` and `G` normalizes each `V`, this is `F(G') ≤ ⋂ C_G(U ⧸ V)`, as the README says.
- Lines 171–172 define `H'` as `G'` met with the intersection over chief factors with `UV.1 \subset 'F(G')`. Lines 188–215 prove `H' \subset 'F(G')`. Since `G' ≤ G`, meeting with `C_G` instead of the unrestricted stabilizer changes nothing, so the README's `G' ⊓ ⋂ C_G(U ⧸ V) ≤ F(G')` over the factors with `U ≤ F(G')` is exact.
- Lines 219–227 hold `cent_sub_Fitting`, and the comment at line 219 credits P. Hall. Line 223 applies `chief_stab_sub_Fitting solG _` with the target `'F(G)`, that is with `G' = G`. Line 225 destructs the hypothesis `sUF : U \subset 'F(G)`, and line 226 concludes through `centS`. This matches the README's "since `C_G(F(G))` centralizes every chief factor `U ⧸ V` with `U ≤ F(G)`".
- The two descriptions differ in strength, not in value. `G' ⊓ ⋂_all ≤ G' ⊓ ⋂_restricted ≤ F(G') ≤ G' ⊓ ⋂_all`, so both intersections met with `G'` equal `F(G')`. The restricted form is the stronger statement, and Proposition 1.3 needs it. The README now says this correctly.
- The text that cites §1.2 (the FiniteGroupInvariants supplier row, line 189) and the §1.2 *Needs:* line are unchanged and still consistent with the passage. No other part of the README mentions `Fitting_stab_chief`, `chief_stab_sub_Fitting` or `cent_sub_Fitting`. The new text has no process words or LaTeX, and its backticked math-comp names are source names, not claims about `Suggested.lean` (the gate's `readme-ids-missing=0` agrees).

**Citations and overlaps.**

- `roadmaps resolve` at this head lists two leads, `TauCetiRoadmap.RepresentationTheory.CharacterTheory` and `…InductionRestriction` (README lines 160 and 168). Both are supplier headings for folders on main. The worker's `citations.md` also lists `IsMinimalOddSimple.proper_solvable`, which is the structure field at `Suggested.lean` line 48. All three resolve.
- `overlaps.md`: no open pull request changes this roadmap, drops an id it cites or defines an id cited only here. The change introduces no new object, so ownership as recorded in the previous reports is unchanged.

**Sources: the seeded sample.** No sampled target falls in the change: §1.2 is not in the sample, and §0.1, 0.2, 0.3, 1.1, 1.9, 2.3, 2.7, 2.8, 3.2, 3.3, 3.4, 4.3, 5.1, 5.3 and 5.5 are untouched. Their adversarial rows are carried below from the previous report. The README flags no locator as unverified.

**Adversarial table.** Rows marked "(r9)" are carried from the previous report, with the values computed there, for statements the diff leaves untouched. The first three rows are new and cover the changed passage.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 `Fitting_stab_chief` description (new) | `G = S₄`, `G' ∈ {S₄, A₄, V₄}` | chief factors `V₄/1`, `A₄/V₄`, `S₄/A₄`, with `C_G` equal to `V₄`, `A₄`, `S₄`; `⋂ = V₄`; `F(S₄) = F(A₄) = F(V₄) = V₄ ≤ V₄` | matches lines 170, 175 | none |
| §1.2 `chief_stab_sub_Fitting` description (new) | `G = S₄`, `G' = A₄`; `G' = G = S₃` | factors with `U ≤ V₄`: only `V₄/1`, so `A₄ ⊓ V₄ = V₄ ≤ F(A₄) = V₄`; for `S₃`, only `A₃/1`, so `S₃ ⊓ A₃ = A₃ = F(S₃)`; the sandwich gives the restricted and the full meet equal to `F(G')` | matches lines 172, 190 | none |
| §1.2 Proposition 1.3 via `cent_sub_Fitting` (new) | `G = S₄`; `G = S₃` | `C_{S₄}(V₄) = V₄` centralizes `V₄/1`, so `V₄ ≤ H' = V₄ ≤ F`; `C_{S₃}(A₃) = A₃` centralizes `A₃/1`, so `A₃ ≤ F(S₃) = A₃`; `A₅`: `C(1) = A₅ ≰ 1`, so solvability is needed | matches lines 223, 225 | none |
| §1.2 Proposition 1.2, series from `⊥` to `⊤` (r9) | `S₄`: `1 < V₄ < A₄ < S₄`; `Q₈`; `S₃`; `C₅`; `G = 1` | `V₄ ∩ A₄ ∩ S₄ = V₄ = F(S₄)`; meet `Q₈ = F(Q₈)`; `A₃ = F(S₃)`; `C₅`; empty meet `1 = F(1)` | correct | none |
| §1.2 endpoint Check (r9) | `V₄ < A₄ < S₄` | `V₄ ⋖ A₄ ⋖ S₄` among normal subgroups; meet `A₄`, of order `12 ≠ 4` | discriminating | none |
| §0.1 odd order to sections (r9) | `C₃ ≤ C₆`; `S₃/A₃`; `C₇ ⋊ C₃` | `6` even, `3` odd; `2`; `1, 3, 7, 21` | correct | none |
| `IsMinimalOddSimple`, endpoints (r9) | trivial, `C₃`, `C₇ ⋊ C₃`, `A₅`, infinite | not nontrivial; commutative; `C₇ ⊴`; `60` even; `Nat.card = 0` | matches MC-BGsection7 61–66 | none |
| §0.3 (r9) | `S₃`; `A₅`; `C₇ ⋊ C₃` | `C((12)) = ⟨(12)⟩`; `A₄, D₁₀, S₃` self-normalizing; `N(C₇) = G` | correct | none |
| §1.1 complements, `O_p` (r9) | `A₃ ⊴ S₃`, `C₇ ⊴ C₇ ⋊ C₃`, `V₄ ⊴ S₄`, `C₂ ⊴ C₂²`; `D₈ ≤ S₄` | Sylow 2; Sylow 3; `gcd(4, 6) = 2`; non-conjugate; `⋂ D₈ = V₄` | correct | none |
| §1.2 Lemmas 1.1, 1.2, `F ≠ 1` (r9) | `V₄ ⊴ A₄`, `A₅`, `A₅ × C₃`, `S₄`, `C₆` | `S = C₂`; `Z(F(A₅)) = 1`; `C₃ ≤ Z(F) = C₃`; `Φ = 1 < F` | correct | none |
| §1.3 coprime action (r9) | `⟨(12)⟩` on `V₄`; `x ↦ x⁴` on `C₉`; `V₄` on `C₃²`; `C₂` on `𝔽₂²` | `[V₄, A] = C_{V₄}(A)` of order 2; `[C₉, A] = Φ`; `C(ab) = 1`; no invariant complement | correct | none |
| §1.4 4.3, 1.13, 4.5, 4.7, 2.5, 2.6 (r9) | `D₈`, `Q₈`, `C₉ ⋊ C₃`, `C₃³`, `Heis₂₇`, `C₇ ⋊ C₃` | `exp Ω₁(D₈) = 4`; `Ω₁(Q₈) = {±1}`; `SCN₃ ∋ C₃³`; `h = 4`; degrees `1, 1, 1, 3, 3` | correct | none |
| §1.5 constrained, stable, focal (r9) | `S₃`, `A₅`, `S₄`, `C₇ ⋊ C₃` | `O_{2',2}(S₃) = S₃`; `O_{2',2}(A₅) = 1`; `S₄` not `2`-stable; `G' = C₇` Hall | correct | none |
| §1.6 `p`-length, 1.21(e), 6.5, 6.6 (r9) | `S₃`, `S₄`, `S₃ × S₃`, `H₁ = H₂ = V₄` | lengths `1, 1, 2, 1`; quotient `C₂²`; `S₄` length 2; `KS = A₄`, `K · N(S) = S₄` | correct | none |
| §1.7 4.18 (r9) | `C₇ ⋊ C₃`; `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)`; `S₄` | length 1; `m₃ ≥ 6`, length 2; `2`-length 2 (even order) | correct | none |
| §1.8 A.4(c), Baer–Suzuki (r9) | `S₄`, `x = (12)`; `S₃` | `[V₄, x] = ⟨(12)(34)⟩`; `⟨(12), (12)^{(123)}⟩ = S₃ ∉ O₂`; `⟨x, x^g⟩ = A₃ = O₃` | correct | none |
| §1.9 `ZL`, 6.7 (r9) | `C₇ ⋊ C₃`; `𝔽₃³ ⋊ (C₁₃ ⋊ C₃)`; `S₄` | `Z(L(C₇)) = C₇ ⊴`; `Z(S) = 𝔽₃` not normal; `L ∈ {1, V₄}` | correct | none |
| §1.10 3.6 (r9) | `C₇ ⋊ C₃`; `C₅ × (C₇ ⋊ C₃)`; `C₉ ⋊ C₃` | `C_J(A₀) = 1`; `[J, A] = C₇ ≠ J`; `gcd = 3` | correct | none |
| §2.1 (1.1), (1.4), (1.8) (r9) | `C₃`, `S₃`; `C₇ ⋊ C₃`; `C = D = A₃` | `ε` real; `‖Ind ω − Ind ω²‖² = 2`; bound `2` attained | correct | none |
| §2.2 `DadeDatum` (r9) | `C₃ × S₃`; `S₄`; `A₃ ≤ S₃`; `A = ∅` | 9-element support; `gcd(2, 2) = 2`; fusion fails; vacuous | matches MC-PF2 94–98 | none |
| §2.3 `IsDadeExtension` (r9) | `C₃ × S₃`, `f = 1_A`; rescaled; `L = G` | `3/6 = 9/18`; `27/18`; `9/2`, `1/18`; `T = id` | second clause pins `f a` | none |
| §2.4 comparison (r9) | `⟨(12)⟩ ≤ S₃`; `A₃ ≤ S₃`; `A = ∅` | `1/2 = 3/6`; `0` vs `2`; `N_G(∅) = G` | `A ≠ ∅` present | none |
| §2.5 sign, restriction (r9) | `C₃`, `S = {ω, ω̄}`; `S₁ = {ω}` | two extensions only; `‖ω − ω̄‖² = 2`; `ℤ[S₁, L^#] = 0` | correct | none |
| §2.6 (3.1)–(3.5) (r9) | `C₃ × C₅`; `−σ`; `W₁ = 1`; `C₃ × C₃` | `|V| = 8`; `σ1 = 1`; `V = ∅`; not cyclic | correct | none |
| §2.7 (4.2), (4.3)(d), (4.6) (r9) | `C₇ ⋊ C₃`; `C₃ × C₅`; `A ∪ V^L` | no `W₂`; degree `1 ≡ δ_j`; `V^L ⊄ K` | correct | none |
| §2.8 (5.2), (5.3), (5.9)(a), gluing, dual (r9) | `C₃`, `τ(ω − ω̄) = 1 − ω`; `S₃ ≤ S₃ × C₃` | `‖1 − ω‖² = 2`; `R(ω) = {1, −ω}`; no conjugate pair; norms `5 = 5`; dual coherent | correct | none |
| §2.8 (6.3), (6.8) (r9) | `|L : K| = 3, 1`; `C₃ × C₅` | thresholds `37`, `5`; `43 > 37`; `H' = 1` | correct | none |
| §3.1 prime sets, `C₃ ≀ C₃` (r9) | `C₃³`, `C₃² × C₅`, `S₄`, `C₇ ⋊ C₃`; shift `t` | `α = β = {3}`; `α = ∅`; `2 ∉ σ`; `|C(t)| = 9`, `x³ = (1, 1, 1)` | correct | none |
| §3.2, §3.3 (r9) | `V₄ ≤ S₄`; `S₃`, `A₄`; `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` | four maximal subgroups; `M_σ = A₃`; `σ(A₄) = ∅`; `3`-length 2 | correct | none |
| §3.4 types (r9) | `C₇² ⋊ C₃²`; `C₇ ⋊ C₃`; `C₅ × (C₇ ⋊ C₃)` | `2³ ≡ 1 (7)`; `W₂ = 1`; no `E₀` | matches MC-BGsection16 110–162 | none |
| §4.1–§4.3 (r9) | `(M, A(M))` vs `(M, A₀(M))`; `C₇ ⋊ C₃`; `e = 3, h = 7` | agree on `CF(M, A(M))`; degree `3 = |L : H|`; `4/63` | correct | none |
| §4.4 (13.2), (13.15), (13.18), (13.19) (r9) | `(5, 3)`, `(7, 3)`; `e = q < p` | `31`, `57 = 3 · 19`; `11`, `12 = 30/3 + 2`; first alternative only | correct | none |
| §5.1 `appendixC_prime_le` (r9) | `(3, 2)`, `(5, 3)`, `(3, 5)`, `p = 2`, `p = q` | `gcd(4, 2) = 2`; `gcd(31, 4) = 1`, `5 ≤ 3` false; `3 ≤ 5`; vacuous | as MC-BGappC 41–48 | none |
| §5.2 (14.5), complement (r9) | `q < p`, `U ≤ H(L)`; `y ∈ H(T)` | `H(L) = U ⟹ L = S`; `|W^y| = pq` | correct | none |
| §5.3 (14.8) (r9) | `(5, 3)`, `(7, 3)`, `(7, 5)`, `(3, 2)` | `729 > 625`; `6561 > 2401`; `390625 > 117649`; `16 < 27` | `p ≥ 5` present | none |
| §5.4, §5.5 (r9) | `(7, 3)`, `(5, 3)` | `19 ≡ 5 (7)`; `31 ≡ 1 (5)`; `256 > 211` | correct | none |
| headline endpoint theorems (r9) | `C₇ ⋊ C₃`, `A₅`, one-tactic probe | solvable; `60` even; probe fails on all six | not padding | none |

## Not verifiable

- Bender–Glauberman 1994, Propositions 1.2 and 1.3: there is no legal copy, and the source is settled as `uncertified`. I compared the parenthetical with the math-comp transcription (MC-BGsection1 lines 162–227), whose comments name the two inclusions of Proposition 1.2 and Proposition 1.3. I did not compare it with the printed statement.
- Peterfalvi 2000 and Feit–Thompson 1963: not needed for the changed passage. Earlier reports give their status (Peterfalvi uncertified; Feit–Thompson an image-only scan, with no OCR on this worker).

## Source issues

- none
