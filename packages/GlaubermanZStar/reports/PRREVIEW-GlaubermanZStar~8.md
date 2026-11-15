# Review of GlaubermanZStar (pull request #1778 at d642d3e)

**Verdict:** accepted

Incremental re-review of 135 changed lines since 581115c. No finding.

## Previous findings

- R01 — repaired: "`pPrimeCore 2 G` of ModularCharactersAndBlocks §0.3"; "the `2`-group is cyclic or generalized quaternion (CohomologyOfGroups §8.2)"; "Mathlib `IsCyclic.isComplement'` makes the kernel `K` of the transfer `G →* S` a complement of `S`". No mention of the uncitable roadmap remains (gate `dropped=0`).
- R02 — repaired: the description now reads "elaborates with four admitted headline theorems (the Z* theorem in its isolated and Sylow forms, Brauer–Suzuki, and the involution-section constancy) and one definition".

## Verified sound

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §2.2, cyclic Sylow `2`-subgroup gives `K = O(G)` via `IsCyclic.isComplement'` | `F₂₀`; `S₃`; `C₃`; trivial group | `minFac 20 = 2`, `K = C₅`, `|O(G)|` odd dividing `5·4`, so `5`; `minFac 6 = 2`, `K = A₃`; `minFac 3 = 3 ≠ 2`; `minFac 1 = 1 ≠ 2` | holds; the separate odd-order branch (`S = 1`, `O(G) = G`) is needed and is there |
| §2.2, a finite abelian `2`-group with at most one involution is cyclic | trivial; `C₄`; `C₂ × C₂`; `C₄ × C₂`; `k` cyclic factors | `0` involutions, `0` factors; `1`; `3`; `3`; `2^k − 1 ≤ 1` exactly when `k ≤ 1` | true; "at most one" covers the trivial subgroup |
| §2.2, unique involution ⇒ cyclic or generalized quaternion (bridge + CohomologyOfGroups §8.2) | `Q₈`; `Q₁₆`; `D₈`; `C₈` | abelian subgroups `⟨i⟩, ⟨j⟩, ⟨k⟩, ⟨−1⟩, 1` cyclic, `QuaternionGroup 2`, `s = 3`; `QuaternionGroup 4`, `s = 4`, order `16`; `5` involutions, hypothesis fails; cyclic | agrees with `brauer_suzuki`'s `QuaternionGroup (2^(n-2))`, `n ≥ 3` (order `2^n`) |
| §2.2 Check, `Q₈` and `C₄ × C₂` | both | `Q₈`: one involution, not cyclic, nonabelian; `C₄ × C₂`: involutions `(2,0)`, `(0,1)`, `(2,1)` | both controls correct |
| §1.3 step 3, `X = ⟨w⟩ × O(X)` by `MonoidHom.ker_transferSylow_isComplement'` | `X = C₆`, `w` of order `2`; general `|X| = 2·odd`, `w` central | `N_X(⟨w⟩) = X = C_X(⟨w⟩)`, kernel `C₃ = O(X)`; kernel normal of odd index-`2` order, characteristic in `X ⊴ G`, so `≤ O(G) = 1` | hypothesis `N(P) ≤ C(P)` met; conclusion `X = ⟨w⟩` matches `waldecker2013` line 983 |
| §2.5, `S ⊓ M` cyclic or generalized quaternion, then `z ∈ Z(M)` | `M` proper nontrivial normal in a least counterexample | `z ∈ M` (previous bullet), so `S ⊓ M ≠ 1` with unique involution `z`; cyclic case §2.2, quaternion case `P(M)`, `|M| < |G|` | no circularity: only the cyclic case of §2.2 and the smaller group are used |
| `brauer_suzuki` (statement unchanged; cited by the changed §2.2 and §2.5) | `Q₈`; `n = 2` | `N = ⊥`, commutators with `−1` trivial; `QuaternionGroup 1 ≅ C₄`, excluded by `3 ≤ n`, covered by §2.2 | unchanged and consistent |

Rows for all other statements stand as in the previous review, of `581115c`.

