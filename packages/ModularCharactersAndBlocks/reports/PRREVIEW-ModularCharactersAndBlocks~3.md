# Review of ModularCharactersAndBlocks (pull request #1775 at 4e678ad)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Independent AI review of the repaired head. Three findings, all P3, none blocking. The gate passes, the eleven findings of the previous review are repaired (checked one by one below), and the mathematics of all eight headline statements and of the sampled targets held up under the computed pass. No pull-request file was changed.

## Repairs of the previous review's findings

| Previous finding | Passage at this head | Status |
| --- | --- | --- |
| R01 nonexistent `groupAlgebraBaseChangeK0` | `README.md:69–72`, “the field-extension ring homomorphism `modRepK0.baseChange` (Layer 1)”; contract at `README.md:168–171` | Repaired: ModularInduction Layer 1 names `modRepK0.baseChange` on main (`ModularInduction/README.md:228`). |
| R02 failing targeted build | gate `build=0 OK`; `lake env lean` exits 0 with eight `sorry` warnings | Repaired. |
| R03 bijection of simples with blocks | `README.md:519–523`, surjections `Irr(G) → Bl(G)`, `IBr(G) → Bl(G)` with fibres; Check `README.md:534–535` (fibres `3` and `2`) | Repaired. |
| R04 duplicated `p`-part construction | `README.md:33–39` lists `TauCeti.pPart`, `TauCeti.pFreePart`, uniqueness, conjugation and order laws; §0.1 adds only sections | Repaired. |
| R05 complete-adic lifting not consumed | `README.md:322–327` applies `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` and `TauCeti.exists_projective_quotient_smul_top_linearEquiv` | Repaired. |
| R06 statable headlines absent | `Suggested.lean:42–162`: eight headlines; docstring `Suggested.lean:16–27` names the unstatable ones with their missing carriers | Repaired. |
| R07 orthogonality unspecified | `README.md:580–591`: index sets, conjugation, `Q* Q` block form, `|det Q|² = ∏ det c^u`, non-invertibility over `ℤ[ζ]_(p)`; Checks `README.md:601–609` | Repaired (values recomputed below, rows A26–A28). |
| R08 no locators | every target of Layers 0–8 carries theorem and page | Repaired, with the locator slips of R02 below. |
| R09 no Checks/Needs/Examples/Dependencies | each definition has three Checks; each layer ends with Examples and Dependencies | Repaired. |
| R10 imports and form | `Suggested.lean:1–4` `module`, `import Mathlib`, one Tau Ceti module; layer comments in README order | Repaired, except that `existsUnique_blockIdempotent_map_residue` sits under the Layer 4 comment while the README introduces it in §1.3 (folded into R01 below). |
| R11 pull-request citation | `README.md:84–85` cites LocalFiniteGroupTheory §L1 by name | Repaired. |

## R01 (P3) — A supplier name that does not exist at the pin, and one misplaced layer comment

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:50`, “`TauCeti.CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule`”.

**Claim:** This declaration exists at the pinned Tau Ceti under that name.

**Witness:** At Tau Ceti `358314d4`, `TauCeti/RingTheory/Idempotents/Simple.lean:73–88`: `end TauCeti` closes at line 73 and the theorem is declared at line 81 inside `namespace CompleteOrthogonalIdempotents`, so its name is `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` (root namespace). A scratch `#check @TauCeti.CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` is an unknown constant.

**Repair:** Write `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` at `README.md:50`, and keep its hypotheses in the contract: an Artinian ring, a complete family of primitive orthogonal idempotents, and it supplies a projective cover of each simple module by a principal left ideal. While there: move `existsUnique_blockIdempotent_map_residue` in `Suggested.lean` under a `/-! ## Layer 1 … -/` comment (the README states it in §1.3, `README.md:333–334`), or introduce it in §4.2 instead; the two must agree on the layer. The other 29 Tau Ceti and Mathlib names cited in `Scope and ownership` and `Exact supplier contracts` resolve at the pins (table below).

## R02 (P3) — Locators cited for statements the source does not make, and two targets without a locator

**Location:** `README.md:216` (§0.1), `README.md:684–689` (§6.3), `README.md:776–777` (§8.1), `README.md:406–413` (§2.3), `README.md:800–806` (§8.3).

**Claim:** The cited passages support the statements as written.

**Witness:**
- §0.1 cites Webb Lemma 9.3.4, p. 146 for the parametrization `g ↦ pFreePart p g` and the class bijection with the `p`-regular classes of `C_G(x)`. `webb` lines 6147–6158 state only the factorisation and the conjugacy of its two factors; a search of the text finds no section parametrization or class count.
- §6.3 states “`(Q, f)` is a `B`-Brauer pair exactly when `Br_Q(e_B) f ≠ 0`” under Craven Definition 2.10 and Theorems 2.11–2.12. `craven` lines 873–898 define `b`-Brauer pairs through the order `≤` and prove conjugacy of maximal pairs; the criterion is not stated there.
- §8.1 cites Sambale Theorem 1.23, p. 18 for “every block of `G/N` lies in the image of exactly one block of `G`”. `sambale` lines 542–545: the theorem assumes `N` a normal `p`-subgroup with `G/C_G(N)` a `p`-group and states that every block of `G` dominates exactly one block of `G/N`, the other direction. The README's own Check (`S₃`, `p = 3`, `N = C₃`: one block dominating two) lies outside its hypotheses. Martínez Corollary 8.2 (`martinez` line 1895) does support the sentence.
- §2.3 (residue-field splitting) and §8.3 (the kernel theorem) carry no source locator; §2.3 names only Mathlib's `littleWedderburn`, §8.3 only its route.

