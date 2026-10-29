# Review of LocalFieldsRamification (pull request #617 at 0794304)

**Verdict:** accepted

No finding. This is an incremental re-review of the 128 lines changed since `14889ce` (96 insertions, 32 deletions, all in `TauCetiRoadmap/LocalFieldsRamification/README.md`; `Suggested.lean` is unchanged, and the diff outside the folder is empty). The four findings of the previous review are accounted for below; every changed passage, every name and locator it introduces, and the Lean statements it touches were checked as set out under *Verified sound*.

## Previous findings

- R01 — repaired: README:432–472 is a new §2.1 “Detection in a cyclic subextension”, stated for finite abelian `L/K` with the eventual-triviality clause, with a finite-abelian-decomposition route and the native upper-quotient theorem as inputs; README:45 now says “Hasse–Arf for extensions of prime degree”, and the three names absent at the pin (`Herbrand/CyclicReduction.lean`, `upperJump_iff_exists_isCyclic_intermediateField`, `exists_eq_intCast_of_exponent_prime`) no longer occur anywhere in the folder. The `ℚ₂(ζ₈)` test is README:461–463.
- R02 — repaired: README:339–346 adds the graded-quotient input (“the positive graded quotient `G_i/G_{i+1}` embeds into the additive residue field of characteristic `p` … has order exactly `p`”), the `G₀ = G` and `G₀/G₁` divisibility step, and eventual triviality; README:349–353 cites the six pinned declarations; README:365–368 adds the `C₄` countermodel as a negative-control Check.
- R03 — repaired: README:239 reads `TauCeti.IsArithFrobeniusLift.toTameQuotient_mul_tameInertiaHom_mul_inv`, which elaborates at the pin (`Tame/Quotient.lean:401`, inside `namespace IsArithFrobeniusLift`).
- R04 — repaired: README:52–54 attributes the finite-Tate baseline to Mathlib, supplements to ClassFieldTheory Layer 0, class formations to Layer 2, local duality to Layer 5, reciprocity and existence to Layers 6–8; on main (`c994070`) those headings are at `TauCetiRoadmap/ClassFieldTheory/README.md:642, 807, 920, 1220, 1312, 1433`.

None of the four repairs introduced a new problem; the checks that establish this are below.

## Verified sound

:robot: Independent AI review, for human consideration; not an approval. Head `0794304d728ec4bca65af13707af3b2120c23eb0`; packages at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (both confirmed from `lake-manifest.json` and the package checkouts). No file of the worktree was edited; probes ran on scratch copies.

### Gate, build, elaboration, dependency check

- The gate run on this head: every check zero, `OK` (`set_option`, blob, latex, prnum, sorry-data, imports, stray-files, outside-folder, depcheck, metadata, dirty all `0`); the worker's gate additionally reports `build=0`.
- `lake env lean` on `Suggested.lean`: exit 0, exactly two `declaration uses sorry` warnings (lines 51 and 69), no other diagnostic.
- `#check @pow_succ_dvd_lowerIndex_sub` and `#check @hasseArf` on a scratch copy: both elaborated types carry every binder of the README statements (both local-field structures, `Algebra`, `ValuativeExtension`, `Module.Finite`, respectively `IsGalois` and `IsAbelianGalois`; Sen also `ringChar 𝓀[K] = p`, total ramification, `finrank = p ^ r`, the generator equation, `j + 1 < r`, both lower-index equalities, conclusion in `ℤ`). No section `variable` exists in the file, so nothing could silently disappear; nothing changed since the previous review (the Lean file is byte-identical).
- The prescribed dependency check printed `depcheck: 198 roadmaps, 1259 edges, 0 problem(s)`: no UPWARD or CYCLE line, no `moved:` line. README:246 still says no roadmap supplies this one; every `*Needs:*` line names only Mathlib, Tau Ceti or an earlier section of this README. The new §2.1 cites nothing later than itself; §2.3 needs 1.3, 2.1, 2.2, and Layer 2's Dependencies paragraph (README:533–534) states that order.
- Ownership: the roadmap service's grep over main and the 426 open heads finds no other roadmap stating Sen's congruence or Hasse–Arf as its own target (ArithmeticGaloisRepresentations §3 proves conductor integrality *from* Hasse–Arf and cites this roadmap; FunctionFieldArithmetic, ArtinRepresentations and others import it). No open roadmap cites the renumbered §2.2/§2.3 by section number, so the renumbering breaks no citation. Ownership against open pull requests the brief does not list with files was not checked.

