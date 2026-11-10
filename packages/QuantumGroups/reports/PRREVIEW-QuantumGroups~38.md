# Review of QuantumGroups (pull request #1705 at d3c6f3a)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines that changed in the folder since `6570ce6`: one Check of §4.1, at `TauCetiRoadmap/QuantumGroups/README.md:911`. `Suggested.lean` is unchanged and nothing outside the folder changed. Line numbers refer to the README unless a file is named.

Two revisions are involved:

- **The branch pin** is this pull request's `lake-manifest.json`: Tau Ceti `358314d4`, Mathlib `f6090c70`.
- **Main's pin** is main (`641f296`): Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

The change repairs the previous R02 correctly. The previous R01 is untouched by this head and is carried.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`: the pin paragraph is false once merged, and the §8.5 sphericity headline is statable where the roadmap will live but is absent

Re-raised: H01

**Why H01's reason fails.** The reason was "not actionable in this package; the folder needs no change now". It holds for the merge of `origin/main`, which is the worker's step. It fails for the folder: the sentences quoted below are folder text that becomes false at the merge, and the absent headline is a folder edit.

**Location** (unchanged since `6570ce6`).

- `Suggested.lean:18`–`:20`: "This file elaborates against revision `358314d4`, which is "the pinned Tau Ceti" below; every module named below as not contained in it is a module of `2fd255d9`."
- `Suggested.lean:29`, `:31`, `:75`–`:76`: "a module that the pinned Tau Ceti does not contain".
- `Suggested.lean:77`–`:84`: "the pinned Tau Ceti contains none of these modules, so no statement of it elaborates here".
- README `:155`–`:158`: "cited as it is at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…`".

**Claim.** The README and `Suggested.lean` may be held at two different Tau Ceti revisions, and the file's headline set is complete for the revision it will be built against.

**Witness** (re-checked at this head).

- **Manifests.** The branch manifest records Tau Ceti `358314d4`; main's records `2fd255d9`. The pull request changes neither. Once merged, `Suggested.lean` builds against `2fd255d9`, so `:18`–`:19` is false on main.
- **Star condition.** At `2fd255d9`, `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean:46`–`:49`) is a `Prop` class whose one field is exactly `hΔ`. The file is absent at `358314d4`.
- **Sphericity.** `TauCeti.SphericalCategory` is `Prop` at `2fd255d9` (`CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`). The description itself says the headline "is statable at that revision and belongs in the file once the manifest is there".

**Repair.**

1. The worker merges `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` exits 0 at this head, and main has not touched the folder's two roadmap files since `46515d5e`.
2. Restore the two files of `903be55b`:
   `git checkout 903be55b -- TauCetiRoadmap/QuantumGroups/README.md TauCetiRoadmap/QuantumGroups/Suggested.lean`.
   Then re-apply only:
   - the §4.1 README edits of `6570ce6` at `:856` and `:902`;
   - the zero-ring Check at `:911` exactly as it reads at this head;
   - in `Suggested.lean`, deleting `[Nontrivial A]` and "nonzero" from `compactType_iff`.

   Do not re-apply the revision paragraphs at README `:155`–`:158` and `Suggested.lean:18`–`:20`. After the merge the folder cites at its pins like every other roadmap.
3. Re-run the gate with its build.

**Tested on the refuting instance.** The previous round elaborated `903be55b`'s `Suggested.lean`, with `[Nontrivial A]` and "nonzero" deleted, at main's pins: exit 0, exactly five `declaration uses sorry` warnings, and the instances `uqSl2RigidCategory` and `uqSl2PivotalCategory` with real bodies. Main's pins and this pull request's `Suggested.lean` are both unchanged since that test, so it was not run again.

## Previous findings

- R01 — not repaired: `Suggested.lean:18`–`:19` "This file elaborates against revision `358314d4`, which is "the pinned Tau Ceti" below". The branch manifest still records `358314d4`; the sphericity headline is absent. Carried as R01.
- R02 — repaired: `:911` "A definition of Hopf *-algebra whose counit need not be unital would admit the zero ring with Δ=0 and ε=0 … Dropping only the counit laws keeps ε(1)=1 and still excludes the zero ring." No new problem introduced.

## Verified sound

**Gate, order, build.**

- Gate re-run at `d3c6f3a`: every counter 0, `OK`, exit 0. The worker's gate also reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- Dependency check (the required command), output unmodified; no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

