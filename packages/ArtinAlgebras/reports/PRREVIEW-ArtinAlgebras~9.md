# Review of ArtinAlgebras (pull request #2190 at 3662cec)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P3) — The rewritten §3.3 uniqueness target has no locator

**Location:** `README.md:786–788`: “the target is the same uniqueness, at either end, for conflations of an exact category, which need not be balanced.”

**Claim:** this sentence is new text, and it states a target with neither a locator nor the “not located” marker that README:145–146 requires.

**Witness:** inp lines 733–737: [INP, Prop. 2.6(1)–(2), p. 11] states uniqueness of almost-split extensions with a fixed right end and with a fixed left end, in an extriangulated category. Exact categories are an instance by [INP, Example 1.14].

**Repair:** end the sentence: “… which need not be balanced ([INP, Prop. 2.6(1)–(2), p. 11], for extriangulated categories; each part is printed under only one of (AS1), (AS2), but its proof uses both, and an almost-split conflation satisfies both).” Add “Prop. 2.6(1)–(2), p. 11 (uniqueness of almost-split extensions)” to the [INP] entry (README:1421–1427).

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~8.md`.

- R01 — repaired: README:886–900 now read “Over every ring Tau Ceti supplies the transpose half: `Tr M` does not depend on the minimal presentation …”, citing all four names. They are also in “From Tau Ceti” (244–252) and in the §4.1 *Needs:*.
- R02 — repaired: §3.3 (782–788), §4.3 (970–971, 981–984), the §5.3 *Needs:* (1081–1084) and “From Tau Ceti” (174–186) take the proposed text verbatim.
- R03 — repaired: README:289 reads “None.”, and Scope (66–69, 82), §2.1, the Layer 2 and Layer 7 dependencies, §7.2 and the Matlis reference no longer consume DerivedModuleAlgebra or PurityOfBranchLocus.
- R04 — repaired: `TauCetiRoadmap/RepresentationTheory/README.md:103–107` reads “… with the field case as its case `R = k`. Both consume Tau Ceti's Krull-Schmidt theorem and radical.”
- R05 — repaired: locators added in 0.4 (386–387), 1.1 (528), 3.1 (740–743) and 5.1 (1019), and 4.3 is marked unlocated (984–985). They carry no page numbers. 1.1 cites [INP, §4.1], which is correct (inp lines 1218–1228, p. 20).
- R06 — repaired: `Suggested.lean:12` ends “: target signatures”; `Suggested.lean:160` reads “Layer 4: Auslander-Reiten theory of Artin algebras”.
- R07 — repaired: the third-commit paragraph names the six dropped suppliers, the change of downstream consumer and the family-index update. The fourth-commit paragraph matches this head.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4 summand decomposition, [Kr, Prop. 4.1(2)] | `X = 0`; `ℤ/2 ⊞ ℤ/4` over `ℤ/4`; one-object `k×k` | empty family; `End` of order 32, two projections, corners `𝔽₂`, `ℤ/4` local; corners `k` | true; Kr 4.1(2) (kr lines 402–406) is the semiperfect ring form | none |
| §1.1 `mod C`, [INP, §4.1] | `(−,Y)`; `0` | `A = Y`, `B = 0`; `A = B = 0`; INP's `D(−,B) → D(−,A) → F → 0` (lines 1226–1228) | same definition | none |
| §3.1 long exact sequences, [INP, Fact 1.20] | `ℤ/2 ↪ ℤ/4 ↠ ℤ/2`, `W = ℤ/2`, over `ℤ` | all six terms `ℤ/2`; maps: injective, `0`, iso, `0`, iso; Fact 1.20 omits only exactness at `Hom(W,X)` | true; the stated exception is the only missing position | none |
| §3.3 end terms | `ℤ/2 → ℤ/4 → ℤ/2` in `mod ℤ/4` | `End ℤ/2 = 𝔽₂`, local and indecomposable; pin needs only `Preadditive`, `HasBinaryBiproducts` | true | none |
| §3.3 uniqueness target | `proj ℤ`; `k[x]/(x³)`, `C = k ⊕ k[x]/(x²)` | `2 : ℤ → ℤ` is mono and epi but not iso; INP 2.6(1) with (AS1) alone gives `A = k ≇ A' = k[x]/(x²)` | target true; unlocated; the source's hypotheses are misprinted | R01 |
| §4.1 transpose half | `ℤ/p²`, `M = ℤ/p`; `M = A` | `Tr = ℤ/p`: nonzero, not projective, indecomposable; `Tr = 0`, projective | agrees with the pinned hypotheses (`Module.Finite P₁`, superfluous kernel, finite length) | none |
| §4.3 uniqueness and criterion | `FGModuleCat A`, `A` Noetherian; `ℤ/p²`, `M = ℤ/p` | `Balanced` and `Abelian` inferred at the pin; `ℤ/p² → ℤ/p` is `id ≫ g`, `X' = 0` | true | none |
| §5.1 valuation against [INP, Def. 3.11(2)] | ℝ–ℂ triangular algebra, `P₁ → P₂` | `Irr = ℂ`: `a = dim_ℂ = 1`, `b = dim_ℝ = 2`; INP `d = 2`, `d' = 1` | `(d, d') = (b, a)` | none |
| §5.3 radical quotients | `ℤ/p → ℤ/p² → ℤ/p`; `W = ℤ/p²`, `ℤ/p` | `Hom(W,Y)/rad`: `𝔽_p`, `0`; `Irr(W, ℤ/p)`: `𝔽_p`, `0`; multiplicities 1, 0 | true | none |
| §2.1 `E_R`, now without DerivedModuleAlgebra | `ℤ/p²`; `k[x,y]/(x,y)²` | `E = R`, length 2; length 3, socle of `R` of dimension 2 | the pinned hulls and Matlis duality suffice | none |
| §7.2, now without PurityOfBranchLocus | zero ring; `ℤ` | `⊥ = ⊥`; left and right global dimension both 1 | uses only `TauCeti.globalDimension` | none |
| Family index 103–107 | QuiverRepresentations on main | README:47–56: Tau Ceti Auslander-Reiten theory over a field; 188, 481–495: Tau Ceti Krull–Schmidt; 336: Tau Ceti radical | true | none |