### Pinned names introduced or changed by the diff

Each was opened at the pin, with its `variable` context, and `#check`ed in a scratch file.

| Name (README line) | Pinned location | What it says; what it does not include |
|---|---|---|
| `lowerRamificationGroup_zero_eq_top_iff` (192, 349) | `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:161` | `G_0 = ⊤ ↔ IsTotallyRamified K L`; needs `[IsGalois K L]` (in scope in Layer 1). |
| `exists_forall_lowerRamificationGroup_eq_bot` (193, 353) | same file, `:204` | `∃ N : ℤ, ∀ i ≥ N, G_i = ⊥`; no Galois hypothesis needed. |
| `lowerJump_eq_intCast` (194, 452) | same file, `:315` | every `LowerJump` is at an integer of `[−1, ∞)`. |
| `ramificationGroupGradedToResidueField` (195, 351) | `UnitFiltration/RamificationGroup.lean:481` | additive hom `G_{n+1}/G_{n+2} →+ 𝓀[L]` for `n : ℕ`, i.e. depths `≥ 1`, given a uniformizer; context `[MulSemiringAction G L] [IsInvariantSubring G 𝒪[L]]`, satisfied for `Gal(L/K)` by `GaloisAction.lean:70`. |
| `…_injective` (196, 352) | same file, `:506` | injectivity of that hom. |
| `card_ramificationGroupGraded_zero_dvd_card_residueField_sub_one` (198, 350) | same file, `:628` | `#(G_0/G_1) ∣ #𝓀[L] − 1`. |
| `upperJump_herbrand_iff` (213, 451) | `Herbrand/Jump.lean:53` | `UpperJump K L (φ u) ↔ LowerJump K L u`, `[IsGalois K L]`. |
| `map_restrictNormalHom_upperRamificationGroup` (211, 453, 485) | `Herbrand/UpperQuotient.lean:98` | `(G/H)^v = G^v H/H` for all `v ∈ [−1, ∞)`, tower `M/L/K` both Galois over `K`. |
| `Subgroup.upperRamificationGroup_fixedField` (212, 486) | same file, `:264` | the same for `H` normal and `L^H` with any compatible local-field structure. |
| `UpperJump.exists_eq_intCast_of_finrank_prime` (215) | `Herbrand/HasseArf.lean:137` | integrality under `(finrank K L).Prime`; no abelian hypothesis needed since a group of prime order is cyclic. Correctly described at README:45 and :216. |
| `IsArithFrobeniusLift.toTameQuotient_mul_tameInertiaHom_mul_inv` (239) | `Tame/Quotient.lean:401` | `σ τ σ⁻¹ = τ^q` with `q = #𝓀[K]`: the arithmetic convention of README:91. |
| `CommGroup.equiv_prod_multiplicative_zmod_of_finite` (129, 449) | Mathlib `GroupTheory/FiniteAbelian/Basic.lean:178` | `G ≃* Π Multiplicative (ZMod (n i))` with `1 < n i`; README's gloss “a nonidentity element has a nonidentity cyclic coordinate” is the statement that a product is the identity iff each coordinate is. |

`Herbrand/CyclicReduction.lean` does not exist at the pin (the directory holds `Basic, HasseArf, Jump, Quotient, Tower, Unramified, UpperQuotient`) and is no longer cited.

### Seeded source sample

