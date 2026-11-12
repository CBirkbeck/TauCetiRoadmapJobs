# Review of GrothendieckUniverses (pull request #1783 at 7282328)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description now opens "Defines Grothendieck universes in Mathlib's model `ZFSet.{u}` of ZFC …". The draft line is gone, and GitHub reports `isDraft: false` at head 7282328.

## Verified sound

The folder did not change, so the rows below test the description's claims, one per headline, against the head. Values marked † were also elaborated as proved `example`s in a scratch file at the pins.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description "`V_ω` and `V_κ` … are universes" vs 1.1 `isGrothendieckUniverse_vonNeumann`, `…_omega0` | UA4 in `V_ ω` with `I = V_ 2`, `f = ![V_ 1, V_ 3]`; `κ = ℵ₀` | `⋃ f = V_ 3`, of rank 3 < ω, so in `V_ ω`. `¬ IsInaccessible ℵ₀`†, so `V_ ω` needs its own theorem. `card (V_ κ.ord) = κ`† | true | none |
| Description "every universe is one of these" vs 1.2 `isGrothendieckUniverse_iff` | `U = V_ 3`; `U = ∅` | `V_ 3`: `card = 4`†; UA2 fails (`P(V_ 2) = V_ 3 ∉ V_ 3`); `4 ≠ ℵ₀ = card (V_ ω)`† and `κ.ord = 3` is impossible. `∅`: UA5 fails; `κ.ord = 0` forces `κ = 0`. Both sides false | true | none |
| Description "containing `ω` ⇒ inaccessible cardinality, equals `V_κ`" vs 1.3 `isInaccessible_card`, `eq_vonNeumann_card` | `V_ ω`; `V_ κ.ord`, `κ` inaccessible | `V_ ω`: `card = ℵ₀`†, not inaccessible†, `omega ∉`: false ↔ false; `ℵ₀.ord = ω`†, so the equality holds. `V_ κ.ord`: `card = κ`†, `omega ∈` (since `ω < κ.ord`): true ↔ true | true | none |
| Description "any two universes are comparable" vs 2.1 `mem_or_eq_or_mem` | `V_ κ.ord`, `V_ μ.ord` with `κ < μ`; `V_ ω`, `V_ κ.ord`; `U = V` | `V_ κ.ord ∈ V_ μ.ord`†; `V_ ω ∈ V_ κ.ord`†; `V_ κ.ord ∉ V_ κ.ord`†, so only the middle disjunct holds for `U = V` | true | none |
| Description "a set in some universe lies in a least one" vs 2.2 `exists_least_isGrothendieckUniverse` | `x = V_ ω`; `x = V_ κ₀.ord` with exactly one inaccessible `κ₀` | `V_ ω ∉ V_ ω` and `V_ ω ∈ V_ κ₀.ord`, so the least is `V_ κ₀.ord ⊆ V_ λ.ord` for every inaccessible `λ ≥ κ₀`. `V_ κ₀.ord` lies in neither universe, so `h` is false | true | none |
| Description "universe axiom iff every cardinal lies below an inaccessible" vs 2.3 `forall_exists_isGrothendieckUniverse_iff` | ⇐ at `x = omega`; ⇒ at `c = 5`; `Cardinal.{u}` without inaccessibles | ⇐: `c = card (V_ (ω+1)) = 2^ℵ₀`; `κ > 2^ℵ₀` gives `ω < κ.ord`, so `omega ∈ V_ κ.ord`. ⇒: `card U` of a universe containing `omega` is inaccessible (1.3) and `> 5`. No inaccessibles: false at `omega`, false at `c = 0` | true | none |

The rows for the other statements, all untouched by this head, stand as in the previous review of eb3beda.

- **Change since eb3beda.** 0 lines in the folder (byte-identical). 7282328 merges main 2c2bcf5. `git diff --stat origin/main...HEAD` outside the folder is empty. Pins are unchanged: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, toolchain v4.36.0-rc2.
- **Gate.** My run with `--base origin/main` passes every check. The worker's run, which includes the build, also passes (`build=0`). Depcheck output: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line, and the roadmap has no supplier roadmap.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else. The scratch probe of the 8 † values elaborates with no error. The file is unchanged, and the 9 elaborated signatures match their README statements.
- **Sources (11 locators, read at Numdam).** williams1969: UA1–UA5 and narrower-sense inaccessibility on p. 1 (lines 32–45); (b), (c) and Theorem 1 on p. 2 (lines 55–69); Theorem 2 and (A)⇔(B) on p. 3 (lines 92–103). kruse1965: inaccessibility on p. 96 (lines 39–42); Theorem 1 (a)⇔(b) on p. 98 (lines 106–119). gabriel1962: U1–U5, the corollaries and the least universe on p. 328 (lines 217–243). All are as cited.
- **Remark (untouched text).** In gabriel1962, §1 « Les univers de Grothendieck » is in Chapitre I: the heading is on printed p. 327, and the table of contents is at line 29. README lines 62, 109, 128, 263 and 340 and `Suggested.lean` lines 48 and 103 say "Ch. 0".
- **Library declarations opened at the pin (18).** `Cardinal/Regular.lean` 302, 333, 336; `ZFC/VonNeumann.lean` 50, 58, 76, 88, 120, 141; `ZFC/Cardinal.lean` 42, 46, 59; `ZFC/Rank.lean` 145; `ZFC/Basic.lean` 349, 586, 653; `Cardinal/Aleph.lean` 606; `Ordinal/Basic.lean` 1113.
- **Pull request text.** I read the title and all four description paragraphs, including the "Sources" sentence, against the head. Nothing in them is contradicted, and they leave no change unstated. The three citation-resolver leads are this roadmap's own declarations (`Suggested.lean` lines 85, 91, 99).

Overlap check: read HanfNumbers, HigherToposTheory, HabiroCohomologyFoundationsPartII, AnalyticToricGeometryPartII; nothing shared (HanfNumbers is the only entry in the three closest-roadmap lists and consumes only Mathlib's `ZFSet.vonNeumann` API; the other three, found by grepping universe vocabulary across main and 429 open heads, fix Lean or Grothendieck universes in their own conventions).

## Not verifiable

- tarski1938, shepherdson1952, Kanamori 2003 §1, SGA 4 Exposé I Appendice, Zermelo 1930 and Blass–Dimitriou–Löwe 2007 were not re-read, because they lie outside the changed passages. No sampled target rests on them alone.

## Source issues

- **Misprint** in williams1969 at References [1], printed p. 3: the source says Gabriel's article runs pp. 324–448; it should be pp. 323–448, the first page in the article's own header; affects nothing.
- **Misprint** in kruse1965 at the definition of inaccessible cardinals, printed p. 96: the source says ℵ₀ is the first inaccessible cardinal; it should say the first nonzero one, since 0 satisfies both clauses vacuously; affects nothing.