Rows for untouched statements stand as in the previous review, of `beb9482`.

- Source locators checked against the text: 7 (inp: Example 1.14, Fact 1.20(1)–(3), §4.1, Def. 3.11(2), Prop. 2.6, Thm. 2.9 with Prop. 2.10; kr: Prop. 4.1(2)).
- Library at the pin, 13 declarations opened. `AuslanderReiten/Transpose.lean:557, 578`, `ProjectiveSummand.lean:105`, `Indecomposable.lean:111`. `AlmostSplit/Basic.lean:480, 518, 593, 606`, `Uniqueness.lean:138`, `Components.lean:68`, `RadicalQuotient.lean:119, 171`. `MatlisDuality/FiniteLength.lean:155`. Each has the hypotheses the README states.
- `#check @` of all 25 declarations on a scratch copy: the types are those of `beb9482` and match the README. The diff changes only the docstring title and one section comment, so the earlier one-tactic probe (0 of 19 closed) stands.
- Gate: the worker's gate at 3662cec passes. A hand run reports every check 0 except `outside-folder`, for the family index, which is this pull request's own file. `lake env lean Suggested.lean`: 19 `sorry` warnings and nothing else. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Citations: no *Needs:* or Dependencies line names another roadmap, so “From other roadmaps: None.” is consistent. Three-way merge of the family index with the heads of #1146, #1220, #1775 and #1047: 0 conflicts.
- Seeded sample: 1.1, 2.1, 3.3 and 5.1 fall in changed passages (rows above). The other eleven are untouched and stand as of `beb9482`.
- Overlap check: read QuiverRepresentations (main) and the family index RepresentationTheory (main, #1146, #1220, #1775, #1047); GrothendieckEulerForms and GeneralAlgebraicKTheory are as in the previous review. Nothing is shared: the newly cited objects are owned by Tau Ceti.
- Remark: §2.1 `E_R` has no source locator (untouched text, passed by the previous review).

## Not verifiable

- ars: printed book with no legal copy. The cited §4.1 Prop. IV.1.10(f) and §4.3 Thm. V.1.15 remain unchecked.
- ass, kr03, au78, mu: as in the previous review (printed, paywalled, or marked unread in the README).
- Nakaoka–Palu, Example 2.13 (cited inside [INP, Example 1.14]): marked “not read here” in the README; not fetched this round.

## Source issues

- **Error** in inp at Prop. 2.6(1)–(2), p. 11: the source assumes only (AS1) in part (1) and only (AS2) in part (2). It should assume both, i.e. almost-split extensions, since its proof uses (AS1) and Prop. 2.5. Pullbacks along split epimorphisms refute (1) as printed. Affects nothing.
- **Misprint** in inp at §2.1, p. 11: the source spells “extriangulated” as “extraingulated” (inp line 728); it should be “extriangulated”; affects nothing.
