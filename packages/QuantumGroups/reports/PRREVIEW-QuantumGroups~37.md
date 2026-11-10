# Review of QuantumGroups (pull request #1705 at 6570ce6)

**Verdict:** needs changes

This is an incremental re-review of the 21 lines that changed in the folder since `8e68b86` (README 11, `Suggested.lean` 10). Nothing outside the folder changed. Line numbers refer to `TauCetiRoadmap/QuantumGroups/README.md` unless a file is named.

Two revisions are involved:

- **The branch pin** is this pull request's `lake-manifest.json`: Tau Ceti `358314d4`, Mathlib `f6090c70`.
- **Main's pin** is main (`2485dfb3`): Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`. The new pin paragraph is false once merged, and the §8.5 sphericity headline is statable where the roadmap will live but is absent

Re-raised: H01

**Why H01's reason fails.** The reason was "not actionable in this package; the folder needs no change now". It holds for the merge of `origin/main`, which is the worker's job. It fails for the folder:

- This head itself edits the folder for R01.
- The edit it makes is a sentence that becomes false at the merge.
- The remaining repair (steps 2–3 below) is a folder edit.

**Location.**

- New, `Suggested.lean:18`–`:20`: "This file elaborates against revision `358314d4`, which is "the pinned Tau Ceti" below; every module named below as not contained in it is a module of `2fd255d9`."
- `Suggested.lean:29`, `:31`, `:75`–`:76`: "a module that the pinned Tau Ceti does not contain".
- `Suggested.lean:77`–`:84`: "the pinned Tau Ceti contains none of these modules, so no statement of it elaborates here".
- New, README `:155`–`:158`: "cited as it is at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…`".

**Claim.** The README and `Suggested.lean` may be held at two different Tau Ceti revisions. The file's headline set is complete for the revision it will be built against.

**Witness.**

- **Manifests.** The pull request changes neither manifest. Once merged, `Suggested.lean` builds against `2fd255d9`, so `:18`–`:19` is false on main.
- **Star condition.** At `2fd255d9`, `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean:46`–`:49`) is a `Prop` class whose one field is exactly `hΔ`.
- **Sphericity.** `TauCeti.SphericalCategory` is `Prop` (`CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`), and the sphericity statement elaborates there.
- **Module paths.** Nine of the ten Tau Ceti module paths the README contract names are absent at `358314d4` and present at `2fd255d9`.

**Repair.**

1. The worker merges `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` exits 0 at this head, and main has not touched the folder since `c9940702`.
2. Restore the two files of `903be55b`:
   `git checkout 903be55b -- TauCetiRoadmap/QuantumGroups/README.md TauCetiRoadmap/QuantumGroups/Suggested.lean`.
   Then re-apply only these edits of `6570ce6`:
   - the §4.1 README edits at `:856` and `:902`, and the zero-ring Check at `:911` as amended by R02 below;
   - in `Suggested.lean`, deleting `[Nontrivial A]` and "nonzero" from `compactType_iff`.

   Do not re-apply the revision paragraphs at README `:155`–`:158` and `Suggested.lean:18`–`:20`. After the merge the folder cites at its pins like every other roadmap, and a sentence naming main's manifest hashes goes stale when main next moves.
3. Re-run the gate with its build.

**Tested on the refuting instance.** `903be55b`'s `Suggested.lean`, with `[Nontrivial A]` and "nonzero" deleted, was copied to scratch and elaborated with `lake env lean` at main's pins. It exits 0 with exactly five `declaration uses sorry` warnings (`:120`, `:152`, `:163`, `:173`, `:207`). The instances `uqSl2RigidCategory` and `uqSl2PivotalCategory` elaborate with real bodies.

## R02 (P3) — The new zero-ring Check blames the wrong axiom: the zero ring satisfies the counit axioms, and it is unitality ε(1)=1 that excludes it

**Location.** `:911`: "A definition of Hopf *-algebra without the counit axiom would admit the zero ring, with coefficient span everything and no normalized functional."

**Claim.** Dropping the counit axiom is what lets the zero ring in.

**Witness.**

- The counit axioms are `rTensor_counit_comp_comul` and `lTensor_counit_comp_comul` (`Mathlib/RingTheory/Coalgebra/Basic.lean:84`, `:86`).
- A scratch file builds `Coalgebra ℂ PUnit` with Δ=0 and ε=0, which satisfies coassociativity and both counit laws (exit 0).
- What fails is `Bialgebra.counit_one` (`RingTheory/Bialgebra/Basic.lean:61`). Dropping only counitality keeps ε(1)=1, which still excludes the zero ring.

**Repair.** Replace the sentence with: "A definition of Hopf *-algebra whose counit need not be unital would admit the zero ring with Δ=0 and ε=0, which satisfies coassociativity and both counit laws, with coefficient span everything and no normalized functional."

