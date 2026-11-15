# Review of GrothendieckUniverses (pull request #1783 at 7282328)

**Verdict:** accepted

No findings.

## Previous findings

- none: the review of 7282328 raised no finding, and the folder is byte-identical at this head.

## Verified sound

No statement changed. The rows below test each claim of the pull request's description against the statement it names at this head. Values marked † are proved `example`s that elaborate with no error in a scratch copy of `TauCetiRoadmap/GrothendieckUniverses/Suggested.lean` at the pins.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description "`V_ω` and `V_κ` … are universes" vs 1.1 `isGrothendieckUniverse_vonNeumann`, `…_omega0` | UA4 in `V_ κ.ord` with `I = omega`, `f n = V_ n`; `κ = ℵ₀` | `⋃ f = V_ ω ∈ V_ κ.ord`†; `card (V_ κ.ord) = κ`†; `¬ IsInaccessible ℵ₀`†, so `V_ ω` needs its own theorem | true | none |
| Description "every universe is one of these" vs 1.2 `isGrothendieckUniverse_iff` | `U = V_ 2` (`2` is inaccessible in Williams's sense); `U = ∅` | `V_ 1 ∈ V_ 2`, `P(V_ 1) ∉ V_ 2`†, so UA2 fails; `V_ 2 ≠ V_ ω`†, `¬ IsInaccessible 2`†. `∅` fails UA5; `κ.ord = 0` forces `κ = 0`. Both sides false | true | none |
| Description "containing `ω` ⇒ inaccessible cardinality, equals `V_κ`" vs 1.3 `isInaccessible_card`, `eq_vonNeumann_card` | `V_ ω`; `V_ κ.ord`, `κ` inaccessible | `V_ ω`: `card = ℵ₀`†, not inaccessible†, `rank omega = ω` so `omega ∉`: false ↔ false; `ℵ₀.ord = ω`† gives equality. `V_ κ.ord`: `card = κ`†, `omega ∈`: true ↔ true | true | none |
| Description "any two universes are comparable" vs 2.1 `mem_or_eq_or_mem` | `V_ κ.ord`, `V_ μ.ord`, `κ < μ`; `V_ ω`, `V_ κ.ord`; `U = V` | `V_ κ.ord ∈ V_ μ.ord`†; `V_ ω ∈ V_ κ.ord`†; `V_ κ.ord ∉ V_ κ.ord`†, so only the middle disjunct holds at `U = V` | true | none |
| Description "a set in some universe lies in a least one" vs 2.2 `exists_least_isGrothendieckUniverse` | `x = ∅`; `x = V_ ω` | `∅`: least is `V_ ω`, as `V_ ω ⊆ V_ κ.ord`† for every inaccessible `κ`. `V_ ω ∉ V_ ω`, `V_ ω ∈ V_ κ.ord`†: least is `V_ κ₀.ord`, `κ₀` least inaccessible | true | none |
| Description "universe axiom iff every cardinal lies below an inaccessible" vs 2.3 `forall_exists_isGrothendieckUniverse_iff` | ⇐ at `x = omega`; `Cardinal.{u}` without inaccessibles | `c = card (V_ (ω + 1)) = 2 ^ ℵ₀`†; `κ > c` gives `ω < κ.ord`, so `omega ∈ V_ κ.ord`. No inaccessibles: left false at `omega`, right false at `c = 0` | true | none |
| Description "closure properties … cardinality bounds", "statements of Gabriel" vs 0.2 | `U = V_ ω`, `x = V_ n`; `U = ∅` against Gabriel's U1–U5 | `card (V_ n) < card (V_ ω) = ℵ₀`†. `∅` satisfies U1–U5 vacuously and fails UA5, so the README's "equivalent for nonempty `U`" is needed | true | none |

The rows of the other statements stand as in the previous review, of `7282328`.

- **Change since 7282328.** 0 lines in the folder; this head is the one the previous review read. `git diff --stat origin/main...HEAD` outside the folder is empty. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- **Gate.** My run with `--base origin/main` passes every check, and so does the worker's run with the build (`build=0`). Depcheck: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line and no supplier roadmap.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 8 `declaration uses sorry` warnings (lines 67, 72, 78, 85, 91, 99, 104, 112) and nothing else. The probe adds 14 proved values (†) and `#check @` of the 8 theorems; the elaborated types match README 1.1–2.3.
- **Sources (13 locators read).** gabriel1962: table of contents line 29; §1, U1–U5, lines 217–227; least universe lines 228–230; corollaries lines 234–243 (p. 328). williams1969: UA1–UA5 lines 30–37 and IA1–IA2 lines 40–45 (p. 1); (b), (c) lines 55–56 and Theorem 1 lines 69–70 (p. 2); Theorem 2 lines 92–93 and (A)⇔(B) lines 98–103 (p. 3). kruse1965: inaccessible, lines 39–42 (p. 96); nonvoid universes, lines 74–83 (p. 97); Theorem 1, lines 106–111 (p. 98).
- **Remark (untouched text).** gabriel1962 places §1 « Les univers de Grothendieck » in Chapitre I (line 29; heading line 206, p. 327). README lines 62, 109, 128, 263 and 340 and `Suggested.lean` lines 48 and 103 say "Ch. 0".
- **Library declarations opened at the pin (19).** `ZFC/VonNeumann.lean` 38, 44, 55, 58, 76, 88, 94, 112, 120, 141; `Cardinal/Regular.lean` 302, 328, 333, 336; `Cardinal/Aleph.lean` 567, 584, 617; `Cardinal/Basic.lean` 334; `Ordinal/Arithmetic.lean` 883.
- **Pull request text.** I read the title and every paragraph of the description against this head. The title has the "<Name>: roadmap" form of a new roadmap, and the head adds only the folder's `README.md`, `Suggested.lean` and `metadata.toml`. Each of the seven claims has a row above. The Sources sentence matches README 1.1–2.3. No sentence is contradicted and no change is left unstated.
- **Citations and reuse.** The three citation-resolver leads are this roadmap's own declarations (`Suggested.lean` lines 85, 91, 99). A GitHub code search finds no public Lean file with `isGrothendieckUniverse_vonNeumann`, `exists_least_isGrothendieckUniverse` or `forall_exists_isGrothendieckUniverse_iff`.

Overlap check: read HanfNumbers, HabiroCohomologyFoundationsPartII, AnalyticToricGeometryPartII; nothing shared. HanfNumbers is the only entry in the three closest-roadmap lists, and it consumes only Mathlib's `ZFSet.vonNeumann` API. The other two fix a Grothendieck universe in their conventions. No roadmap on main or at an open head defines universes on `ZFSet`.

Source independence: changed passages only. The folder changed by 0 lines; I compared the description's two prose paragraphs with williams1969 pp. 1–3 and gabriel1962 p. 328, and they share no wording. Largest share williams1969, 7 of 30 locators. Contents were not compared again because no layer changed.

## Not verifiable

- The formulas of (b) and (c) in williams1969 (lines 55–56) are missing from the text layer, and the PDF could not be rendered here. Their location and surrounding text match README 1.1.
- tarski1938, tarski1939, shepherdson1952, Kanamori 2003 §1, SGA 4 Exposé I Appendice, Zermelo 1930 and Blass–Dimitriou–Löwe 2007 were not re-read: they lie outside the description's claims, and no headline rests on them alone.

## Source issues

- **Misprint** in williams1969 at References [1], printed p. 3: the source says Gabriel's article runs pp. 324–448; it should be pp. 323–448, as in the article's own header (gabriel1962 line 22); affects nothing.
- **Misprint** in kruse1965 at the definition of inaccessible cardinals, printed p. 96: the source says ℵ₀ is the first inaccessible cardinal, yet both clauses hold vacuously for 0; it should exclude 0 explicitly; affects a stated result: Theorem 1, (b)⇒(a), p. 98, fails at `U = ∅` with `α = 0`, since universes are nonvoid (p. 97).
- **Error** in williams1969 at IA1–IA2 and the opening characterization, printed p. 1: the source's clauses hold for 0 and 2, and it says every Ψ(α) with α inaccessible is a universe; it should require α infinite, since Ψ(0) = ∅ and Ψ(2) = {∅, {∅}} are not universes; affects a stated result.

## For the human reviewers

- **Licence.** README lines 324–328 and 385–390 cite four unpublished Bourbaki typescripts (Archives Henri Poincaré, rédactions n° 301, 307, 307 bis, 453) for historical context. No target or locator rests on them.
