# GATE-ProfiniteArithmetic~2: answers to the review of `a0a63ba`

No file was changed. The ownership finding H01 is correct, and it cannot be repaired in the two files this job may edit. H02–H05 are correct as observations about this head, but each of them is a repair to a folder that, by H01, should not merge. A human decides how to continue; options are listed under H01.

## H01 (CBirkbeck) — answered

Correct. At the merge base `0e8b058` the roadmap was active at `TauCetiRoadmap/ProfiniteArithmetic/`. Since then main has archived it to `Completed/ProfiniteArithmetic/` (commits `632ef72`, `b20d16e`, `7baea00`), and `TauCetiRoadmap/ProfiniteArithmetic/` no longer exists on main (`origin/main` at `3ec8d5f`). This PR edits only the folder that was archived. `TauCetiRoadmap/PeripheralActions/Suggested.lean` line 2 on main imports `Completed.ProfiniteArithmetic.Suggested`. The two `Suggested.lean` files share 95 declaration short names in the same namespace `TauCetiRoadmap.ProfiniteArithmetic`.

The archive already contains the substance of this PR's §2.4. Archive README lines 556–567 give the index of characteristic open normal `N ≤ proPFrattini p G` and the compatible-family image, and say explicitly that arbitrary elements of the full finite kernels need not descend. The archive's `Suggested.lean` has 0 `sorry`.

The repair is outside the editable files (`TauCetiRoadmap/ProfiniteArithmetic/README.md` and `TauCetiRoadmap/ProfiniteArithmetic/Suggested.lean`), so the decision is a human one:
- **(a)** Close this PR.
- **(b)** Carry any genuine correction into `Completed/ProfiniteArithmetic/` in a PR based on current main.

The one correction in this PR that the archive lacks is the removal of `set_option`: archive `Suggested.lean` line 152 has `set_option autoImplicit false` and line 163 has `set_option quotPrecheck false in`. This head replaced these with `Additive (TauCeti.zHat : Type)` and `omit … in`.

The archive's universe narrative (README lines 46–48, 99–125) is consistent with the pin. It describes the in-place change as already carried out, and pinned `TauCeti/Topology/Algebra/Group/Profinite/Completion.lean:175–179` states `continuousMonoidHomEquiv` with the target in an independent universe. So this narrative is not a defect to carry over.

## H02 (CBirkbeck) — answered

Correct at this head. The only §2.4 conclusion in Lean is `isProP_ker_toFrattiniQuotient` (`Suggested.lean:704`), which concludes pro-`p` and openness. Neither the compatible-family image equality (README "The compatible-family description of `H`") nor free Frattini-quotient surjectivity is stated.

The surjectivity is already proved at the pin as `TauCeti.freeProP.mapQuotient_proPFrattini_surjective` (`TauCeti/Topology/Algebra/Group/Profinite/Free/Automorphism.lean:213`, for every prime `p` and every finite type `X`). In any surviving copy it should therefore be cited in the supplier contracts, not restated.

Not applied here, because by H01 this folder does not survive. The compatible-family statement belongs, if anywhere, to the archive, which is a certificate rather than a sorry'd acceptance test.

The reviewer's witness was recomputed. For `G = ℤ₂`, multiplication by 3 gives the coordinates `(3 mod 8, 3 mod 4)`, which are compatible. The pair `(3 mod 8, id mod 4)` is not compatible, since 3 mod 8 reduces to 3 mod 4 and `3 ≢ 1 (mod 4)`. Both coordinates act trivially on `ℤ₂/2ℤ₂`.

## H03 (CBirkbeck) — answered

Correct at this head. `Suggested.lean` has 105 `theorem`s and no admitted declaration (the single occurrence of `sorry` is in prose), so it is a certificate of library facts, not an acceptance test. Examples:
- `zpowHat_zero` (line 302) is `TauCeti.zpowHat_zero x`.
- `ContinuousAut.mul_apply` (line 449) is `rfl`.
- `closedLowerCentralSeries_succ` (line 739) duplicates pinned `TauCeti.closedLowerCentralSeries_succ` (`TauCeti/Topology/Algebra/Group/LowerCentralSeries/Closed.lean:89`).
- `exists_heisenberg_detect` (line 965) duplicates pinned `TauCeti.freeProP.exists_heisenberg_detect` (`TauCeti/Topology/Algebra/Group/Profinite/Free/LowerCentralSeries.lean:93`).