**Tested.**

- The scratch `Coalgebra ℂ PUnit` instance elaborates, and there ε(1)=0≠1.
- With ε unital, `example (A) [Ring A] [Bialgebra ℂ A] : Nontrivial A` is proved from `Bialgebra.counit_one` and `map_zero` (no message).

The first sentence of the Check is correct as written.

## Previous findings

- R01 — partly repaired: `Suggested.lean:18`–`:19` "This file elaborates against revision `358314d4`, which is "the pinned Tau Ceti" below". The pin clauses are now true at the branch pin. The branch still pins `358314d4`, and the sphericity headline is absent. Carried as R01.
- R02 — repaired: `Suggested.lean:160` "theorem compactType_iff (A : Type u) [Ring A] [HopfAlgebra ℂ A] [StarRing A]". "nonzero" is gone at `:856`, `:902` and `Suggested.lean:157`, and the Check at `:911` is replaced. The replacement's second sentence is R02 of this report.

## Verified sound

**Gate, order, build.**

- Gate re-run at `6570ce6`: every counter 0, `OK`, exit 0. The worker's gate also reports `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- Dependency check (the required command), output unmodified; no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

- `lake env lean` on `Suggested.lean` at the branch pin: exit 0, four `sorry` warnings (`:128`, `:160`, `:171`, `:181`), nothing else.
- `#check @` of all six declarations, in one scratch copy: the types equal `scratch/signatures.md`.
  - `compactType_iff` now reads `∀ (A) [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A], hΔ → (Nonempty AlgebraicHaar ↔ span = ⊤)`, matching the README at `:857` and `:902`.
  - `AlgebraicHaar` lacks `[StarModule ℂ A]`, but no field uses it and every headline carries it, so nothing changes.
  - The `of` entry in `signatures.md` is the generator reading the `module` keyword.
- Padding probe on the changed headline, `first | rfl | simp | infer_instance | trivial | decide | aesop`: it fails, and `aesop` exhausts its search. The other three statements are unchanged; `~36` probed them and none closed.

**The changed passages.**

- **README `:155`–`:158`.** The two hashes equal main's `lake-manifest.json` at `2485dfb3` (Tau Ceti `2fd255d997f4…`, Mathlib `1b1ccf4b088b…`), so the sentence is true today. R01 asks for its removal after the merge.
- **`Suggested.lean:18`–`:20`.** Each module the docstring names as absent was checked at both pins:
  - `Algebra/Coalgebra/Star.lean`, `Algebra/Category/FiniteHopfModuleCat/{Rigid,Pivotal}.lean`, `CategoryTheory/Monoidal/Pivotal/Spherical.lean` and `QuantumGroups/UqSl2/Antipode.lean`: absent at `358314d4`, present at `2fd255d9`.
  - `QuantumGroups/UqSl2/ClebschGordan/Recoupling.lean:135` (`clebschGordanRecouplingEquiv`): present at `2fd255d9`.
  - The two imported comodule modules: present at both pins.
- **Module paths (10).** `QuantumGroups/`, `Algebra/Coalgebra/Star.lean`, `Algebra/HopfAlgebra/{Star,Cancellation,InverseAntipode}.lean`, `Algebra/OreExtension/`, `Algebra/Category/FiniteHopfModuleCat/`, `CategoryTheory/Monoidal/Pivotal/` and `RingTheory/Finiteness/LocallyFinite.lean` are absent at `358314d4` and present at `2fd255d9`. `Algebra/Lie/Sl2/Standard.lean` is present at both.
- **Seeded sample, Layer 8.** The new sentence pins the Tau Ceti citations of §§8.1, 8.2, 8.4, 8.5 and 8.7, so 20 of their names were opened at `2fd255d9`, four per section. Each is declared there and absent at `358314d4`:
  - §8.1: `OreExtension.isDomain` (`Algebra/OreExtension/Degree.lean`), `liftAlgHom` and `monomialBasis` (`OreExtension/Basic.lean`), `rightCoeffLinearEquiv` (`OreExtension/RightCoeff.lean`).
  - §8.2: `UqSl2.LadderModule.algebraMap_end_bijective`, `isSimpleModule` and `nonempty_linearEquiv_iff` (`UqSl2/LadderModule/Basic.lean`), and `UqSl2.VermaModule.basis` (`UqSl2/Verma/Basic.lean:482`).
  - §8.4: `UqSl2.IsSignedTypeOne`, `IsTypeOne` and `LadderModule.not_isTypeOne` (`UqSl2/TypeOne.lean:253`), and `isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule` (`UqSl2/LocallyFinite.lean`).
  - §8.5: `FiniteHopfModuleCat.forgetToModule` and `ofShrink` (`FiniteHopfModuleCat/Basic.lean`), `instRightRigidCategory` (`RightRigid.lean:123`) and `leftDual` (`Rigid.lean:69`).
  - §8.7: `UqSl2.ClassicalLadder.equivSl2Std` and `isSl2Triple`, and `LadderModule.toMatrix_rep_e` and `toMatrix_rep_f` (`UqSl2/ClassicalSpecialization.lean:509` and nearby).
  - No other seeded target falls in the changed lines.