Fesenko–Vostokov was fetched by the sources service from the author-hosted second edition (`fesenko-vostokov`, `author-page`); printed page `n` is extraction page `n + 10`. Serre and Neukirch remain unreadable (see *Not verifiable*), as in the previous review.

| Target | Locator and result |
|---|---|
| 0.1 unit filtration of `ℚ_p` | Serre IV §2: unchanged by the diff, text unavailable; carried from the previous review (independent native-library check). |
| 0.2 unshifted norm inclusion | Serre V §6: unchanged, text unavailable; carried (the floor deduction from the pinned shifted inclusion re-read and valid). |
| 0.3 dyadic square classes | Neukirch II §5: unchanged, text unavailable; carried (count checked against the pinned cardinality). |
| 1.1 lower-break list (changed) | `fesenko-vostokov` line 4166 (III (4.3), Proposition (1), p. 92): `c_k` depends only on `v_p(k)` for totally ramified cyclic of degree `p^m`. New citations: line 2666 (II (4.3), Proposition, p. 57, proof p. 58): `G_i = {σ ∈ G_0 : σπ − π ∈ 𝓜^{i+1}}` and `G_i = 1` for large `i`; line 2695 (II (4.4), Proposition, p. 58): `ψ_i : G_i → L̄` additive, kernel `G_{i+1}`, `i > 0`; line 2715 (Corollary 1, pp. 58–59): `G_0/G_1` cyclic of order prime to `p`, `G_i/G_{i+1}` abelian `p`-groups. All support the route as written; pages as cited. |
| 1.2 Sen | line 4183, part (3), p. 92, proof lines 4193–4237, p. 93: unchanged; re-read, supports the target. |
| 1.3 upper breaks | proof of the Theorem, p. 92, lines 4143–4165: unchanged; re-read. |
| 2.1 cyclic detection (new) | line 3892 (III (3.5), Theorem (Herbrand), pp. 85–86): finite Galois `L/F`, Galois subextension `M/F`, nonnegative `x, y = h_{L/M}(x)`: image of `Gal(L/F)_y` is `Gal(M/F)_x` (`h` is `ψ`); Corollary line 3925 gives `(G/H)(x) = G(x)H/H`. The README's restriction “for nonnegative indices; at `−1` …” matches the theorem's hypothesis; the pinned theorem covers all of `[−1, ∞)` anyway. The finite-abelian decomposition is Mathlib's. |
| 2.2 `p`-part reduction | line 4137 (first paragraph of the proof, p. 91): unchanged; re-read. |
| 2.3 Hasse–Arf | line 4133 (Theorem, p. 91): finite abelian, separable residue extension; unchanged. |

### Adversarial mathematics

