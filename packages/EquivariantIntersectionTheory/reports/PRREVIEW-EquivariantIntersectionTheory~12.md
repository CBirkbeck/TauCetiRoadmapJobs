# Review of EquivariantIntersectionTheory (pull request #1685 at ca06895)

**Verdict:** accepted

This is an incremental re-review of the 0 lines changed in `TauCetiRoadmap/EquivariantIntersectionTheory/`
since `9014e96`. The head `ca06895` is a merge of main (`14cf659`) into the branch (parents
`f8788a7`, `14cf659`). `README.md`, `Suggested.lean` and `metadata.toml` are byte-identical to
`9014e96`. `git diff --stat origin/main...HEAD` outside the folder is empty, so every file the change
set lists outside the folder comes from main, not from the pull request. No finding remains. The
previous report's only finding was about the board's sources manifest, not about the folder; it is
accounted for below.

## Previous findings

- R01 — not repaired: `packages/EquivariantIntersectionTheory/sources.toml` still has seven keys
  (`eg1998`, `brion2015`, `fo2010`, `totaro1999`, `hua2026`, `kklv1989`, `mfk1994`) and no
  `fulton1998`. The README records the work at line 420 and in lines 621–622.

  This item is not written again as a finding of this report, for three reasons.
  1. The manifest is a board file, not a file of the pull request. No head of this branch can
     change it, and this review edits no manifest. The previous report itself said that "the branch
     needs no new commit". A finding's repair must be a change the author makes, and here the
     author has none to make.
  2. The folder already records the work in full: the locator "Theorem 3.3 (a)" at line 420, and the
     edition, series, year, theorem and appendix at lines 621–622.
  3. The same manifest also lacks five other works that the References cite (Vistoli 1998, Romagny
     2005, Mumford 1965, Arsie–Vistoli 2004, Edidin–Hu 2025), and every earlier review passed
     them. The Fulton record is the same bookkeeping. Recording a paywalled Springer book as
     `uncertified` changes nothing that can be verified.

  The record is the worker's to make (remark under `## Verified sound`).

## Verified sound

**Gate, build, direction, folder.**

- The gate at `ca06895`, run with `--base origin/main`, the candidate merge order and the targeted
  build:

```
gate EquivariantIntersectionTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

  Without the order file, the only non-zero entry is `depcheck: NOT IN ORDER:
  EquivariantIntersectionTheory (insert it after its last supplier)`. That is the placement of a
  roadmap the public order does not list yet, not a defect. The worker's own gate run on this head
  also passes every check.
- The dependency check, run with `--movable` against the candidate order (this roadmap is at line
  397 of 397):

```
depcheck: 239 roadmaps, 2351 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.AG"`) and
  nothing else.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EquivariantIntersectionTheory/Suggested.lean`
at the pins gives nine `declaration uses sorry` warnings (lines 64, 71, 78, 86, 101, 113, 121, 149,
155), no error and no other warning. `git diff 1650b0a HEAD -- Suggested.lean` is empty, so three
audits from the review of `1650b0a` still apply: the `#check @` audit, the padding audit and the
one-tactic probe. The worker's `signatures.md` for this head lists the same fifteen elaborated types.
I compared them with the README statements, and none has lost a binder:
- `isUnit_laurentPolynomial_iff` keeps `[IsDomain S]`;
- `exists_isUnit_mem_of_connected` keeps the hypothesis that the only idempotents are `0` and `1`;
- `homogeneousUnitDegrees_away_prime` keeps `hf` and `Prime f`;
- `depressedDiscr_mem` keeps `2 ≤ m`;
- `depressedDiscr_prime` keeps `[CharZero K]` and `2 ≤ m`.

**Citations re-resolved.** Main has moved from `829d715` to `94294cd` since the previous review.
- SchemeAndStackFoundations, README on main `94294cd`: every section this README cites exists
  under the cited number and title.

  | Section | Line |
  | --- | --- |
  | §1.13 group algebraic spaces and actions | 2418 |
  | §1.15 torsors | 2502 |
  | §1.21 quotient stacks | 2951 |
  | §1.22 quasi-coherent modules on stacks | 2989 |
  | §2.23 equivariant sheaf cohomology | 4558 |
  | §3.4 Picard groups | 4789 |
  | §4.15 stable pointed curves | 5725 |
  | §5.1 Chow groups | 6567 |
  | §5.2 pushforward, flat pullback, localisation | 6653 |
  | §5.3 first Chern class | 6701 |
  | §5.4 projective bundles | 6721 |
  | §5.5 normal cones and Gysin maps | 6768 |
  | §5.6 intersection products | 6921 |
