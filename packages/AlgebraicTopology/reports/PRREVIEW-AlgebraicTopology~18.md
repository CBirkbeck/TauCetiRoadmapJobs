# Review of AlgebraicTopology (pull request #1663 at 08deda5)

**Verdict:** accepted

Incremental re-review of the 17 lines changed since 548b721, all in `TauCetiRoadmap/AlgebraicTopology/README.md` (`Suggested.lean` is byte-identical to the head the previous review read). Both P3 findings of the previous review are repaired in the shape it asked for, the repairs introduce nothing new, no file outside the folder changed, the gate passes, the dependency check prints no UPWARD or CYCLE line, the Lean file elaborates with `sorry` as its only warning and no sorried statement closes by one tactic. No finding remains; this roadmap folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: lines 71–75 now read "TangentialBordism B1.6 states the corner-source extension of these two statements (facewise transversality) by the same route (Euclidean embedding of the target and GeometricTopology Layer 1's tubular retraction) and consumes nothing here", and lines 2384–2387 say the same of the two 8.13 targets. Checked against TangentialBordism at its open head (`TauCetiRoadmap/TangentialBordism/README.md`): §2.1 (B1.6, lines 225–284) states relative Whitney approximation for a source with corners ("the corner extension is constructed here") and relative facewise transversality approximation "using the finite-dimensional linear parameter family of a Euclidean embedding of N composed with GeometricTopology Layer 1's tubular retraction", citing Lee 6.26, 6.35, 6.36 and DifferentialGeometry 10.2 only; no line of that README cites 8.13 (grep of "8.13": no match), and its supplier row (line 138) consumes this roadmap's Stages 2–4, 6 and 8 for chains, duality and EM carriers while saying B1.6 owns relative transversality and relative Whitney approximation. On this side, 8.13's own route (README lines 2397–2413 and 2432–2439) is the Euclidean embedding of the compact target by `exists_embedding_euclidean_of_compact` followed by GeometricTopology Layer 1's tubular retraction, so "the same route" is accurate in both directions. The only two mentions of TangentialBordism in the README are these two passages (grep).
- R02 — repaired: line 2215 reads "Milnor 1959, Theorem 3 (both its assertions: the space `A^C` and the n-ad) for n-ads" and the reference entry at line 2769 reads "Section 2 and Theorem 3 (both its assertions: the space `A^C` and the n-ad)". Checked against `milnor1959` lines 209–212: Theorem 3 asserts, for `A` in `W_n` and `C` a compact n-ad, that `A^C` belongs to `W` and that the n-ad of relative function spaces belongs to `W_n`; its Section 2 begins at line 100 ("The class W_n") and contains Theorem 3. No "Theorem 4" or "Theorems 3–4" remains in `README.md` or `Suggested.lean` (grep: the only "Theorem 4" hits are Hatcher's Theorem 4.5 and 4.8). `Suggested.lean` line 634 and README line 2253 still cite Theorem 3 alone, consistently.

## Verified sound

**Scope.** The diff since 548b721 (`changes.md`: 11 insertions, 6 deletions, four hunks, all read in context at lines 64–78, 2210–2224, 2378–2392 and 2766–2769), everything that cites or is cited by the changed passages (TangentialBordism §2.1 and its supplier table at its open head; 8.13's own route; 8.11a's uses of Milnor Theorem 3 at lines 2215 and 2253 and `Suggested.lean` line 634), and the folder listing (`README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`; no stray file). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty. `git diff --stat 548b721 HEAD` lists only `README.md`.

**Principles.** The changed lines add no target, no supplier citation, no `*Needs:*` line, no copied passage, no process word, no pull-request number and no path; they cite TangentialBordism and GeometricTopology by roadmap name and section. `Suggested.lean` is unchanged: module-system header, `sorry` only in theorems, no `set_option`, no `lemma`.

**Gate and dependency check.** Worker's gate at 08deda5 (`gate.md`): every check passed (`depcheck=0 … build=0 OK`). My run of the dependency check at this head:

```
depcheck: 224 roadmaps, 2101 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

**Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the worktree: exit 0 in 24 s; the output is exactly 22 `declaration uses sorry` warnings (lines 98, 108, 127, 187, 196, 211, 245, 277, 351, 403, 444, 456, 483, 516, 531, 547, 563, 592, 623, 638, 651, 670) and the 9 `#check` outputs, 55 lines in all, nothing else. The file is byte-identical to 548b721, so the previous review's `#check @` pass over all 55 declarations (every README hypothesis present in the elaborated type) stands; the worker's `signatures.md` for this head lists the same 55 declarations with 0 lost binders.

**One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | rfl | (simp_all; done) | infer_instance | trivial | (aesop; done) | sorry` (22 substitutions): exit 0 in 37 s, all 22 declarations still report `sorry`, the only other output the unused-tactic linter. Nothing in the file is padding: every definition is used by a stated theorem, no declaration restates a definition, mirrors a Check or computes a value (unchanged from the previous review).

**Headline coverage.** Unchanged since the previous review: every headline statable at the pins is stated (Brouwer, cellular comparison, pair/quotient comparison, cofibration theorems, transfer, compact-support classes, Poincaré duality, cup-length bound, product-ball intersection, Euler-characteristic invariance, finite CW type, relative CW connectivity, Whitehead and homological Whitehead, nerve K(G,1), proper deformation retraction, mapping-space CW type, transverse circle classifying map, Smith non-freeness), and the module docstring names the ones that are not (Cartan–Leray, Serre and Wang sequences, Künneth with Tor, twisted Poincaré–Lefschetz, Hurewicz, Milnor sequence, representability and the EM loop comparison, obstruction cochains) with the missing carrier.

**Sources: the seeded sample where it falls in the changed passages.** The changed passages carry one source citation, Milnor 1959 (README 2215 and 2769), which the previous sample drew as items 11 and 15. Verified at `milnor1959` line 209 (printed p. 276): Theorem 3, `A ∈ W_n`, `C` a compact n-ad, `A^C ∈ W`, and the n-ad `(A^C; (A,A₁)^{(C,C₁)}, …)` in `W_n` (lines 210–212); Corollary 3 (line 218) is the loop-space case the README's "based-loop CW type" uses. The TangentialBordism passage cites no source. The remaining 13 sampled targets are in unchanged text and stand as verified in the previous report.

**Cross-roadmap citations resolved at this head.** TangentialBordism §2.1 (B1.6) and its supplier table at its open head (R01 above); GeometricTopology Layer 1 tubular neighbourhoods on main (cited by both the 8.13 route and the new sentence; unchanged citation). The worker's `roadmaps resolve` lists no unresolved citation and no unresolved Lean name for this README.

**Ownership against open work.** The repair settles the one duplication the previous review recorded: this roadmap states the boundaryless-source smoothing and relative transversality for a compact target, TangentialBordism B1.6 at its open head states the corner-source extension by the same route, and the README now says exactly that rather than naming B1.6 a consumer. Neither statement is owned by a roadmap on main. No other object changed.

**Adversarial table.** Rows for the untouched statements carry forward from the previous report (pull request #1663 at 548b721, table under *Verified sound*), whose values I recomputed where the changed text touches them; the last two rows are new.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Stage 1 item 6 Checks | unit circle, one-point monoid, wedge of circles | previous report | hold (carried forward) |
| `brouwerFixedPoint_compactConvex`, `…_finiteSpan` | point, `[0,1]`, `(0,1)`, `S¹`, `ℓ²` | previous report | hold (carried forward) |
| `isIso_…_arbitraryDimension`, `ordinaryPairQuotientComparison` | `S²`, `RP^∞`, `D³`; `B = ∅`, `(D¹,S⁰)` | previous report | hold (carried forward) |
| cofibration theorems (`closedCofibrationCylinderHomotopyExtension`, `homotopyInversePairExtension_left`) | `A = ∅`, `A = X`, `e = id` | previous report | hold (carried forward) |
| `finiteCover_transfer_exists`, `regularCover_push_transfer` | `B = ∅`, identity cover, `B ⊔ B → B` | previous report | hold (carried forward) |
| `compactSupportTopClass_existsUnique`, `poincareDuality_of_fundamentalClass`, `FundamentalClassDatum`, `capProduct` | `K = ∅`, `S²`, `RP²` over `ℤ` and `F₂`, `R = 0`, `p ≤ q` | previous report | hold (carried forward) |
| `lsCupLength_add_one_le_categoryCount` | point, `S¹`, `T²`, `R = 0`, `X = ∅` | previous report | holds (carried forward) |
| `productBallImages_intersect` and the 6.5 boundary-degree form | `p = q = 0`, `(1,0)`, `(1,1)`, constants | previous report | hold (carried forward) |
| `finiteCWEulerCharacteristic_eq_of_homotopyEquiv`, `compactManifoldFiniteCWType` | `S²` two structures, `S¹`, `∅`, infinite discrete | previous report | hold (carried forward) |
| `relativeCWConnectivityOfCellDimension`, `whitehead_homotopyEquiv`, `homologicalWhitehead` | `λ ≤ 1`, `(D^λ,S^{λ−1})`, Warsaw circle, `S²∨S⁴` vs `CP²`, acyclic complex | previous report | hold (carried forward) |
| `groupClassifyingSpace_isEMOne`, `properStrongDeformationRetract_of_inverse` | trivial `G`, `ℤ`, `S₃`; `A = X`, `A = ∅`, `(ℝ,{0})` | previous report | hold (carried forward) |
| `exists_transverse_circle_classifying_map`, `elementaryAbelianPair_sphere_action_has_stabilizer`, 8.5 `H₂` and `π₁`-actions, 8.15 dimensions, Stage 4 item 8 Checks | previous report | previous report | hold (carried forward) |
| 8.13 smoothing and transversality, general route (text unchanged; consumer sentence changed) | `f` smooth with `A = M`; `P = Circle`, `f ≡ 1`; `P` a point; `β(x) = 0`; `Z = {1}`, `β = 1` | `g = f`; any smooth `g ≃ f` has degree 0; `V = ℝ⁰`, `W = V`, `infDist(·,∅) = 0`, the `ε = 1` branch needed; `dF = df_x`; `F(x,s) = (1+s)/|1+s| = 1` iff `s` real, a null set | hold; the route on this side is embedding `e : P → V` plus retraction `r : W → P`, the route TangentialBordism B1.6 names for the corner source, so the new sentence is accurate |
| `finiteSourceMappingCWType` against Milnor Theorem 3 (attribution changed) | `n = 1`, `C = X` compact Hausdorff, `A = Y`: first assertion; `n = 2`, `C = (I; ∂I)`, `A = (Y, y₀)`: second assertion gives `(ΩY, ω₀) ∈ W₂` (Corollary 3); `C = ∅`; `C` a point; `X = ℕ` discrete | `C(X,Y) ∈ W` is Theorem 3's first assertion with Hausdorff added on both sides (a specialisation, as the README says); the based-loop CW type of 8.11a is the second assertion; `Y^∅ = pt ∈ W`; `Y^{pt} = Y ∈ W`; `(S¹)^ℕ` compact with `π₁ = ℤ^ℕ`, not of CW type, so compactness of `C` is needed and present | holds; both assertions are in Theorem 3, no Theorem 4 exists |

**Declared gaps.** None (no readable `design/plan.json`; a revision of a main roadmap declares none).

## Not verifiable

- Thom 1954, Chapter II (8.13 representability): recorded `uncertified`, cited by locator, outside the changed passages.
- Lee 2012, Theorems 6.26, 6.35, 6.36 (8.13 and, at its open head, TangentialBordism B1.6): recorded `uncertified`, cited by locator; the route is checked against the pinned Mathlib declarations instead (table row "8.13 … general route").

## Source issues

- none
