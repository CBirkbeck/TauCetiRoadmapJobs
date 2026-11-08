# GATE-VonNeumannAlgebras~9: answers to the review of 2026-11-06T11:27:46Z

There is one unanswered review, from CBirkbeck, and it makes one point (F01), numbered H01 here. The rest of the
review asks for nothing. Its `## Previous findings` section records R01 as F01 again and R02 as repaired. The
`## Verified sound`, `## Not verifiable` and `## Source issues` sections only record checks that passed. The folder
is unchanged at `6c9ac6d` and there is no new commit.

## H01 (CBirkbeck) — answered

The finding is correct. Main has carried `TauCetiRoadmap/VonNeumannAlgebras` since f8dfe0ad, and at ffac5139 the
folder has no later commit. This branch's merge base, 350e970c, is older than f8dfe0ad. At `6c9ac6d`,
`git merge-tree --write-tree origin/main HEAD` reports `CONFLICT (add/add)` on both `README.md` and `Suggested.lean`.
The repair is to close the pull request, or else to rebase it onto main as a revision of main's folder. Either is a
decision about the branch for a human to make. No content of these two files removes the conflict:

- **Why every edit still conflicts.** The branch does not contain f8dfe0ad, so each file is an add/add pair with an
  empty base. Every line where the branch differs from main conflicts. Only main's exact bytes would merge
  cleanly, and those would empty the pull request.
- **The branch is also on the old pins.** Its `lake-manifest.json` and `lean-toolchain` are at Mathlib 6b7abb3c,
  Tau Ceti a91d3aaf and Lean v4.35.0-rc3. Main and the content checkout are at Mathlib 1b1ccf4b, Tau Ceti 2fd255d9
  and Lean v4.36.0-rc2. The build below therefore ran at the branch's pins. Only a rebase changes that.
- **The gate cannot see the conflict.** The gate passes (below) because it diffs against the merge base, as the
  review says.
- **The index treats it as a revision.** The open-roadmap index (2026-11-06T11:34:54Z) lists this pull request as
  `#1041  VonNeumannAlgebras` without the `(new)` mark it gives to new folders.

**Consumers on main.** Outside the folder, 80 lines in six roadmaps on main mention `VonNeumannAlgebras` together
with V5–V13, V4.0.Decomposition, V4.0.Multiplication or V2.BorelCalculus. The six are BanachAlgebras, FactorRigidity,
NoncommutativeGeometry, OperatorTheory/SelfAdjointSpectralTheory, Subfactors and TypeAHeckeAlgebras. Two examples:
- `TauCetiRoadmap/FactorRigidity/README.md:39`: "VonNeumannAlgebras §§V2–V13b";
- `TauCetiRoadmap/BanachAlgebras/README.md:2043`: "VonNeumannAlgebras V8.RegularL2 and V11.UnitizationCharacters/FourierUniqueness".

This folder defines none of these sections.

**Corrections to the review's evidence.** Two points in the claim "every one of which states an object main
already states" need correcting:

- **The missing pair.** The review lists 8 counterparts. It leaves out `isCyclicVector_iff_isSeparatingVector_commutant`
  (`Suggested.lean:131`), which corresponds to main's `isCyclic_iff_isSeparating_commutant` (main `Suggested.lean:119`).
- **Faithful representation: a counterpart only for separable nonzero `A`.** `exists_faithful_representation`
  (`Suggested.lean:52`) is Gelfand–Naimark for every `CStarAlgebra`. Main's `exists_injective_nondegenerate_representation_lp`
  (main `Suggested.lean:71`) assumes `[TopologicalSpace.SeparableSpace A] [Nontrivial A]`. Main's README plans the
  general theorem (main `README.md:297–298`, Peterson Theorem 4.1.6), but main's Lean file does not state it.