- `lake env lean` on `Suggested.lean` at the branch pin: exit 0, four `sorry` warnings (`:128`, `:160`, `:171`, `:181`), nothing else.
- `Suggested.lean` is byte-identical to the file the previous round read (`git diff --stat 6570ce6 HEAD` lists only the README), so the `#check @` comparison and the one-tactic padding probe of the previous report stand. `scratch/signatures.md` at this head shows the same six types. The `of` entry there is the generator reading the `module` keyword, and the `[StarModule ℂ A]` lead on `AlgebraicHaar` is harmless: no field uses it, and every headline carries it.

**The changed passage, `:911`.** Each of its five sentences was checked.

- *Sentence 1* (the zero ring is not an instance): unchanged, and correct by `Bialgebra.counit_one` (`Mathlib/RingTheory/Bialgebra/Basic.lean:61` at the branch pin).
- *Sentence 2* (a non-unital counit admits the zero ring with Δ=0, ε=0; coassociativity and both counit laws hold): the three laws are `coassoc`, `rTensor_counit_comp_comul` and `lTensor_counit_comp_comul` (`Mathlib/RingTheory/Coalgebra/Basic.lean:82`, `:84`, `:86`). On A=0 each is an equation between linear maps out of the zero module, so each holds. The previous round built this `Coalgebra ℂ PUnit` instance in Lean (exit 0). There `ε(1)=ε(0)=0≠1`.
- *Sentence 3* (the equivalence would fail there): the span of any subset of A=0 is `{0}=⊤`, so the right side is true. Every linear functional h has `h(1)=h(0)=0≠1`, so no normalized functional exists and the left side is false. True ↔ false fails, as the Check says.
- *Sentence 4* (dropping only the counit laws keeps `ε(1)=1`): with ε still an algebra map, `1=ε(1)=ε(0)=0` in ℂ is a contradiction, so the zero ring stays excluded.
- *Form.* The Check is prose, names no Lean declaration of this roadmap, and uses no process word; it now agrees with the first sentence and with the other four Checks of §4.1.
- *What cites it.* The API bullet at `:902` and `compactType_iff` (`Suggested.lean:160`) carry no nontriviality hypothesis, which is what the Check justifies. No other passage refers to the zero ring.

**Seeded sample.** None of the fifteen sampled targets falls in the changed line (§4.1 is not sampled; §§4.2 and 4.3 are untouched). The locator the changed Check's section rests on was re-read: `nt` Theorem 1.6.6 at `nt` line 810, printed p.18, matching `:915`.

**Description and overlaps.**

- The description's section on the revisions matches the head: branch manifest `358314d4`, `hΔ` as a hypothesis, sphericity not stated.
- `scratch/overlaps.md`: no dropped id and no revision-only id. The one conflict, with #1649 in the same two files, has its order stated in the merge-order block (#1649 first).
- Ownership against open pull requests: the changed line introduces no object, so no new search was run.

**Library declarations opened this round (5).**

- Branch pin, Mathlib: `RingTheory/Coalgebra/Basic.lean:82`, `:84`, `:86`; `RingTheory/Bialgebra/Basic.lean:61`.
- Main's pin, Tau Ceti: `Algebra/Coalgebra/Star.lean:46`–`:49`; `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`. Both files are absent at the branch pin, as is the directory `QuantumGroups/`.

**Adversarial table.** Rows for the changed statement, with values computed this round:

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `:911` sentence 1 | A=0 with a unital counit | `ε(1)=1` by `counit_one`; `ε(0)=0` by linearity; `1≠0` in ℂ | not an instance | none |
| `:911` sentence 2 | A=0, Δ=0, ε=0 | coassoc `0=0`; `(ε⊗id)Δ=0` and `1⊗(·)=0` on A=0; likewise on the other side; `ε(1)=0≠1` | laws hold, unitality fails | none |
| `:911` sentence 3 | same | span of unitary coefficients `={0}=⊤`: right side true; `h(1)=h(0)=0≠1` for every h: left side false | equivalence fails, as stated | none |
| `:911` sentence 4 | A=0, ε an algebra map, no counit laws | `ε(1)=1` and `ε(0)=0` give `1=0` in ℂ | still excluded | none |
| `compactType_iff` against the Check | ℂ; ℂ[C₂] | `h=id`, span{1}=ℂ, both true; `h((a+bu)*(a+bu))=|a|²+|b|²`, span{1,u}=ℂ[C₂], both true | ok | none |
| `Suggested.lean:18`–`:20` | `358314d4` vs `2fd255d9` | branch: `Coalgebra/Star.lean` and `QuantumGroups/` absent; main: present, `StarCoalgebra` at `:46` | false after merge | R01 |