Every Layer 0–3 headline is already a pinned Tau Ceti theorem, which is why main archived the roadmap. Stripping this file would leave an acceptance test with nothing left to prove. That is a further reason (H01) not to keep an active copy, rather than a repair to make here.

## H04 (CBirkbeck) — answered

Correct at this head. `README.md` has no `**Checks.**` lists, no `### Examples` or `### Dependencies` closing any layer, no `**Summary.**` opening and no `## Downstream consumers` heading (section headings at lines 34, 96, 130, 181, 187, 298, 395, 556, 706, 717, 732, 782).

Not applied, because the folder should not merge (H01). The suggested Checks were recomputed and are right:
- `ω₂ ≡ 1 (mod 4)` and `ω₂ ≡ 0 (mod 3)`.
- `ω₂ ≡ 3 (mod 6)` (1 mod 2 and 0 mod 3).
- In the Heisenberg group with `(a,b,c)(a',b',c') = (a+a', b+b', c+c'+ab')` and the commutator `xyx⁻¹y⁻¹`, `A = (1,0,0)` and `B = (0,1,0)` give `AB = (1,1,1)`, `(BA)⁻¹ = (−1,−1,1)`, so `[A,B] = (0,0,1)`, `[B,A] = (0,0,−1)` and `[A,A] = 1`.

## H05 (CBirkbeck) — answered

Correct at this head. The Labute reference (README line 698) and the Lazard reference (line 796) give no theorem or page locator. The roadmap has no `sources.toml`.

Not applied (H01). Lazard's text was not read in this job, so the proposed locator "Chapter I §2, Theorem (2.1), p. 110" remains unverified here. It must be checked against the text before it goes into any surviving copy. The finite-sum spanning theorem is pinned as `TauCeti.exists_sum_gradedBracket_eq_of_range` (`TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/ClosedSpan.lean:113`, per the review; this job did not reopen it).

## Adversarial pass

No statement was added or changed. The only computations in this job are the reviewer's witnesses, recomputed above:

| Statement | Instance | Values | Result |
|---|---|---|---|
| Compatible-family condition `q_NM ∘ α_N = α_M ∘ q_NM` | `G = ℤ₂`, `N = 8ℤ₂ ≤ M = 4ℤ₂` | `×3`: 3 mod 8 ↦ 3 mod 4 = `α_M` ✓; `(×3, id)`: 3 ≠ 1 mod 4 ✗ | condition separates them |
| Idempotent `ω₂` | mod 4, 3, 6 | 1, 0, 3 | distinguishes `0`, `1`, `ω₃` (`ω₃ ≡ 4 mod 6`) |
| Commutator sign `xyx⁻¹y⁻¹` | Heisenberg `A`, `B` over ℤ₂ | `[A,B] = (0,0,1)`, `[B,A] = (0,0,−1)` | sign fixed |

The `#check @name` signature probe was not run, because no declaration changed; the gate's `dropped=0` covers the existing file.

## Ownership against open work

Nothing new is stated, so there is no new ownership claim. The owner of every object in this folder is `Completed/ProfiniteArithmetic` on main, together with its implementation in pinned Tau Ceti.

## Build and gate (unchanged head `a0a63ba`)

- `lake build TauCetiRoadmap.ProfiniteArithmetic.Suggested`: `Build completed successfully (9101 jobs).`
- Gate: `gate ProfiniteArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The gate does not detect that main has archived this folder (H01).
- Depcheck: `depcheck: 162 roadmaps, 1151 edges, 0 problem(s)`. No UPWARD or CYCLE line.

No commit was made, since nothing changed.