- **Predual and Sakai: no counterpart.** `exists_predual` (`:106`) and `exists_vonNeumannAlgebra_starAlgEquiv` (`:114`)
  have no counterpart on main:
  - Main's README plans both: "intrinsic uniqueness of the von Neumann predual and the equivalence with Mathlib's
    WStarAlgebra definition (Sakai's theorem)", main `README.md:986–987`.
  - Main's docstring lists only the normal-functional form of the predual theorem as not statable (main
    `Suggested.lean:28–31`).
  - Every carrier the two statements use exists at main's Mathlib pin: `WStarAlgebra` with its field
    `exists_predual` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:48–53`) and `StrongDual`
    (`Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:96`). I found no `WStarAlgebra` instance for a
    concrete `VonNeumannAlgebra` there, so `exists_predual` is not already in the library.

**What a revision of main would carry.** The items the review lists, checked against main at ffac5139. None of them
corrects an error in main's text: each is an addition.

| Item (this branch) | Main at ffac5139 | Kind |
| --- | --- | --- |
| V1.4 positive-clause derivation, `README.md:403–408` | `:477–478` states the self-adjoint and positive parts with no locator | addition (route) |
| V1.4 Check with the even-coordinate projection `q`, `:424–431` | Checks `:490–500` have no positive-part Check | addition (Check) |
| V3.2 zero-corner clause, `:818–823`, and identity-inclusion Check, `:845–849` | `:932–937` names multiplicity matrices without defining their entries; only the `M₂⊕ℂ⊂M₅⊕M₃` Check, `:927–929` | addition |
| V2.5 weights `3⁻ⁿ`, `:644–653` | `:753–754` already has "a convergent ternary-weight projection series" | already on main |
| V2.5 `2⁻ⁿ` negative controls, `:653` and `:716–719` | none | addition (Check) |
| V1.2 unit-ball negative control, `:333–340` | `:988–991` names the criterion and has no control | addition (Check) |
| Jones 4.4.2 attribution (V3.2) and Peterson "Lemma 2.5.5 and the proof of Theorem 2.5.6" (V1.3) | `:932–937` and `:471` carry no locator | nothing to correct |
| Lean: general Gelfand–Naimark, predual theorem, Sakai's theorem | not in main's `Suggested.lean` | addition (three statements) |

## Adversarial pass, evidence and checks

No statement was added or changed, so the adversarial pass has no rows for this round. The evidence for H01 was
computed as follows:

| Claim | Instance | Value computed | Result |
| --- | --- | --- | --- |
| The folder conflicts with main | `git merge-tree --write-tree origin/main HEAD` at `6c9ac6d` | `CONFLICT (add/add)` on `README.md` and on `Suggested.lean`; merge base `350e970c` | confirmed |
| Main's folder has not moved | `git log origin/main -- TauCetiRoadmap/VonNeumannAlgebras` | one commit, `f8dfe0ad`; main `README.md` 4337 lines, `Suggested.lean` 215 lines | confirmed |
| Consumers cite sections this folder lacks | grep of main outside the folder for `VonNeumannAlgebras` lines naming V5–V13, V4.0.Decomposition, V4.0.Multiplication, V2.BorelCalculus | 80 lines, 6 roadmaps | confirmed |
| Pins differ | branch `lake-manifest.json` against the content checkout's | Mathlib `6b7abb3c` vs `1b1ccf4b`; Tau Ceti `a91d3aaf` vs `2fd255d9`; Lean v4.35.0-rc3 vs v4.36.0-rc2 | confirmed |
| `2⁻ⁿ` control in the table is right | two atoms, `e₀ = 1_A`, `e_n = 1_B` for `n ≥ 1` | `Σ_{n≥1} 2⁻ⁿ = 1`, so `a = 1`; `Σ_{n≥1} 3⁻ⁿ = 1/2`, so `a = 1_A + ½·1_B`, which has two values | holds |
| Counterpart pairs | the 11 declarations at `6c9ac6d` against main's 17 | 8 exact counterparts, 1 counterpart only for separable nonzero `A`, 2 with none | review's list incomplete |

**Signatures.** `Suggested.lean` is byte-identical to the head that the worker's `signatures.md` describes. I
compared its 11 elaborated types with the README statements and found no lost section binder. Because nothing
changed, no new `#check` scratch file was elaborated.

**Ownership.** The owner of every object in this folder is main's VonNeumannAlgebras, which is H01 itself. I
checked the open pull requests on the index of 2026-11-06T11:34:54Z. Only this pull request carries
`VonNeumannAlgebras`.

**Sources.** No source was fetched or newly cited, and there is no `needs-references.toml`. The review contains no
instruction-like or suspicious text.

## Build and gate

- `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested`: `Build completed successfully (8976 jobs)`. It ran at the
  branch's pins. The only warnings are seven `declaration uses 'sorry'`, at `:52`, `:62`, `:71`, `:94`, `:106`,
  `:114` and `:131`.
- Gate, exit 0: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Commit: none. The working tree is clean at `6c9ac6d`.