Rows marked “(prev.)” are carried from the previous report (`PRREVIEW-LocalFieldsRamification~2`, 14889ce) for statements the diff leaves untouched; their values were recomputed where a changed passage depends on them. New rows cover every changed statement.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Native local-field hypotheses (prev.) | ℚ₂, 𝔽₃((t)); trivially valued 𝔽₂; zero ring | residue orders 2, 3; trivial valuation and zero ring excluded by `IsNonarchimedeanLocalField` | Keep. |
| `e·f` normalization (prev.) | ℚ₂, ℚ₂(√2), ℚ₂(√5) | (e,f,N) = (1,1,1), (2,1,2), (1,2,2) | Keep. |
| Additive valuation sign (prev.) | 12, 2, 1 in ℚ₂ | v = 2, 1, 0; norms 1/4, 1/2, 1 | Keep. |
| Unit filtration membership (prev.) | 1, 5, 2 in ℚ₂ | v(5−1) = 2: `5 ∈ U₂ ∖ U₃`; `2 ∉ U₀` | Keep. |
| Graded-unit conventions (prev.) | ℚ₂; ℚ₃ | #U₀/U₁ = 1, 2 = q−1; #U₁/U₂ = 2, 3 = q | Keep. |
| Lower index and group membership (prev.) | ℚ₂(√2), σ ≠ 1; identity | i(σ) = 3, break 2; `G₂ = C₂`, `G₃ = 1`; i(1) = ∞ | Keep. |
| Real lower indexing (prev.) | ℚ₂(ζ₈), u = 1, 3/2, 3, 7/2 | orders 4, 2, 2, 1 at ceilings 1, 2, 3, 4 | Keep. |
| Herbrand integral and inverse (prev.) | ℚ₂(ζ₈), u = 2, 3 | φ(2) = 3/2, φ(3) = 2, ψ(2) = 3 | Keep. |
| Upper-jump predicate (prev.) | ℚ₂(ζ₈), u = 1, 3/2, 2 | drops 4→2 after 1 and 2→1 after 2; constant at 3/2 | Keep. |
| Lower numbering vs quotient (prev.) | ℚ₂(ζ₈), H = {1,7} | `G₃H/H` order 2, `(G/H)₃ = 1`; upper groups at 2 both order 2 | Keep. |
| Tower order, both controls (prev.) | ℚ₂ ⊂ ℚ₂(√2) ⊂ ℚ₂(ζ₈); unramified L, M = L(√2) | 9/4 vs 2; both composites 3 | Keep. |
| Frobenius convention (prev.) | ℚ₂(ζ₇); C₇ ⋊ C₃ | exponents 2 vs 4; στσ⁻¹ = τ² | Keep; R03's corrected name has this convention (`τ^q`, q = 2). |
| 0.1 congruence iff and residue map (prev.) | p = 2, u = 5; p = 3, u = −1; 7 ∈ ℤ₅ | 4 ∣ 4, 8 ∤ 4; 3 ∤ −2; residue 2 | Keep. |
| 0.2 floor, shift, zero/unramified (prev.) | ℚ₃(√3), i = 2, u = 4; ℚ₂(ζ₈), i = 2 | v₃(16−1) = 1 = ⌊φ(2)⌋; ⌊3/2⌋ = 1, ψ(2) = 3 > 2 | Keep. |
| 0.3 dyadic count and exclusions (prev.) | ℚ₂, ℚ₂(√2), ℚ₂(√5); ℚ₃; 𝔽₂((t)) | 8, 16, 16; 4; infinite | Keep. |
| Layer 1 `c_k` independence of π (prev.) | ℚ₂(√2), π = √2, 3√2 | both ratios −2, v = 2 | Keep. |
| 1.1 exact list and tail (prev.) | ℚ₂(√2); real quartic subfield of ℚ₂(ζ₁₆) | [2]; [2, 4]; #G₂ = 4, #G₄ = 2, #G₅ = 1 | Keep. |
| 1.1 dependence on `v_p(k)` (prev.) | k = 1, 3, −1, 2, 6 | c = 2, 2, 2, 4, 4 | Keep. |
| **1.1 new step `G₀ = G`, `G₁ = G`** (changed) | real quartic (e = 4 = degree); ℚ₃(√3) (non-example) | quartic: `G₀ = G` by `e = [L:K]`; #G₀/G₁ divides 4 and q_L − 1 = 1, so 1 and `G₁ = G`. ℚ₃(√3): #G₀/G₁ = 2 divides q−1 = 2 and divides 2, not a 3-power: `G₁ ≠ G`, excluded by the layer's `pʳ` hypothesis | Correct; the divisibility step uses exactly the two pinned facts cited. |
| **1.1 new step: graded quotients of order `p`** (changed) | real quartic depths 1..5; abstract `H₀ = H₁ = C₄`, `H₂ = 1` | quartic: orders 4,4,2,2,1 at depths 1..5, quotients of orders 1,2,1,2 ≤ 2; countermodel: `H₁/H₂ = C₄`, exponent 4, no injection into an 𝔽₂-vector space | Countermodel of R02 now excluded by the cited embedding; Check at README:365–368 states exactly this. |
| **1.1 “each drop removes one factor of `p`”** (changed) | r = 1: ℚ₂(√2); r = 2: quartic | orders 2→1, one drop at 2; orders 4→2→1, drops at 2 and 4: `r` drops, subgroups of orders 2ʳ⁻ʲ all occur, `b_j` strictly increasing | Keep. |
| 1.2 Sen headline and boundaries (prev.) | real quartic; degree-9 subfield of ℚ₃(ζ₂₇); r ≤ 1; C₄ with breaks 2, 3 | 2 ∣ 2; 3 ∣ 3; no `j` with `j+1 < r`; 2 ∤ 1 | Keep. |
| 1.3 upper-break sum (prev.) | quartic; degree-9 subfield; impossible C₄ | [2, 3]; [1, 2]; 5/2 | Keep. |
| **2.1 iff, forward direction** (new) | ℚ₂(ζ₈), u = 1 and u = 2 | u = 1: ψ(1) = 1, `G₂ = {1,5} ⊊ G₁ = G`, g = 3; `G/G₂ ≅ C₂`, H = {1,5}, `L^H = ℚ₂(i)` (fixes ζ₈² = i), break 1, groups 1 after. u = 2: ψ(2) = 3, `G₄ = 1 ⊊ G₃ = {1,5}`, g = 5; decomposition ⟨7⟩×⟨5⟩ gives H = {1,7}, `L^H = ℚ₂(√2)`, break 2; decomposition ⟨3⟩×⟨5⟩ gives H = {1,3}, `L^H = ℚ₂(√−2)`, v(2√−2) = 3, break 2 as well | The witness depends on the chosen decomposition, but every choice has the asserted break; the Check at README:461 (an existence statement) is true. |
| **2.1 iff, converse** (new) | ℚ₂(√2) ⊂ ℚ₂(ζ₈), u = 2 | `(G/H)^v` for v > 2 is 1 and `(G/H)² ≠ 1`; in G, `G^v = G_{⌈ψ(v)⌉} ⊆ G₄ = 1` for v > 2 and `G² = G₃ = {1,5}` | Strict drop in the quotient forces a strict drop in `G` (antitonicity plus equality of images). |
| **2.1 negative controls** (new) | ℚ₂(ζ₈), u = 3/2; u = −1; unramified quadratic | 3/2: `G^v = G₃ = G²` on (3/2, 2], not a break, and no quadratic subfield has break 3/2 (their breaks are 1, 2, 2); −1: `G₀ = G`, not a break, no unramified subfield; unramified quadratic: orders 2 at −1, 1 after, witnessed by itself | Both sides of the iff false, or both true, in each case. |
| **2.1 route: `⌈ψ(v)⌉ ≥ i + 1`** (new) | ℚ₂(ζ₈), u = 1, v = 3/2; quartic, u = 2, v = 5/2 | ψ(3/2) = 2 ≥ 2; ψ(5/2) = 3 ≥ 3 | ψ strictly increasing with ψ(u) = i integral gives the inequality. |
| **2.1 Check, quartic** (new) | ℚ₂(ζ₁₆ + ζ₁₆⁻¹) | lower breaks 2, 4; φ(4) = 3; upper orders 4 on [−1,2], 2 on (2,3], 1 after: `F = L` is not a last-break witness for u = 2; `ℚ₂(√2)` is; u = 3 witnessed by L | Check correct as written. |
| **2.1 Check, `S₃`** (new) | splitting field of X³ − 3 over ℚ₃ | abelianization C₂ kills A₃; images of 1 and a 3-cycle coincide; the group has upper break 3/2 (orders 6,3,3,3,1 at depths −1..3) | Shows where the abelian hypothesis enters; consistent with the §2.3 non-example. |
| 2.2 unramified/tame removal (prev.) | unramified cubic; unramified quadratic · ℚ₂(√2); ℚ₂(i); ℚ₃(ζ₉) | no positive jump; break 2 over either base; E = F, break 1; orders 6,3,3,1 give φ(2) = 1 | Keep (section renumbered only). |
| 2.3 nonpositive and trivial cases (prev.) | identity; unramified cubic; tame quadratic | jump sets ∅, {−1}, {0} | Keep. |
| **2.3 route via 2.1 then 2.2** (changed) | ℚ₂(ζ₈), u = 2 | 2.1 gives `F = ℚ₂(√2)`, u = 2 > 0; 2.2: F₀ = ℚ₂, E = F, cyclic of order 2 = 2¹; 1.3: u₀ = b₀ = 2 ∈ ℤ | The three sections compose in the stated order with no gap. |
| **2.3 bullet, elementary abelian of every rank** (changed) | ℚ₂(ζ₈) (C₂²); ℚ₂(ζ₈, √5) (C₂³) | breaks 1, 2; breaks −1, 1, 2 | All integers; the pinned `exists_eq_intCast_of_exponent_prime` is no longer claimed. |
| 2.3 mixed/equal characteristic and nonabelian control (prev.) | ℚ₂(ζ₁₆); Artin–Schreier over 𝔽₂((t)), 𝔽₃((t)); S₃ over ℚ₃ | [1,2,3]; 1/1, 2/2; 3/2 | Keep. |
| **Scope line 45, prime-degree Hasse–Arf** (changed) | ℚ₂(√2) (degree 2); ℚ₂(ζ₈) (degree 4) | pinned theorem applies to the first (break 2); not to the second (4 not prime), which 2.3 covers | Correct description of the pinned supply. |
| **Scope lines 52–54, ClassFieldTheory layers** (changed) | main `c994070` | headings at lines 642 (Layer 0, cohomology suppliers), 807 (Layer 2, class formations), 920 (Layer 5, duality), 1220/1312/1433 (Layers 6–8, reciprocity, conductors, existence) | Correct; creates no supplier edge. |
| Imported objects and deferrals (prev., 15 rows) | as in the previous report | unchanged by the diff | Carried. |