**Repair:** In §0.1 cite Webb 9.3.4 for the factorisation and conjugacy only and say that the parametrization and the class count `k(G) = ∑_x l(C_G(x))` are proved here from it and from `TauCeti.pFreePart_conj`. In §6.3 either prove the criterion as a target (route: Craven Lemma 2.7 along a chain `1 ⊴ … ⊴ Q` with `Br_Q = Br_Q ∘ Br_R` for `R ⊴ Q`, from §6.1's factoring bullet) or cite a text that states it (Alperin–Broué's Brauer-pair theorem, cited by locator as uncertified). In §8.1 drop Sambale 1.23 or cite it for what it says, keeping Martínez Corollary 8.2. Give §2.3 Webb Theorem 9.2.7, p. 144 (`webb` line 6054: a field containing a primitive `e`-th root of unity splits `G`; in characteristic `p` the hypothesis reduces to the `e'`-th roots) together with the Galois-descent route already written, and give §8.3 a locator for the principal-block kernel theorem (Navarro, *Characters and Blocks of Finite Groups*, Chapter 6, cited by locator as uncertified if its text is not readable). The three S₃ Checks of §§0.1, 6.3 and 8.3 were recomputed and hold (rows A01, A33, A45), so the repair is to the locators, not to the mathematics.