- The resolver flagged three names, all cited at README lines 101–105. Each is a name that
  SchemeAndStackFoundations plans, and it is cited as such:
  - `GroupSpace.ofGroupScheme` (that README, lines 2427 and 2524);
  - `actionQuotient.torsorEquiv` (line 2965);
  - `StableCurves.Mbar` (line 5727).
- AlgebraicVectorBundles L2A is at its README line 306, with the affine graded-ring interface at
  line 317.
- SchubertGeometry S3 is at its README line 46.
- At the Tau Ceti pin, `def LineBundleClass` is at `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`.
- `## Downstream consumers` (line 598) still holds: no file under `TauCetiRoadmap/` or `Completed/`
  on main `94294cd` mentions this roadmap.
- `scratch/overlaps.md` reports:
  - no other open pull request changes this roadmap;
  - no cited id that an open pull request drops or that only a revision defines;
  - the five SchemeAndStackFoundations revisions as the closest roadmaps in vocabulary (0.08–0.09).

  The scope table settles ownership against those revisions by citation, and the merge of main
  adds no object.

**Seeded sample.** None of the fifteen sampled targets (0.1, 0.3, 0.4, 1.1–1.4, 2.1–2.4, 3.1–3.4)
lies in a changed passage, because nothing changed. Their locator checks stand from the reviews of
`1650b0a`, `03f0a93`, `f62b21a` and `493bc96`. I read three of them again at this head against the
cached texts:
- 3.2, README lines 517–519, against `fo2010` lines 44–48: Theorem 1.1 makes
  `ℤ/12 × Pic(𝔸¹_S) → Pic(M_{1,1,S})` an isomorphism when `S` is a `ℤ[1/2]`-scheme or reduced. The
  README quotes exactly these two conditions.
- 1.3, README lines 318–320, against `brion2015` lines 112 and 253–254: `G` is connected throughout
  the paper, and Proposition 2.10 assumes `X` reduced and ends its sequence in
  `Pic(G × X)/p₂^* Pic(X)`. The README matches.
- 2.1, README line 386, against `totaro1999` lines 143–153: Theorem 1.1 (independence of `(V, S)`
  in degrees below the codimension of `S`) and Definition 1.2. The README matches.

**Remark on untouched text (no change asked of the author).** The board manifest has no record for
six works the README cites:
- Fulton 1998: `uncertified`, doi `10.1007/978-1-4612-1700-8`, Theorem 3.3 (a), cited for 2.2;
- Arsie–Vistoli 2004: arXiv `math/0301008`, cited for 3.3;
- Edidin–Hu 2025: arXiv `2208.00556`, cited for 3.3;
- Vistoli 1998;
- Romagny 2005;
- Mumford 1965.

The worker can record them; the folder needs nothing.

