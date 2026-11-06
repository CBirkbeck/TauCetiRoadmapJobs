# GATE-VonNeumannAlgebras~8: answers to the review of 2026-11-06T08:12:27Z

One review is unanswered (CBirkbeck). It makes two points, F01 and F02, numbered H01 and H02 here. Its
copy breaks off inside the `## Verified sound` table. That table only records checks that passed and
asks for nothing, so no third point was cut off.

## H01 (CBirkbeck) — answered

The finding is correct, and nothing in the folder was changed for it. Main has had its own
`TauCetiRoadmap/VonNeumannAlgebras` since f8dfe0ad: a 4337-line README with `## Layer 0` to
`## Layer 13` and a 215-line `Suggested.lean`. At this head, `git merge-tree --write-tree origin/main HEAD` still
reports `CONFLICT (add/add)` on `README.md` and on `Suggested.lean`. On main, outside the folder, 69 lines cite
`VonNeumannAlgebras` V5–V13, V4.0.Decomposition, V4.0.Multiplication or V2.BorelCalculus, and this folder defines none of
them (for example `TauCetiRoadmap/FactorRigidity/README.md:247`, "VonNeumannAlgebras §§V12–V13b"). The repair is to close
the pull request, which is a decision for a human and not an edit to these two files. The only versions of the files that avoid
replacing main's roadmap are main's own text, which would empty the pull request, or a re-authored revision of
main's Layers 0–4, which is the separate work the review describes.

One correction to the evidence. Nine of the eleven declarations have counterparts in main's
`Suggested.lean` (`:71`, `:82`, `:91`, `:110`, `:114`, `:119`, `:127`, `:133`, `:139`; the review's list leaves out
`isCyclicVector_iff_isSeparatingVector_commutant` ↔ `isCyclic_iff_isSeparating_commutant` at `:119`). The other two,
`exists_predual` and `exists_vonNeumannAlgebra_starAlgEquiv` (the predual theorem and Sakai's theorem, stated
through `WStarAlgebra`'s conjugate-linear predual), have no counterpart. Main's docstring lists the predual theorem as not statable at the
pins (main `Suggested.lean:28–31`), although main's README plans both theorems in V4.Core (main
`README.md:985–987`). So a revision of main should carry these two statements as well as the README items the review lists.
I checked those items against main's text:
- **Not on main.** The V1.2 unit-ball negative control: main `README.md:991` names the criterion but has no control. The V3.2 zero-corner clause and its identity-inclusion Check: main's Layer 3, `:905–970`, has only the `M₂⊕ℂ⊂M₅⊕M₃` Check. The `2⁻ⁿ` negative control.
- **Already on main.** The weights themselves: main `:753–754` has "a convergent ternary-weight projection series".
- **Nothing to correct on main.** The Jones 4.4.2 and Peterson 2.5.5/2.5.6 locators: main's Layers 1 and 3 carry no source locators at those claims.

## H02 (CBirkbeck) — applied differently

`README.md` V1.4 (`:395–408`) now attributes only the unit-ball and self-adjoint unit-ball clauses to the three sources,
and derives the positive clause in the text. Old: "…, and likewise for the positive parts (Houdayer, Theorem 3.16, p. 17;
Peterson, Theorem 2.6.4, p. 31; Jones, Theorem 5.2.1, pp. 32–33)". New: "… (Houdayer, Theorem 3.16, p. 17; Jones,
Theorem 5.2.1, pp. 32–33; Peterson, Theorem 2.6.4 and its proof, p. 31, whose statement gives the self-adjoint part
without the norm bound)". This is followed by an explicit derivation: from self-adjoint contractions `y_α → √x`,
`y_α² → x` by `‖(y_α² − x)ξ‖ ≤ ‖(y_α − √x)ξ‖ + ‖(y_α − √x)√x ξ‖`, V1.1. The derivation replaces the terse "positive case by `x ↦ x*x`" clause
of the route.

The repair differs from the suggested one in two places:
- **The Peterson locator.** Peterson's statement does not contain the self-adjoint unit-ball clause either: (i) at peterson-notes line 1130 is density of the self-adjoint
  part with no norm bound. The bounded form is proved at line 1139, so the locator names the proof.
- **The positive-part Check (`:424–431`).** The old Check approximated `1 − e₀`, but `1 − e₀ = 1 + (−e₀)` already lies in `A`, so the constant net
  satisfies it. The new Check uses the even-coordinate projection `q`, which lies outside `A` and is at norm distance at least `1/2` from it. `q` is the strong
  limit of the positive contractions `qP_n ∈ A`.

Sources read at the cached texts:
- **Jones:** jones-vna line 957–960 states two clauses, and "positive" does not occur in the proof, lines 961–1007.
- **Houdayer:** houdayer line 784–787 has two bullets.
- **Peterson:** peterson-notes line 1128–1131.

The page numbers are confirmed by the page markers: houdayer line 777 (p. 17), peterson-notes line 1117 (p. 31), and
jones-vna lines 939 and 976 (pp. 32–33). No other locator in the README attributes a derived clause in this way: grep for
"likewise", "similarly" and "as well as" finds only the V3.2 Check at `:846`, which carries no locator.

## Build and gate