## R03 (P3) — The family index excludes the roadmap it now contains

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11–61` (the list of the family's roadmaps) and `:106–119`, “modular theory proper — Brauer characters, decomposition matrices, blocks with defect … — is out of scope for every roadmap here”.

**Claim:** The family index describes the family after this pull request.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `4e678ad`: the head restored main's index, which neither lists `ModularCharactersAndBlocks` nor amends the exclusion. The previous head `4e18c0d3` carried a list entry, a dependency bullet and an amended scope bullet for exactly this (shown by `git diff 5fe14341~1 4e18c0d3 -- TauCetiRoadmap/RepresentationTheory/README.md`). The pull-request description still says it updates the index and the scope boundaries.

**Repair:** Restore the three edits of `4e18c0d3` to the family index: the list entry after ModularInduction, the “ordinary and modular character theory share the algebraic foundations” dependency bullet, and the scope bullet that names ModularCharactersAndBlocks as the owner of Brauer characters, decomposition matrices and blocks with defect while keeping the exclusion of the modular theory of symmetric groups. The family index is this pull request's own file; the top-level README list is regenerated after merge and is not touched.

## Verified sound

**Gate and build.** The worker's gate at `4e678ad` reads `set_option=0 … depcheck=0 … build=0 OK`, every check passing. Independent `lake env lean TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean` from the pull-request worktree exited 0 with exactly the eight `declaration uses sorry` warnings at lines 42, 56, 73, 99, 117, 127, 139, 153. The worktree head is `4e678ad262543dfcf9b09fd127f26cfe949c2eba` and clean; the outside-folder diff (`origin/main...HEAD` excluding the folder and the family index) is empty.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 235 roadmaps, 2180 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. Every `*Needs:*` line and supplier citation was resolved: SemisimpleAlgebras Layers 0–2 (`SemisimpleAlgebras/README.md:169–232`), QuiverRepresentations Layer 3 (`QuiverRepresentations/README.md:270`), GrothendieckEulerForms Layers 2 and 4 (`GrothendieckEulerForms/README.md:238,331`), ModularInduction Layers 0, 1, 3 with `modRepK0.baseChange` (`ModularInduction/README.md:174,202,228,257`), CharacterTheory §3.5, §4.3, §4.5 (`CharacterTheory/README.md:497,741,817`; §3.5 names `TauCeti.sum_characterTable_mul_conj`, §4.3 names `TauCeti.Representation.centralCharacter`), InductionRestriction Layer 6 (`InductionRestriction/README.md:661`), all on main; GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and §R17.5.12 at its open head `769f46a` (the Brauer character for a fixed `τ : μ_m(k) ≃ μ_m(ℂ)`, its value at `1`, conjugacy invariance, additivity, lattice comparison, recognition of composition factors; Fong–Swan) — that roadmap precedes this one in the merge order; LocalFiniteGroupTheory L1 at its open head `0c409c9` (`pCore p H`, `piCore`, `pPrimeCore p H`, with `O_{p'}` as `piCore {q | q ≠ p}`), a new-folder pull request by another author, not yet in the merge order, which the dependency check accepts. GlaubermanZStar (open head `581115c`) is the only consumer and is later in the order. No supplier is cited by pull-request number.

**Pinned declarations opened** (Tau Ceti `358314d4`, Mathlib `f6090c70`; paths relative to the library):

| Declaration | File:line | What it supplies / does not |
| --- | --- | --- |
| `TauCeti.pFreePart`, `pPart`, `eq_pFreePart`, `eq_pPart`, `pPart_mul_pFreePart`, `pFreePart_conj`, `pPart_conj`, `orderOf_pFreePart`, `orderOf_pPart` | `TauCeti/GroupTheory/OrderOfElement/PPart.lean:69,170,132,272,199,208,215,120,245` | Factorisation, uniqueness, conjugation and order formulas; `commute_pFreePart_pPart` is documented at line 37. |
| `TauCeti.pSectionIndicator` | `TauCeti/RepresentationTheory/Induction/PElementary.lean:91` | Sections indexed by the `p`-free part, as the README says. |
| `TauCeti.IsPrimitiveIdempotent` | `TauCeti/RingTheory/Idempotents/Primitive/Basic.lean:88` | Structure with nonzero, idempotent, indecomposable. |
| `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` | `…/Primitive/Decomposition.lean:48` (docstring), left Artinian rings | Existence only; uniqueness there is up to isomorphism of left ideals. |
| `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` | `TauCeti/RingTheory/Idempotents/Simple.lean:81`, root namespace | R01. |
| `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` | `TauCeti/RingTheory/AdicCompletion/Idempotent.lean:75` | Lifts along `f` with kernel `I • S`, `S` adically complete. |
| `TauCeti.exists_projective_quotient_smul_top_linearEquiv` | `TauCeti/Algebra/Module/Projective/Lift.lean:89` | Lifts a direct summand of a reduction. |
| `TauCeti.IsProjectiveCover`, `exists_isProjectiveCover_of_finite`, `Ideal.nonempty_linearEquiv_of_quotient_smul_top` | `…/ProjectiveCover/Basic.lean:106`, `…/Existence.lean:195`, `…/Projective/Reduction.lean:73` | As cited. |
| `TauCeti.cartanMap`, `cartanMatrix`, `cartanMatrix_apply` (`[P j : S i]`), `projectiveSimplePairing`, `projectiveSimplePairing_isPerfPair` | `…/CartanMap/Basic.lean:386`; `…/GrothendieckGroup/CartanMatrix.lean:138,148,77,115` | Orientation rows simples, columns projectives, as in Conventions. |
| `TauCeti.ExactK0`, `finiteModulesExactStructure`, `resK0`, `indK0`, `reductionK0` | `…/GrothendieckGroup/Exact.lean:163`; `…/CartanMap/RestrictScalars.lean:90`; `…/GroupAlgebra/Restriction.lean:70`, `Induction.lean:91`, `LatticeDefect/Basic.lean:96` | `reductionK0` takes a `Representation ℤ G W`, so ℤ-forms only, as the README says. |
| `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` | `…/Induction/Brauer/Induction.lean:82` | Ordinary Brauer induction. |
| `TauCeti.sum_characterTable_mul_conj` | `…/CharacterTable/Table.lean:591` | `∑_i χ_i(C) conj χ_i(C') = |G|/|C|` if `C = C'`, else `0`; `|G|/|C| = |C_G(g)|`, as the README writes. |
| `TauCeti.Representation.primitiveCentralIdempotent`, `TauCeti.Representation.centralCharacter` | `…/CharacterTable/CentralIdempotent.lean:303`; `…/CharacterTable/CentralCharacter.lean:91` (`namespace TauCeti` + `Representation`) | The first needs algebraically closed `k`, finite dimension, irreducibility, `|G|` invertible, as the contract says. |
| `TauCeti.Cyclotomic.complexRoot`, `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` | `TauCeti/RingTheory/Cyclotomic/Basic.lean:460`; `…/Induction/Cyclotomic/SplittingField.lean:107` | As cited. |
| `MonoidAlgebra` (`ofCoeff`, `coeff`), `MonoidAlgebra.mapRingHom`, `MonoidAlgebra.lift` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:76–80`; `MapDomain.lean:310`; elaborated type `(M →* A) ≃ (MonoidAlgebra R M →ₐ[R] A)` | `lift k k G 1` is the coefficient sum. |
| DVR instance on `adicCompletionIntegers` | `Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean:75` | As cited. |
| `Subgroup.pCore` | absent from Mathlib at the pin (searched) | Consistent with the docstring claim that `O_{p'}(G)` is not at the pins. |

**Lean form and signatures.** `#check @name` for all eleven declarations was elaborated in a scratch copy; the types agree with the worker's `signatures.md` and with the README: `IsBlockIdempotent` over any `CommRing R`; `complete_blockIdempotents_unique`, `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero`, `brauerProjection_mul` over any field (with `[CharP k p]` where the README says characteristic `p`); `card_simpleModules_eq_card_pRegularClasses`, `brauer_first_main`, `brauer_third_main_local` over an algebraically closed field, as the README's bullets say; `existsUnique_blockIdempotent_map_residue` over a complete DVR without a residue-characteristic hypothesis, matching §1.3. No section binder was lost: every `[Finite G]`, `[CharP k p]`, `[IsAlgClosed k]`, `IsPGroup` and augmentation hypothesis is in the declaration's own signature. The file has one module docstring in the required form, `theorem` only, docstrings on every declaration, `import Mathlib` plus one existing Tau Ceti module, no `set_option`, no sorry'd data (`brauerProjection` and `IsDefectGroup` have real bodies on native carriers), no `example`.

**Padding probe.** Each of the eight sorried theorems was tried with `first | (simp; done) | rfl | infer_instance` on the scratch copy; all eight failed to close (eight `probe` errors). None restates a definition, mirrors a Check or computes a value. `complete_blockIdempotents_unique` is the weakest headline (it follows from the pinned left-ideal uniqueness plus commutativity of the centre), but it is a genuine theorem about the roadmap's objects and is not padding under the brief's criteria.

**Headline inventory.** README summary (`README.md:12–19`): Brauer's count (stated), `C = Dᵀ D` (not statable: needs Brauer characters and a DVR reduction into `G₀(k[G])`, which the pin lacks), the `O[G]`/`k[G]` block bijection (stated), orthogonality of generalized decomposition numbers (not statable: Brauer characters of centralizers), conjugacy of defect groups (stated), Sylow defect of the principal block (stated), first main theorem (stated), second main theorem (not statable), local third main theorem (stated), kernel theorem (not statable: block partition of `Irr(G)` through a modular system, and `O_{p'}(G)`). The docstring names each unstatable headline with its missing carrier. The pinned `reductionK0` takes ℤ-forms only (`LatticeDefect/Basic.lean:96`), so the claim that stable-lattice reduction is absent was checked, not taken on trust.

**Ownership.** `roadmaps grep` over the open heads and main for “defect group”, “Brauer character”, “principal block”, “decomposition matrix”, “Brauer homomorphism”: on main only ModularInduction (which says it avoids Brauer characters), ClassFieldTheory (citing ModularInduction) and the family index's exclusion sentence; among open pull requests only GlaubermanZStar (consumer), GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (cited as supplier) and AbelianSurfacesModularity (A₅-specific tables). No other roadmap declares `IsBlockIdempotent`, `brauerProjection`, `IsDefectGroup` or `brauer_first_main`. This folder owns the general block theory. Ownership against open pull requests whose files the brief does not supply was not checked beyond that index search.

**Sources and the seeded sample.** All seven cached texts were opened at the cited locators. Printed-page offsets: `webb` printed = PDF marker − 7 (PDF page 160 carries printed 153), `martinez` printed = PDF − 8, `sambale` printed = PDF, `craven` printed = PDF − 5. Every page number cited in the README for Webb (29 labels), Sambale (13), Martínez (29) and Craven (7) agrees with the text at that offset.

| Sampled target | Text opened (source line) | Result |
| --- | --- | --- |
| 0.1 Sections | `webb` 6147–6158 (Lemma 9.3.4, p. 146); `martinez` 165–167 (p. 3) | Factorisation and conjugacy supported; parametrization and class count not at the locator (R02). |
| 1.1 Splitting modular system | `webb` 6220–6234 (§9.4, p. 148: triple, roots of unity have valuation 1, Brauer's theorem gives splitting); CharacterTheory §4.5 on main | Supported. |
| 1.2 Stable lattices | `webb` 6434–6446 (Thm 9.4.8, p. 153, Brauer–Nesbitt, any `p`-modular system); `martinez` 189–200 (Thm 1.7, Lemma 1.8, p. 4) | Supported; the class equality is in `G₀`, not an isomorphism (Check 2 is the correct negative control). |
| 1.3 Lifting | `webb` 6276–6298 (Prop 9.4.3, p. 149: complete DVR, orthogonal lifts, primitive iff lift primitive), 6334–6345 (Prop 9.4.5, p. 151) | Supported; the added central-uniqueness claim is a target here. |
| 2.3 Residue splitting | `webb` 6054–6056 (Thm 9.2.7, p. 144) | The e-th-root version exists; no locator in the README (R02). The route is sound: Brauer-character values lie in `𝔽_p(ζ_{e'})`, Galois-stable simples descend because finite division rings are fields. |
| 4.1 Ordinary idempotents | CharacterTheory §3.5 on main, `CentralIdempotent.lean:303` | Supported, formula `χ(1)|G|⁻¹ ∑ χ(g⁻¹) g` matches. |
| 4.3 Principal block | `sambale` 335–337 (Def 1.2, p. 14) | Definition by the trivial module; the augmentation characterization is the README's own equivalent (row A17). |
| 5.2 Orthogonality | `sambale` 465–474 (Thm 1.14, p. 16): `∑_{χ∈Irr(B)} d^u_{χφ} conj(d^v_{χψ}) = c_{φψ}` iff `u = v`, `b_u = b_v`, `b_u^G = B`; `martinez` 451–456 (Cor 2.4, p. 11); `axiom-section` 17–22 | Supported, including the block form; the unblocked form follows by summing over `B`. |
| 6.1 Traces and Brauer map | `webb` 10047–10051 (Prop 12.4.1, p. 238), 10341–10373 (Lemma 12.5.3, Cor 12.5.4, pp. 245–246), 9091–9098 (Lemma 11.6.8(2), p. 215); `martinez` 894–919 (Thm 4.1, p. 23) | Supported; Rosenberg's lemma has exactly the finite-generation hypothesis the README states. |
| 6.2 Defect groups | `webb` 10292–10298 (Thm 12.5.2, p. 244, any field of characteristic `p`), 10384–10387 (Cor 12.5.5), 10173–10177 (Thm 12.4.5), 10199–10202 (Cor 12.4.7, p. 242), 9906–9910 (Cor 12.3.2), 6800–6809 (Thm 9.6.1); `sambale` 350–356; `martinez` 703–706, 869–874, 948–949 | Supported; Webb's chapter 12 works over any field of characteristic `p`, so the field-general Lean statements are at the source's generality. |
| 6.3 Brauer pairs | `craven` 814–816 (Def 2.6, p. 22), 823–827 (Lemma 2.7), 847–849 (Def 2.8, p. 23), 856–870 (Lemma 2.9, p. 24), 873–877 (Def 2.10), 891–898 (Thms 2.11–2.12, p. 25) | Definitions and uniqueness/conjugacy supported; the `Br_Q(e_B) f ≠ 0` criterion not at the locator (R02). |
| 7.2 Second main theorem | `sambale` 438–440 (Prop 1.11), 445–447 (Thm 1.13, p. 16) | Supported, with `b^G` defined by Prop 1.11. |
| 7.3 Third main theorem | `sambale` 478–480 (Thm 1.15, p. 17, both directions under `C_G(D) ⊆ H`); `martinez` 1370–1372 (Cor 5.9, p. 35, one direction); `axiom-third` 45–51 | Supported; the local Lean form matches the Axiom statement's hypotheses `P ≤ H`, `C_G(P) ≤ H ≤ N_G(P)`. |
| 8.2 Normal `p'`-subgroups | `martinez` 1928–1934 (Thm 8.5(iii), p. 52), 1638–1641 (Def 7.3), 1710–1715 (Thm 7.7); `sambale` 547–549 (Thm 1.24, p. 18) | Supported. |
| 8.3 Kernel theorem | LocalFiniteGroupTheory L1 at `0c409c9` (`pPrimeCore`); no text locator | Route checked (row A45); locator missing (R02). |

Also checked outside the sample: §2.1 against `webb` 7179–7199 (Prop 10.1.3, p. 170: dual via inverse, tensor, additivity, lattice comparison) and `martinez` 1385–1388 (§6.1, p. 37, the induction formula `|H|⁻¹ ∑_g α̃(g x g⁻¹)`); §2.2 against `webb` 6167–6169 (Thm 9.3.6, p. 147, splitting field) and 7438–7445 (Thm 10.2.2, p. 176); §2.4 against `webb` 7703–7714 (Prop 10.3.2, p. 182) and 6518–6523 (Thm 9.4.11, p. 155); §3.1 against `webb` 7383–7386 (Prop 10.2.1, p. 174), 6670–6676 (Thm 9.5.4, p. 159, complete `R`), 6712–6713 (Cor 9.5.6), 7720–7723 (Cor 10.3.3), `martinez` 264 and 300 (Prop 1.12, Cor 1.13); §4.2 against `martinez` 365–376 (Def 2.1, Thm 2.2) and 648–672 (Thms 2.11–2.12, p. 15), `sambale` 367–379 (Def 1.6); §7.1 against `sambale` 424–444 (Def 1.10, Prop 1.11, Thm 1.12), `martinez` 1004–1007 (Thm 4.5), 1055–1059 (Cor 4.6), 1085–1088 (Thm 4.10); §8.1 against `martinez` 316–327 (Thm 1.14, p. 6) and 1895–1896 (Cor 8.2). All supported except as recorded in R02.

**Adversarial computations.** `r = (123)`, `t = (12)`; ordinary rows of `S₃` are trivial, sign, standard with values `(1,1,1)`, `(1,−1,1)`, `(2,0,−1)` on `(1, t, r)`; `e₀ = 1 + r + r²`, `e₂ = r + r²` in `𝔽₂[S₃]`. A “pass” is an instance check, not a proof.

| Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| A01 §0.1 sections and class count | `S₃`, `p = 2`; `p = 3`; `C₆`, `p = 2` | `p=2`: sections of `1`, `t` have `3`, `3` elements; `2` regular classes of `S₃` + `1` of `C₂` = `3` = `k(S₃)`. `p=3`: sizes `4`, `2`; `2 + 1 = 3`. `C₆`: `g = g³·g⁴`, orders `2·3 = 6` | Pass | Locator only (R02). |
| A02 §0.2 `IsBlockIdempotent` | `𝔽₂[C₂]`, `𝔽₃[C₂]`, zero ring | `(1+t)² = 2(1+t) = −(1+t)` in `𝔽₃`, so `e₊ = −(1+t)` idempotent; `e₊ e₋ = −(1−t²) = 0`; `e₊ + e₋ = −2 = 1`; `ε = 1 + t` in `𝔽₂[C₂]` has `ε² = 0`; zero ring: `1 = 0` fails `ne_zero` | Pass | — |
| A03 §0.2 scalar extension splits blocks | `𝔽₂[C₃] → 𝔽₄[C₃]`, `α² + α + 1 = 0` | `(1 + α²r + αr²) + (1 + αr + α²r²) = (α + α²)(r + r²) = r + r²`; each summand is `∑ ζ^{−j} r^j` for `ζ = α, α²`, idempotent since `3 = 1` | Pass | — |
| A04 `complete_blockIdempotents_unique` | `𝔽₃[C₂]`: families `(e₊,e₋)`, `(e₋,e₊)`; empty family | swap matches; empty family sums to `0 ≠ 1`, excluded by completeness | Pass | — |
| A05 §0.2 Example | `𝔽₂[S₃]`, `𝔽₃[S₃]` | `e₀ e₂ = (1+r+r²)(r+r²) = 2(r+r²) = 0`; `e₀ + e₂ = 1`; `𝔽₃[S₃]`: `O_3 = C₃` with `C_G(C₃) = C₃ ⊆ C₃`, one block | Pass | — |
| A06 §1.1 system | `e = 1`; `e = 3, p = 2`; `e = 3, p = 3` | `(ℚ_p, ℤ_p, 𝔽_p)`; `X² + X + 1` irreducible over `𝔽₂`, so `ℚ₂(ζ₃)` unramified with residue `𝔽₄`; `ℚ₃(ζ₃)` ramified (`(1−ζ₃)² ∼ 3`), residue `𝔽₃`, `e' = 1` | Pass | — |
| A07 §1.1 residue field generated by `ζ̄_{e'}` | `e = 12`, `p = 2` | `ζ₄ ↦ 1`, residue field `𝔽₂(ζ̄₃) = 𝔽₄` | Pass | — |
| A08 §1.2 lattice classes | `G = 1`, `O` vs `mO`; `C₂`, `p = 2`, `O[C₂]` vs `O(1+t) ⊕ O(1−t)` | `O/mO ≅ mO/m²O`, class `1`; `t(1+t) = 1+t`, `t(1−t) = −(1−t)`, basis determinant `−2 ≠ 0` in `K`, reduction `k ⊕ k` (trivial), class `2` = class of the nonsplit regular module | Pass | — |
| A09 §1.3 lifts | `ℤ₂`, `C₃`; `ℤ₂`, `C₂` | `(1+r+r²)/3` reduces to `e₀` (`3⁻¹ ≡ 1 mod 2`); complement `1 − (1+r+r²)/3 = (2−r−r²)/3` reduces to `e₂`; `(1±t)/2 ∉ ℤ₂[C₂]`, only block `1` | Pass | — |
| A10 `existsUnique_blockIdempotent_map_residue` | `G = 1`; residue characteristic `0` (`O = ℂ[[T]]`, `G = C₂`) | `O` domain: idempotents `0, 1` lift uniquely; `ℂ((T))`-case: `(1±t)/2 ∈ O[C₂]` lift the two blocks of `ℂ[C₂]`; idempotents in `m·Z(O[G]) ⊆ rad` are `0`, so lifts are unique and primitivity transfers | Pass; no `CharP` needed | — |
| A11 §2.1 Brauer character conventions | `C₃` over `𝔽₄`, `r ↦ α`, `α ↦ ζ₃` | values `(1, ζ₃, ζ₃²)`; dual `(1, ζ₃², ζ₃)`; trivial `𝔽₂[C₃]`-module `𝔽₂²`: trace `0`, Brauer value `2` | Pass | — |
| A12 §2.1 induced formula | `Ind_1^{S₃}(1)`, `p = 2` | `|H|⁻¹ ∑_x φ(x g x⁻¹)`: at `1`: `6`; at `r`: `0`; `2(1,1) + 2(2,−1) = (6, 0)` | Pass | — |
| A13 `card_simpleModules_eq_card_pRegularClasses` | `S₃`, `p = 3`; `p = 2`; `C_p`; trivial group | `2` simples / `2` classes (`1`, `t`); `2` / `2` (`1`, `r`); `1/1`; `1/1`; over `𝔽₂` and `C₃` the count `2 ≠ 3` is excluded by `IsAlgClosed` | Pass | — |
| A14 §2.2 independence | `S₃`, `p = 3` | Brauer table `[[1,1],[1,−1]]`, `det = −2 ≠ 0` in `ℂ` | Pass | — |
| A15 §2.3 splitting | `C₃` over `𝔽₂` vs `𝔽₄`; `S₃` over `𝔽₂` | `𝔽₂[C₃] = 𝔽₂ × 𝔽₄`, simples of dimension `1, 2`; `𝔽₄[C₃] = 𝔽₄³`; `𝔽₂[S₃]`: `End` of the `2`-dim simple is `𝔽₂` (it is `𝔽₂ ⊗` the standard module), so `𝔽₂` splits although `e' = 3` | Pass (sufficiency, not necessity) | Locator (R02). |
| A16 §2.4 decomposition matrices | `S₃`, `p = 3`; `p = 2`; `C₂` | `(2,0) = (1,1) + (1,−1)` gives `D = [[1,0],[0,1],[1,1]]`; `p=2`: `D = [[1,0],[1,0],[0,1]]`; `C₂`: `[[1],[1]]`, rank `1 < 2` | Pass | — |
| A17 §2.4 surjectivity route | `E = C₃ × C₂`, `p = 2` | Sylow `C₂` normal; simples inflate from `C₃`, three of them, lifted by `ζ₃^j`; `D` for `E` is `[[1,0,0],[1,0,0],[0,1,0],[0,1,0],[0,0,1],[0,0,1]]`, image rank `3` | Pass | — |
| A18 §3.1 `C = Dᵀ D` | `S₃`, `p = 3`; `p = 2`; `C_p` | `[[2,1],[1,2]]`, `det 3`; `diag(2,1)`, `det 2`; `[p]` | Pass | — |
| A19 §3.1 projective characters | `S₃`, `p = 3`: `Φ_1 = 1 + std`, `Φ_sgn = sgn + std` | at `r`: `1 − 1 = 0`, `1 − 1 = 0`; degrees `3, 3`; `3 = |S₃|_3` divides both (Cor 1.13) | Pass | — |
| A20 §3.1 pairing | `S₃`, `p = 3`, classes `1` (size 1), `t` (size 3) | `⟨Φ_1, φ_1⟩ = (3·1 + 3·1·1)/6 = 1`; `⟨Φ_1, φ_sgn⟩ = (3 − 3)/6 = 0` | Pass; denominator `|G| = 6` | — |
| A21 §3.1 orientation Check | path algebra of `A₂` | native `[[1,0],[1,1]]` (rows simples) vs transpose `[[1,1],[0,1]]`; distinguishes | Pass | — |
| A22 §4.1 ordinary idempotents | `C₂` over `ℚ₂`; `C₃`, `K ∋ ζ₃` | `e_± = (1±t)/2`, product `0`, sum `1`; `e_j = ⅓(1 + ζ₃^{−j} r + ζ₃^{−2j} r²)`, `∑_j e_j = ⅓(3 + 0·r + 0·r²) = 1` | Pass | — |
| A23 §4.2 central characters | `S₃`, `p = 3`, class sum of `t` | `ω = |C|χ(t)/χ(1)`: `3, −3, 0`; mod `2`: `1, 1, 0` → `{1, sgn}`, `{std}`; mod `3`: all `0`, one block | Pass; matches Checks | — |
| A24 §4.2 fibres | `S₃`, `p = 3` | `|Irr| = 3`, `|IBr| = 2`, `|Bl| = 1`; fibres `3`, `2` | Pass (R03 of r2 settled) | — |
| A25 §4.3 augmentation | `𝔽₂[S₃]`; `G = 1` | `aug(e₀) = 3 = 1`, `aug(e₂) = 2 = 0`; `aug` is an algebra map `Z(k[G]) → k`, so exactly one block has value `1` | Pass | — |
| A26 §5.1 generalized numbers | `C₃`, `p = 3`, `u = r`; `S₃`, `p = 3`, `u = r`; `S₃`, `p = 2`, `u = t` | `χ_j(r·1) = ζ₃^j`; `d^r = (1, 1, −1)`; `C_G(t) = C₂`, `d^t = (1, −1, 0)` | Pass | — |
| A27 §5.2 `Q* Q` | `C₂`, `p = 2`; `S₃`, `p = 3`; `S₃`, `p = 2` | `[[1,1],[1,−1]]`: Gram `diag(2,2)`, `det = −2`, `|det|² = 4 = 2·2`; `[[1,0,1],[0,1,1],[1,1,−1]]`: Gram `diag([[2,1],[1,2]], 3)`, `det = −3`, `9 = 3·3`; `[[1,0,1],[1,0,−1],[0,1,0]]`: Gram `diag(2,1,2)`, `det = 2`, `4 = 2·2` (`det c^1 = det diag(2,1) = 2`, `det c^t = 2`) | Pass | — |
| A28 §5.2 block form, `g = h = 1` | `S₃`, `p = 2` | `∑_{B₀} χ(1)² = 2 = c^1_{11}·1²`; defect-zero `4 = 1·2²`; total `6 = |C_G(1)|` | Pass | — |
| A29 §5.2 conjugation | `C₃`, `p = 3`, `u = v = r` | with `conj`: `1+1+1 = 3 = c^r`; without: `1 + ζ₃² + ζ₃ = 0` | Pass; `conj` is necessary | — |
| A30 §5.2 section orthogonality | `S₃`, `p = 2`, `B₀`, `g = 1`, `h = t` | `1·1 + 1·(−1) = 0`; defect zero: `2·0 = 0` | Pass | — |
| A31 `brauerProjection_mul` and controls | `S₃`, `p = 2`, `P = ⟨t⟩`, `x = y = r + r²`; `x = r, y = r²`; over `ℚ`; `P = C₃` in char `2` | `x² = r² + 2 + r⁴ = x`, `Br(x) = 0 = Br(x)²`; `Br(r r²) = Br(1) = 1 ≠ 0 = Br(r)Br(r²)`; over `ℚ`: `Br(x²) = 2 ≠ 0`; `P = C₃`, `x = t + s + u`: `x² = 3 + 3(r + r²) = 1 + r + r²`, `Br_{C₃}(x) = 0` | Pass; each hypothesis is needed | — |
| A32 `IsDefectGroup`, `isDefectGroup_conj` | `S₃`, `p = 2`, `e₀`, `e₂`; `C₃`, `p = 2`; `e = 0` | `Br_{⟨t⟩}(e₀) = 1`, three conjugate maximal `C₂`'s; `Br_{⟨t⟩}(e₂) = 0`, defect `1`; `C₃`: only `p`-subgroup is `1`, defect `1` (without the `p`-group condition `C₃` itself would be maximal); `e = 0` has no defect group | Pass | — |
| A33 §6.3 pairs | `S₃`, `p = 2`, `Q = ⟨t⟩`; `Q = 1`; `C_p` | `C_G(Q) = Q`, single block `1`; `Br_Q(e₀)·1 = 1 ≠ 0`, `Br_Q(e₂)·1 = 0`; `(1, f)` is a `B`-pair iff `e_B f ≠ 0` iff `f = e_B`; `(C_p, 1)` maximal | Pass | Locator (R02). |
| A34 `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `S₃`, `p = 2`; `G = 1`; `p ∤ |G|` (`C₃`, `p = 2`) | defect groups of `e₀` = the three `C₂` = Sylow; trivial group: `1 = 1`; `C₃`: Sylow `= 1`, `Br_1(e₀) = e₀ ≠ 0` | Pass | — |
| A35 §6.2 defect zero | `S₃`, `p = 2`, `e₂` | `|S₃|_2 = 2 ∣ std(1) = 2`; `D`-block `[[1]]`, `C = [1]`; `std` simple projective | Pass | — |
| A36 §6.2 `O_p(G)` | `S₃`, `p = 3` | `O_3 = C₃`, unique block with defect `C₃ ⊇ C₃` | Pass | — |
| A37 `brauer_first_main` | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; `p = 3`, `D = C₃` | `N_G(D) = D`, `k[C₂]` one block of defect `C₂` ↔ `e₀`; `e₂` not hit; `D = 1`: `N = G`, identity on `e₂`; `D = C₃`: `N = S₃`, identity on the single block; `Br_D(e₀)·1 = 1 ≠ 0` | Pass | — |
| A38 §7.1 `Br_P(e_B) = ∑_{b^G = B} e_b` | `S₃`, `p = 2`, `P = H = ⟨t⟩` | `Br_P(e₀) = 1 = e_{B₀(C₂)}`, `Br_P(e₂) = 0`, no block of `C₂` induces to `e₂` | Pass | — |
| A39 §7.2 second main | `S₃`, `p = 2`, `u = t`; `p = 3`, `u = r`; `C₂ × C₃`, `p = 2` | `d^t = (1,−1,0)` nonzero exactly on `Irr(B₀)`; `d^r = (1,1,−1)`, one block; `C_G(u) = G`, three blocks each inducing itself | Pass | — |
| A40 `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1`, `H = G`; `S₃`, `p = 3`, `P = C₃`, `H = S₃` | `Br_P(e₀) = 1`, `1·1 ≠ 0`, `aug(1) = 1 ≠ 0`; `P = 1`: `e₀ e₀ = e₀ ≠ 0`, `e₀ e₂ = 0`, `aug(e₂) = 0`; single block, both sides true; converse direction: `aug ∘ Br_P(K⁺) = |K ∩ C_G(P)| ≡ |K| mod p`, so `B₀(H)^G = B₀(G)` | Pass, both directions | — |
| A41 §7.3 Example | `A₄`, `p = 2`, `P = V₄` | `N_G(V₄) = A₄`, `C_G(V₄) = V₄`; `C_G(O_2) ⊆ O_2` gives one `2`-block; degree `3` not divisible by `4`, consistent | Pass | — |
| A42 §8.1 normal `p`-subgroups | `S₃`, `p = 3`, `N = C₃`; `C_p`; `N = 1` | image of `1` is `1 = e₊ + e₋` in `𝔽₃[C₂]` (two blocks); `G/C_G(N) = C₂` is not a `3`-group, so Sambale 1.23 does not apply (R02) | Pass | Locator (R02). |
| A43 §8.2 `e_N` | `S₃`, `p = 2`, `N = C₃` | `e_N = 1 + r + r²` (`3 = 1`), `e_N² = 3e_N = e_N`; `k[S₃]e_N` has basis `e_N`, `t e_N`, `(t e_N)² = e_N`: it is `𝔽₂[C₂]` | Pass | — |
| A44 §8.2 covering | `S₃`, `p = 2`, `N = C₃`, `std` | `std|_{C₃} = ζ₃ + ζ₃²`, orbit `{ζ₃, ζ₃²}`, block `e₂` | Pass | — |
| A45 §8.3 kernel theorem and route | `S₃`, `p = 2`; `p = 3`; `C_p` | `ker 1 ∩ ker sgn = C₃ = O_{2'}`; `std` faithful, `1 = O_{3'}`; `C_p`: all characters, intersection `1 = O_{p'}`, while the simple module has kernel `C_p` (containment only); route: `Φ_1 = 1 + sgn` on `S₃` at `p = 2` is constant on `C₃`-cosets with `Φ_1(1) = 2 ≠ 0` and vanishes at `t`, so `K ⊆ C₃` | Pass | Locator (R02). |
| A46 Conventions pairing | `S₃`, trivial vs sign | `⟨1, sgn⟩ = (1 − 3 + 2)/6 = 0`; `⟨1,1⟩ = 1` | Pass | — |
| A47 Layer 8 Example | `C_p`; `C₃`, `p = 2` over `𝔽₄`; `S₃` | `D = [1;…;1]`, `C = [p]`; `D = C = I₃`, three defect-zero blocks; `S₃` matrices as A16, A18 | Pass | — |
| A48 §1.3 reduction `Z(O[G]) → Z(k[G])` surjective | `C₂`, `ℤ₂` | class sums `1, t` are an `ℤ₂`-basis and reduce to the `𝔽₂`-basis `1, t` | Pass | — |

## Not verifiable

- **Serre (`serre`).** Settled as uncertified; cited by locator only (`README.md:853–854` says so). Not requested.
- **The criterion of §6.3 and the kernel theorem of §8.3** have no readable source at the cited locators (R02); they were checked on instances only (rows A33, A45), not certified from a text.
- **Navarro and Alperin** are not in the cache and were not requested this round; the previous review recorded both as paywalled. The repair of R02 may cite them by locator as uncertified.
- **Open pull requests without supplied files** were searched only through the roadmap index (`roadmaps grep`), not read.

## Source issues

- **Misprint** in webb at Example 12.5.6, printed p. 246: the source says that `e₁` has defect group `1` after saying `e₁` has Sylow defect; it should say `e₂` has defect group `1`; affects nothing.
- **Misprint** in martinez at Theorem 4.10, Claim 2, printed p. 28 (`martinez` line 1105): the source says defect groups of `b` are contained in defect groups of `b`; it should be of the induced block `b^G`; affects the proof.
- **Misprint** in martinez at Theorem 5.8 and its proof, printed pp. 34–35 (`martinez` lines 1356, 1365, 1369): the source writes `e^G` in the conclusion and later uses undeclared `e` and `ξ`; it should be `c^G`, `c` and `ψ`; affects a stated result.
- **Misprint** in martinez at Theorem 8.8's proof, printed p. 54 (`martinez` lines 1994–1995): the source says induction to `N_G(P)` twice; it should be `N_G(D)`; affects the proof.