Rows carried from the previous report (`~37`) for the statements the diff leaves untouched; values as recorded there:

| Statement | Values (`~37`) | Result |
| --- | --- | --- |
| `compactType_iff`, ℂ[x] with x primitive | `x+h(x)1` vs `h(x)1` forces x=0; unitary entries constant, span ℂ≠ℂ[x]; both sides false | ok |
| `uqSl2_sphericalCategory` (R01's repair) | `tr K⁻¹=5/2=tr K=[2]`; `21/4=[3]`; at q=±1, K=2 gives `1/2≠2` | elaborates at main's pin |
| `schur_orthogonality` vs `nt` 1.4.2 | `h(a*a)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`; §7.1 `(1−q²)/(1−q⁴)=4/5` | ok |
| `schur_orthogonality`, degenerate | character `F̃=1`: `1=1/1`; `F̃=2` gives `2≠1/2` | ok |
| `AlgebraicHaar` | `h((1+u)*(1+u))=2`; zero functional `h(1)=0≠1`; ε: `u≠1` | ok |
| `haar_modular_automorphism` | `θ(a)=4a`, `h(aa*)=4/5=4·h(a*a)`; θ⁻¹ gives `1/20`; ℂ[S₃] θ=id | ok |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃] trace and `S²=id`; SUq(2) `4/5≠1/5`, `S²c=c/4` | ok |
| §3.4 conventions | `S²c=c/4=τ_−i(c)`; `σ_t(a)=4^(it)a` | ok |
| §3.3 metrics | `(FuF⁻¹)*F⁻²(FuF⁻¹)=F⁻²`; traces `2`, `1/2` | ok |
| §0.2 Checks | `‖T†T‖=4`; `√17≠5`; `√2`; `8`, `1/2` | ok |
| §0.3 Checks | `tr₂(p)=4/25`, `21/25`; `d³−2d=0`; `e²=δe` | ok |
| §1.2 monoid {1,0} | dimension 3 of 4 | ok |
| §2.2 Check | `T=[[1,1],[1,3]]`, det 2, `U*TU=T` | ok |
| §4.2 pentagon | `(1,3,6)` on both sides | ok |
| §4.3 | `2√3<4`; `2/(2N+1)→0` | ok |
| §5.1 relations, antipode, coproduct | `aa*+q²c*c=1/4≠1` at a=0, c=1; `S(c)=−qc` | ok |
| §5.2, §7.2 | `FF̄=−2I`; norm² 5; `d≤5/2` | ok |
| §7.1 Haar and character | `4/5`, `16/21`; `√3/4` | ok |
| §7.2 dimensions | `1, 5/2, 21/4, 85/8`; moments `1, 2` vs `1, 1` | ok |
| §8.1 | `KF=4FK`; q=0 forces E=0 | ok |
| §8.2 ladders | weights `1/4, 1, 4`; `[E,F]=diag(5/2,0,−5/2)` | ok |
| §8.3 Casimir | `10/9, 17/9, 65/18` | ok |
| §8.5 Clebsch–Gordan | `α₁=−1/2`; middle coefficient `5/4` | ok |
| §8.6 form and pairing | `h₁=1/2`; `⟨Ev₁,v₀⟩=1` | ok |
| §8.7 basis change | exponents `0`; `q⁻¹(2)_q=5/2=[2]` | ok |

**Remarks on untouched text** (no change requested):

- §§0.2–0.3 are still also claimed by the open CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras heads. This was settled earlier: the correction belongs to those pull requests.

## Not verifiable

- **Timmermann** (`timmermann`) is settled as uncertified, so Theorem 3.2.12, cited for `compactType_iff`, was not read. The equivalence was cross-checked against `nt` Theorem 1.6.6 (p.18).
- **Jones 1983 and Takesaki II** are settled as uncertified and are untouched by the diff.
- **The post-merge form** was not elaborated again this round; the previous round's test is cited in R01, with the reason it still applies.

## Source issues

- none