- **§4.1 locator.** `nt` Theorem 1.6.6 is at line 810, under the printed header "18" (p.18): a Hopf *-algebra generated by coefficients of finite unitary corepresentations is the coefficient algebra of a compact quantum group. This matches `:913`.
- **Description.** The title no longer announces a ribbon category. The description's account of `hΔ`, the absent sphericity headline and the two revisions matches the head. The merge-order block orders #1649 before this pull request, which settles the conflict listed in `scratch/overlaps.md`.
- **Overlaps.** No dropped id and no revision-only id.

**Library declarations opened.**

- Branch pin, Mathlib: `RingTheory/Coalgebra/Basic.lean:82`–`:86` (`coassoc`, `rTensor_counit_comp_comul`, `lTensor_counit_comp_comul`) and `RingTheory/Bialgebra/Basic.lean:61` (`counit_one`). The same line holds at main's pin.
- Main's pin, Tau Ceti: `Algebra/Coalgebra/Star.lean:46`–`:49`; `CategoryTheory/Monoidal/Pivotal/Spherical.lean:69`–`:71`; `QuantumGroups/UqSl2/Basic.lean:79`, `:157` and `:280` (`[E,F]=(q−q⁻¹)⁻¹•(K−K⁻¹)`).

**Adversarial table.** Rows for the changed statements, with values computed this round (q=1/2 unless stated):

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `compactType_iff` without `[Nontrivial A]` | ℂ | h=id, h(1)=1; span{1}=ℂ; both sides true | ok | none |
| same | ℂ[C₂] | h(1)=1, h(u)=0, `h((a+bu)*(a+bu))=|a|²+|b|²`; span{1,u}=ℂ[C₂]; both true | ok | none |
| same | ℂ[x], x primitive and self-adjoint | `(id⊗h)Δx=x+h(x)1` vs `h(x)1` forces x=0, so no h. A unitary U over ℂ[x] has `Σ_k p̄_ki p_ki=1`, and the leading terms `|c|²x^(2d)` cannot cancel, so its entries are constants and the span is ℂ≠ℂ[x]; both false | ok | none |
| same | zero ring | `ε(1)=ε(0)=0≠1`, so it is not an instance (Lean, exit 0) | binder redundant, now gone | none |
| `:902` API bullet | same four instances | as above | ok | none |
| `:911` sentence 1 | A=0 with `Bialgebra ℂ A` | `counit_one` gives 1 and `map_zero` gives 0 in ℂ | ok | none |
| `:911` sentence 2 | `PUnit` with Δ=0, ε=0 | coassoc `0=0`; `rTensor`: `0=1⊗0=0`; `lTensor`: `0=0⊗1=0` (Lean, exit 0); `ε(1)=0≠1` | names the wrong axiom | R02 |
| `Suggested.lean:18`–`:20` | `358314d4` vs `2fd255d9` | branch: 9 of 10 cited module paths absent; main: all present. On main the file builds at `2fd255d9` | false after merge | R01 |
| README `:155`–`:158` | main's manifest at `2485dfb3` | `2fd255d9`, `1b1ccf4b` on both sides | true now, goes stale | R01 step 2 |
| `uqSl2_sphericalCategory` (the repair) | L₁⁺; L₂⁺; q=±1 with K=2, E=F=0 | `tr K⁻¹=2+1/2=5/2=tr K=[2]`; `1/4+1+4=21/4=[3]`; at q=±1, `(q−q⁻¹)⁻¹=0` admits K=2 with traces `1/2≠2`, so `hq` is needed | elaborates at main's pin | R01 |

Rows carried from `~36` for the statements the diff leaves untouched; values as recorded there:

| Statement | Values (`~36`) | Result |
| --- | --- | --- |
| `schur_orthogonality` vs `nt` 1.4.2 | `h(a*a)=(1/2)/(5/2)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`; §7.1 gives `(1−q²)/(1−q⁴)=4/5` | ok |
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

- **Timmermann** (`timmermann`) is settled as uncertified, so Theorem 3.2.12, cited for `compactType_iff`, was not read. The equivalence was cross-checked against `nt` Theorem 1.6.6 (p.18) and Theorem 1.4.2 (p.9).
- **Jones 1983 and Takesaki II** are settled as uncertified and are untouched by the diff.
- **Ownership against open pull requests.** The changed lines introduce no new object, so no new ownership search was run. The five closest roadmaps of `scratch/overlaps.md` were compared in earlier rounds.

## Source issues

- none