- Gate: the worker's run at this head passes, every count `0` including `dropped=0`, `depcheck=0`, `build=0`. A rerun from the worktree without the candidate order reports only `depcheck: NOT IN ORDER: GlaubermanZStar (insert it after its last supplier)`, which is a placement note, not an UPWARD or CYCLE line.
- Dependency check (movable, candidate order): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. CohomologyOfGroups (position 318) is before OddOrderTheorem (407) and this roadmap (408).
- Elaboration: `lake env lean` on `TauCetiRoadmap/GlaubermanZStar/Suggested.lean`: four `declaration uses sorry` warnings (lines 37, 47, 58, 81), nothing else. The diff changes only the module docstring; the five signatures are those of `581115c`. The signature listing's declaration `in` and its "line 91" error are artefacts of the listing.
- Library declarations opened at the pin: `MonoidHom.ker_transferSylow_isComplement'` (`Mathlib/GroupTheory/Transfer.lean` line 279, hypothesis `N(P) ≤ C(P)`), `IsCyclic.normalizer_le_centralizer` and `IsCyclic.isComplement'` (same file, lines 312 and 343, hypothesis `(Nat.card G).minFac = p`), `CommGroup.equiv_prod_multiplicative_zmod_of_finite` (`Mathlib/GroupTheory/FiniteAbelian/Basic.lean` line 179, factors with `1 < n i`), `Abelianization.commutator_le_ker` (`Mathlib/GroupTheory/Abelianization/Defs.lean` line 73; `commutator_subset_ker` is its deprecated alias, line 78).
- Cross-roadmap citations resolved: ModularCharactersAndBlocks §0.3 at its open head `8379fba` (README lines 353–392: `pPrimeCore p G`, characteristic, "a normal subgroup lies in it exactly when it is a `π`-group", `O_π(G ⧸ O_π(G)) = 1`, `O_π(N) = O_π(G) ⊓ N`); CohomologyOfGroups §8.2 at its open head `6447a96` (README lines 2642–2653, the `p = 2` case as cited). Every item the contracts at README lines 147–149 and 176–177 list is stated there.
- Source locators checked on changed passages (seeded sample §1.3, §2.5 and the Needs lines of §1.2, §3.2): `waldecker2013` Theorem 2.19 (line 506), Lemma 4.2 (1)–(2) (lines 916–919), Lemma 4.4 steps (1)–(2) (lines 963, 975–985). All support the statements as written.
- Duplication: `roadmaps grep` for an abelian `2`-group with one involution being cyclic finds no other owner on main or at an open head; the pinned Mathlib has no such lemma, so the bridge target of §2.2 is this roadmap's. Nothing changed outside the folder against `origin/main`.
- Pull request text against this head: title; the three summary paragraphs (suppliers named: Mathlib, Tau Ceti, ModularCharactersAndBlocks, CohomologyOfGroups; the Dade/induction comparison of OddOrderTheorem in the prose); "Add a roadmap" (3 files, 1129 insertions, 0 deletions); the import-boundaries paragraph against README lines 48–72 and §2.2; the prerequisites sentence; the validation sentence. No sentence is contradicted.
- Remark: the `rank-one` statement that closes §2.2 uses §2.5, which its `*Needs:*` line does not list; the text before this change had the same shape (citing §2.4).

Overlap check: read OddOrderTheorem, ModularCharactersAndBlocks, CohomologyOfGroups, FiniteGroupInvariants, CharacterTheory, FiniteGroupExtensionSplitting; the `2'`-core is ModularCharactersAndBlocks §0.3's, the classification of `2`-groups with cyclic abelian subgroups CohomologyOfGroups §8.2's, the Dade/induction comparison OddOrderTheorem F2 §2.4's; isolation, `Z*(G)`, Brauer–Suzuki and the one-involution cyclicity bridge are this roadmap's alone.

Source independence: changed passages only; 3 passages compared with 1 source (`waldecker2013` lines 506–509, 524–528, 975–985 against §2.2 and §1.3 step 3), none shared (the README's routes through Mathlib's transfer and the structure theorem are not the source's); largest share of locators `waldecker2013`, as before; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- `brauer_suzuki1959`: the cached text is a placeholder; no changed passage cites it.
- `glauberman1966`, `suzuki1986`: settled uncertified; cited by locator only, and no changed passage adds a locator into them.
- The description's "AI assistance" paragraph and the checks it reports are outside what this review can run.

## Source issues

- none

## For the human reviewers

- Licence: the README's References cite the AxiomMath CFSG repository (stated Apache-2.0) as prior art for the Layer 2 stages; `Suggested.lean` was not compared with its files.
- Not tested: `glauberman1966` and `suzuki1986`, the sources of the main theorem and of the Layer 2 proof, are uncertified; wording and arrangement were never compared with their text.
- The description's generated `depends-on` and `merge-order` blocks still list #1634 LocalFiniteGroupTheory and do not list #2338 CohomologyOfGroups; the README at this head cites the second and not the first.