### Shape, policy and Lean form

- README shape unchanged in kind: Summary, Scope and ownership, Conventions (8 Checks), Exact supplier contracts, How to read the build, Layers 0–2 with `### Examples` and `### Dependencies`, Downstream consumers, References. The new §2.1 has a prose statement, a route with inputs, one API bullet and four Checks (two computed, a degenerate case, a non-abelian control); the new 1.1 Check is a computed negative control. Every target has a locator.
- No process words, pull-request numbers, LaTeX delimiters, local paths or round labels in the changed text (grep over the README). The word “current” and “removed” do not occur.
- `Suggested.lean` is unchanged: single `import Mathlib` plus three existing `TauCeti.*` modules, no `set_option`, no sorry'd data, `theorem` only, two headlines. Headline inventory (README:13–14): Sen's congruence and Hasse–Arf, both stated. One-tactic probes on a scratch copy: `simp` (no progress), `rfl` (fails), `infer_instance` (not a class) on both; `exact` with the pinned prime-degree Hasse–Arf fails on the remaining `Nat.Prime (finrank K L)` premise. No padding; no statable headline absent.
- Every backticked name of this roadmap's own in the README (`pow_succ_dvd_lowerIndex_sub`, `hasseArf`) is declared in `Suggested.lean`; the generality of each Lean statement equals the README's.

## Not verifiable

- **Serre, *Local Fields*** (DOI `10.1007/978-1-4757-5673-9`): paywalled; cited for 0.1 (IV §2), 0.2 (V §6), 1.3 (IV §3), 2.2 (IV §3), 2.3 (V §7) and the quaternion non-example (IV §3, Exercise 3). Unchanged by the diff; previously recorded as `uncertified`, not requested again.
- **Neukirch, *Algebraic Number Theory*** (DOI `10.1007/978-3-662-03983-0`): paywalled; cited for 0.3 (II §5). Unchanged; `uncertified`.
- **Sen, *On automorphisms of local fields* (1969)**: only the JSTOR landing page resolves; the Fesenko–Vostokov proposition (read) is the locator the README actually uses for the statement.

## Source issues

- none