- `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested`: `Build completed successfully (8976 jobs)`. The only
  warnings are seven `declaration uses 'sorry'`, at `:52`, `:62`, `:71`, `:94`, `:106`, `:114` and `:131`.
- Gate at 6c9ac6d5 against `origin/main`:
  `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  The gate diffs against the merge base `350e970c`, so it does not see H01.
- Dependency check, verbatim:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

  It reports no UPWARD, CYCLE or `moved:` line.
- Commit: `6c9ac6d5 VonNeumannAlgebras: review repairs (Kaplansky locators on two stated clauses; positive clause derived, discriminating Check)`.
  Not pushed.

## Signatures

`Suggested.lean` is unchanged. I compared the eleven elaborated types in `signatures.md` with their README statements. All
carry `{H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]` where they use `H`, and
`exists_faithful_representation` and `exists_vonNeumannAlgebra_starAlgEquiv` take `[CStarAlgebra _]`, the second also
`[WStarAlgebra M]`. `kaplansky_closure_unitBall` is still the unit-ball form named in V1.4, with `A : StarSubalgebra ℂ (H →L[ℂ] H)`,
a unital star subalgebra as the prose says. No binder is lost, so nothing changed.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| V1.4 unit-ball and self-adjoint clauses (locator only) | `A = ℂ·1`; finite rank `+ ℂ·1` on `ℓ²(ℕ)`; upper triangular `A ⊆ M₂(ℂ)` | `ℂ·1`: balls `{c·1 : |c| ≤ 1}`, self-adjoint part `{t·1 : t ∈ [−1, 1]}`, equal. Finite rank: `‖P_n S P_n‖ ≤ 1`, `P_n S P_n → S` strongly, `S ∉ A`. Upper triangular: `A'' = M₂(ℂ)`, `dist(e₂₁, A) = 1` | holds; star hypothesis needed | locators moved to these two clauses |
| Peterson locator | peterson-notes 1130–1131, 1139 | (i) `closure_SOT(A_sa) = B_sa`, no `(·)₁`; (ii) `(A)₁` dense in `(B)₁`; line 1139 `(A)₁ ∩ A_sa` dense in `(B)₁ ∩ B_sa` | the statement lacks the bounded self-adjoint clause | "and its proof" |
| Derived positive clause | `x = 0`; `x = 1`; `x = ½·1`; `x = q` (even coordinates); `H = 0` | `x = 0`: `y_n = −e_n` are self-adjoint contractions with `y_n → 0`, not positive; `y_n² = e_n ≥ 0`, `→ 0`. `x = 1`: `√1 = 1 ∈ A`, `y = 1`. `x = ½`: approximants of `x` itself square to `¼ ≠ ½`, so the `√x` step is needed; `y = 2^(−1/2)·1` gives `y² = ½`. `x = q`: `√q = q`, `y_n = qP_n`, `y_n² = qP_n`, `‖(q − qP_n)ξ‖² = Σ_{2k ≥ n} |ξ_{2k}|² → 0`. `H = 0`: all zero | holds; the squaring and the square root are both needed | derivation written out |
| Inequality `‖(y² − x)ξ‖ ≤ ‖(y − √x)ξ‖ + ‖(y − √x)√xξ‖` | `‖y‖ ≤ 1` | `y² − x = y(y − √x) + (y − √x)√x`, `‖y(y − √x)ξ‖ ≤ ‖(y − √x)ξ‖` | holds | new |
| New Check, `q` outside `A` | `a = c·1 + F`, `F` finite rank; `c = 0, 1, ½` | `q − c·1` has eigenvalues `1 − c` and `−c`, each of infinite multiplicity, so infinite rank for every `c` (c = 0: rank ∞ on evens; c = 1: rank ∞ on odds). A unit `ξ ∈ ker F ∩ E_λ` gives `‖q − a‖ ≥ |λ|`, so `≥ max(|1 − c|, |c|)`, which is `1, 1, ½`; the minimum is `½` at `c = ½` | holds; strong, not norm, density | replaces the `1 − e₀` Check (`1 − e₀ ∈ A`) |
| Old Check, for the record | `1 − e₀`, `P_n − e₀` | `1 − e₀ = 1 + (−e₀) ∈ A`; the constant net already approximates it | true but not discriminating | removed |

## Ownership and citations

The repair adds no construction, carrier or supplier citation. `roadmaps list` (open pull requests) shows only this
pull request carrying `VonNeumannAlgebras`. `roadmaps grep -i --readme-only 'positive part of the unit ball'` finds no match on main or in
any open roadmap pull request. No roadmap moved down; the merge order is unchanged.

## Sources

Three texts were read:
- **Jones:** jones-vna, fetched through the sources service as an author page at math.berkeley.edu.
- **Houdayer:** the service's cached text of the author's page, cyrilhoudayer.com.
- **Peterson:** the service's cached text of the author's page, math.vanderbilt.edu. A fresh fetch of the URL now returns HTTP
  404, so the cached copy fetched earlier from that page was the one read.

The folder has no `sources.toml`, and this job edits only `README.md` and `Suggested.lean`, so nothing was recorded in a manifest. No text is
missing, and `needs-references.toml` is not written.

## Suspicious text

None. The review contains no instruction to run commands or to act outside the job.