**Adversarial table.** No statement changed. The rows carry forward the reviews of `1650b0a` (r6)
through `9014e96` (r10); r6's two changes were repaired by `f62b21a`. The last three rows were
recomputed at this head from the cached sources.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `homogeneousUnitDegrees`, `mem_homogeneousUnitDegrees_iff` (r6) | trivial grading; zero ring; `k[t, t⁻¹]` with `deg t = 1`, `2` | `⊥`; `⊤` (`0 = 1 ∈ 𝒜 d`); `⊤`; `2ℤ`, `ShiftClassGroup = ℤ/2` | true | none |
| 0.1 `eq_map_mulLeft_of_isUnit_mem` (r6) | `u ∈ ℳ c`, `x ∈ ℳ n`; zero ring | `u⁻¹x = Σ a_d`, uniqueness kills `d ≠ n − c`; `⊤ = ⊤` | true | none |
| 0.2 `isUnit_laurentPolynomial_iff` (r6) | domain; `k[ε]/ε²`, `1 + εt` | monomial units only; `(1 + εt)(1 − εt) = 1`, not a monomial: `IsDomain` needed and present | true | none |
| 0.2 `exists_isUnit_mem_of_connected` (r6) | connected `A`; `k × k`; zero ring | one `m_e ∉ p` for each prime `p`, the `D(m_e)` give a disjoint cover, one of them is `Spec A`; `A = k × k`, trivial `𝒜`, `ℳ 0 = k × 0`, `ℳ 1 = 0 × k`: no unit in any `ℳ c`, so the hypothesis is needed | true | none |
| 0.3 `awayGrading`, `awayGrading_isInternal` (r6) | `f = 1`; `f = 0`; `f = t ∈ k[t]` | `𝒜` back; zero ring; `1/t` of degree `−1` | grading with negative degrees | none |
| 0.4 `homogeneousUnitDegrees_weighted` (r6) | `w = 1, 0, < 0`; `σ = ∅` | units `K^*` of degree `0`: `⊥` | true | none (r6's Check wording repaired at `03f0a93`) |
| 0.4 `homogeneousUnitDegrees_away_prime` (r6) | `f = x` with `w = 1`, `2`, `0`; `f = x²`; `f = xy` with weights `2, 3` | `ℤ`, `2ℤ`, `⊥`; `ℤ ≠ 2ℤ`, excluded by `Prime f`; `ℤ` | true | none |
| 0.5 `depressedDiscr_mem`, `depressedDiscr_prime` (r6) | `m = 2, 3`; char `0, 2, 3` | `−4a₂`, weight `2`; `−4a₂³ − 27a₃²`, weight `6`; `0` in char 2 (`m = 2`) and `−a₂³` in char 3 (`m = 3`), neither prime: `CharZero` needed and present | true | none |
| 1.1–1.4 (r6) | `G = 1`; `𝔾_m` on a point; `ℤ/2`; `Aff` on `𝔸¹`; `𝔾_a` acting by `x + bᵖ` | `Pic^1 = Pic`; `Pic^{𝔾_m}(pt) = ℤ`; `{±1}`; `[𝔸¹/Aff] = B𝔾_m`, `Pic = ℤ`; stabilisers `α_p` | Checks correct | none |
| 2.1–2.4 (r6, r8, r9) | `𝔾_m` on `𝔸^l`; `[𝔾_m/𝔾_m] = pt`; `GL₂`, `GL₃`; `μ_n` | `A_{i+l−1}(ℙ^{l−1}) = ℤ`; shift `1`; `ℤ[t₁, t₂]` free of rank `2` over `ℤ[c₁, c₂]`; `ℤ[t]/(n t)`; 2.2 on `ℙ¹ × ℙ¹ ∖ Δ`: `CH_1 = ℤ`, `CH_0 = 0` | consistent | none |
| 3.1–3.4 (r6, r8) | weights `(4, 6)`; `g = 2, 3`; `n = 3, 4, 5, 6` | `ℤ/e`; `ℤ/12`; `10`, `28`; `ℤ/2, ℤ/6, ℤ/12, ℤ/20`; `ℤ/6 → ℤ/12` is `d ↦ 2d`; `2g(2g + 1) = 20 = (n − 1)(n − 2)` | correct | none (r6's 3.4 R01 repaired at `f62b21a`) |
| References, Fulton 1998 (r10) | Theorem 3.3 (a), B.5 | `p^* : A_{k−r}(X) ≅ A_k(E)` via `ℙ(E ⊕ 1)` | matches line 420 | none (manifest: remark) |
| 3.2 locator (this head) | `fo2010` Theorem 1.1, `S = Spec k` | conditions "`ℤ[1/2]`-scheme or reduced" in both; `Pic(𝔸¹_k) = 0`, so `Pic M_{1,1} = ℤ/12` | matches | none |
| 1.3 locator (this head) | `brion2015` Proposition 2.10 | `X` reduced, `G` connected (line 112); target `Pic(G × X)/p₂^* Pic(X)` in both | matches | none |
| 2.1 locator (this head) | `totaro1999` Theorem 1.1, Definition 1.2 | `CH^i BG = CH^i((V − S)/G)` for `codim S > i` in both | matches | none |

**Counts.**

| What | Number |
| --- | --- |
| Changed lines in the folder / outside it | 0 / 0 |
| Lean declarations (types compared with the README) | 15 |
| `sorry` warnings | 9 |
| SchemeAndStackFoundations sections re-resolved on main | 13 |
| Other supplier citations re-resolved (AlgebraicVectorBundles L2A, SchubertGeometry S3, Tau Ceti `LineBundleClass`) | 3 |
| Resolver leads checked | 3 |
| Seeded-sample locators re-read at this head | 3 of 15 |
| Carried / recomputed table rows | 12 / 3 |

## Not verifiable

None of the following can be read legally, and the diff touches none of them:
- Fulton, *Intersection Theory* (1998), Theorem 3.3 (a) and Appendix B.5 (2.2). This is a paywalled
  Springer book. I checked it by its standard numbering and through Stacks Lemma 42.36.3 (02TY).
- Mumford–Fogarty–Kirwan, Chapter 1, §3 (1.1).
- Knop–Kraft–Luna–Vust 1989, Lemma 2.2 and Proposition 2.3 (1.3).
- Edidin–Graham, published numbering, Proposition 18 (2.4).
- Mumford 1965 (3.2).

## Source issues

- none
