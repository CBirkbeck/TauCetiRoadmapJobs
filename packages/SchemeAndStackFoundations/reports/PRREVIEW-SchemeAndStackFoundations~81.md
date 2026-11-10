# Review of SchemeAndStackFoundations (pull request #1276 at a5411fa)

**Verdict:** needs changes

Full review of the repaired head (755 changed lines since `6da2b17`). Five findings, one blocking.

- **Carried, blocking.** R01: this roadmap and JacobianChallenge still supply each other. The Layer A–B edges are gone; the Layer C–F edges remain.
- **New, P3.** R02 and R03 are two more objects the pinned Tau Ceti already has. R04 is a page locator. R05 is the pull-request description, which still describes the head before the merge of main.

## Previous findings (review of `6da2b17`)

- **R01 (branch pin, 20 restated carriers) — repaired.** `lake-manifest.json` now pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the pins of `origin/main`. `Suggested.lean` imports 22 `TauCeti.*` modules and states its theorems on the Tau Ceti carriers: for example "`TauCeti.Ring.IsNagata A`" (`:131`), "`Xbar₁.IsProjectiveOver k ∧ TauCeti.AlgebraicGeometry.IsRegular Xbar₁`" (`:1043`), "`α ∈ RatEquiv (∐ X) k`" with `open TauCeti.AlgebraicGeometry.Chow` (`:1130`, `:1146`). The two aliases that remain, `PseudoCoherence.IsPseudoCoherentModule` and `Proetale.IsReplete`, are `abbrev`s of the Tau Ceti predicates, kept as the names AdicEtaleGeometry and EnhancedDerivedSheaves import (both build in the gate's targeted build). One restated carrier was missed by that list: R03 below.
- **R02 (§1.8 locality) — repaired.** `README.md:2349–2352`: "It does **not** follow from Mathlib's `IsLocalAtSource` and `IsLocalAtTarget` … (Example 35.32.2 (04QY) satisfies both and fails it). By Lemma 35.32.6 (04R2) it does follow from these two together with stability under postcomposition with open immersions". The three comparison targets are stated under the three conditions, and 04QY is a negative-control Check (`:2377–2386`). I re-read 04QY, 04QZ and 04R2 at `stacks-project` lines 144493–144534, 144538–144545 and 144637–144642 (book text); the README's `P`, the square and the failing third condition match.
- **R03 (JacobianChallenge) — partly repaired.** `README.md:536–548` now takes Layers A–B and affine flat base change from Tau Ceti ("The objects of its Layers A–B and flat base change over an affine base are consumed from Tau Ceti, where they are built"). Layers C–F are still suppliers. Carried as R01.
- **R04 (Poonen locator) — repaired.** `Suggested.lean:334`: "Stacks, Lemma 80.11.1 (04SK); Poonen, Remark 6.5.11, p. 182."; `README.md:2635–2637` says the same and scopes Theorem 6.5.10 (i).
- **R05 (§2.7 Check) — repaired.** `README.md:3648–3651`: "`Γ(Z, i⁻¹O) = O_{𝔸¹,0} = k[t]_{(t)}` and the closed subscheme has `Γ(Z, O_Z) = k[t]/(t) = k`, both nonzero, while `H⁰_Z = 0`".

## R01 (P2) — This roadmap and JacobianChallenge still supply each other

- **Location.** `README.md:536–539`: "**From JacobianChallenge**: C (coherence of `R^q f_* F` … relative effective Cartier divisors and symmetric powers), D …, E …, F". The *Needs:* of §4.9 (`:5747`) and §4.14 (`:6010–6011`) name "JacobianChallenge Layer C"; §§3.6–3.8 consume Layers C–F (`:5146`, `:5196`, `:5235`).
- **Claim.** JacobianChallenge is a supplier of this roadmap.
- **Witness.** JacobianChallenge on main consumes this roadmap from inside the same Layer C: `TauCetiRoadmap/JacobianChallenge/README.md:152` (§4.12 `chow_lemma`), `:196` ("owned by SchemeAndStackFoundations §4.9"), `:208` (§4.14's Hilbert schemes), and from Layer D `:229`, `:246`, `:277`. So §4.14 needs Layer C, and Layer C needs §4.14. `gate --depcheck` prints 0 problems because it never reports an edge between two roadmaps on main; its silence is a false negative here.
- **What the repair did and did not do.** The target-level order the README states at `:5734–5741` and `:5917–5918` is acyclic, and the Layer A–B edges were replaced by Tau Ceti declarations. The two roadmaps still cite each other, and at layer granularity (the granularity of this README's *Needs:* lines) the edge is a cycle.
- **Repair.** Give the pair one direction. JacobianChallenge takes only foundations from here (§§0.9, 0.11, 1.1, 2.2, 2.11, 4.9, 4.12, 4.14), so the direction that fits is that this roadmap supplies it:
  1. State in §2.6, as targets of this roadmap, the two Layer C inputs that §§4.9, 4.14 and 5.7 take: coherence of `R^q f_* F` for `f` proper over a locally Noetherian base and `F` coherent, and finiteness of `H^q(X, F)` over a Noetherian affine base (Stacks 02O5, 02O6). The route uses `chow_lemma`, which needs only §§0.9 and 4.11 (`:5916–5917`). Replace "JacobianChallenge Layer C" by §2.6 in the *Needs:* of §§2.6, 4.9, 4.14, 5.7 and in the Layer 2, 4, 5 Dependencies.
  2. Move §§3.6–3.8, the consumers of the Picard scheme, the Jacobian and Abel–Jacobi, to a roadmap after JacobianChallenge (or let JacobianChallenge own them), with a sentence giving the old → new numbering.
  3. Step 1 needs a JacobianChallenge revision that cites §2.6 and drops its own statement of 02O5–02O6; name that revision in the description's merge-order paragraph.
- **Tested.** After steps 1–2 no *Needs:* line or contract row here names JacobianChallenge, and JacobianChallenge's citations of §§4.9, 4.12, 4.14 stay valid. Tau Ceti at `2fd255d9` has `Cohomology/FlatBaseChange.lean` and `Cohomology/Cech/Basic.lean` but no proper-coherence file, so step 1 is a target and not a citation.

## R02 (P3) — §3.4 plans the Cartier–Picard equivalence that the pinned Tau Ceti proves

- **Location.** `README.md:5012–5016`: "For integral `X`, use the pinned `Scheme.CartierDivisor.toLineBundleClassHom`, `toLineBundleClass_surjective` and `toLineBundleClass_principalCartierDivisor` to identify Cartier divisors modulo principal divisors with `LineBundleClass X`. Prove the kernel statement by comparing rational trivializations".
- **Claim.** The target `cartierClass_picard_equiv` is missing at the pin.
- **Witness.** `TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.lean` at `2fd255d9`: `principalSubgroup_eq_ker` (`:61`, the kernel statement) and `classGroupAddEquivLineBundleClass (X) [IsIntegral X] : ClassGroup X ≃+ Additive (LineBundleClass X)` (`:123`), with no Noetherian or dimension hypothesis.
- **Repair.** Delete the target `cartierClass_picard_equiv` and its "Prove the kernel statement" sentence. Cite `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass` and `principalSubgroup_eq_ker` with the file and lines above, in §3.4 and under **From Tau Ceti**. Keep `picardToClassGroup` and `classGroup_picard_locallyFactorial`, which the pin does not have. Rename the bold heading to the remaining target.
- **Tested.** On `ℙ²_k` (the first Check) the pinned equivalence sends the class of a hyperplane to `O(1)`; the Check needs no change.

## R03 (P3) — `Formal.IsAlteration.functionFieldMap` restates Tau Ceti's `Scheme.Hom.functionFieldMap`

- **Location.** `Suggested.lean:939–946`: "`def IsAlteration.functionFieldMap … : S.functionField ⟶ S'.functionField := S.presheaf.stalkSpecializes (…) ≫ f.stalkMap (genericPoint S')`"; `README.md:6339`, `:6367–6368`.
- **Claim.** The file needs its own function-field map of an alteration.
- **Witness.** `TauCeti/AlgebraicGeometry/Morphisms/Dominant.lean:151` at `2fd255d9`: `AlgebraicGeometry.Scheme.Hom.functionFieldMap (f : X ⟶ Y) [IsDominant f] : Y.functionField ⟶ X.functionField`, with the same body, for irreducible `X`, `Y`; `eq_functionFieldMap_iff` (`:170`) characterises it.
- **Repair.** Add `import TauCeti.AlgebraicGeometry.Morphisms.Dominant`, delete `IsAlteration.functionFieldMap`, and write

      def IsAlteration.IsGenericallyEtale {S' S : Scheme.{u}} (f : S' ⟶ S) [IsIntegral S]
          [IsIntegral S'] [IsAlteration f] : Prop :=
        letI : IsDominant f := IsAlteration.isDominant
        letI := f.functionFieldMap.hom.toAlgebra
        Algebra.IsSeparable S.functionField S'.functionField

  In `README.md:6339` and `:6367` cite the Tau Ceti map instead of the local name. In §3.3 (`:4935–4937`) say that the map "for which `Spec K(X) → Spec K(Y) → Y` equals `Spec K(X) → X → Y`" is `Scheme.Hom.functionFieldMap f`, by `eq_functionFieldMap_iff`.
- **Tested.** A scratch file with `import Mathlib`, that import and this definition (on a copy of the class) elaborates with no message. For Frobenius of `𝔸¹_{𝔽_p}` the map is `t ↦ t^p`, inseparable, so the predicate is false, as the §4.16 Check says.

## R04 (P3) — §3.8: Milne's Proposition 2.2 is on p. 92

- **Location.** `README.md:5233–5234`: "(Milne 2008, Part III, Propositions 2.1, 2.2, p. 91)".
- **Claim.** Both propositions are on p. 91.
- **Witness.** `milne-av` line 3702 (Proposition 2.1) is under the running head of p. 91 (line 3686); line 3737 (Proposition 2.2, `Γ(J, Ω¹_J) → Γ(C, Ω¹_C)` is an isomorphism) follows the running head "92 CHAPTER III" at line 3726.
- **Repair.** Write "pp. 91–92".

## R05 (P3) — The pull-request description describes the head before the merge of main

- **Location.** `scratch/pull-request.md`, the author's text (not a generated block), sections "Suggested.lean" and "For reviewers".
- **Claim and witness.** Four sentences are false at `a5411fa`:
  - "It imports `Mathlib` and ten `TauCeti.*` modules." The head imports 22 (`Suggested.lean:2–23`).
  - "The branch's `lake-manifest.json` still pins Mathlib `f6090c70` and Tau Ceti `358314d4`, so `Suggested.lean` elaborates against those." The head pins `1b1ccf4b` and `2fd255d9`.
  - "All ten imported `TauCeti.*` modules exist at both pins. Main merges into the branch without conflicts." Main is merged (`a761be15`).
  - "**Two restated predicates.** `Suggested.lean` states the complete-local Nagata theorems on its own `Ring.IsJapanese` and `Ring.IsNagata`." The head states them on `TauCeti.Ring.IsJapanese` and `TauCeti.Ring.IsNagata` (`Suggested.lean:124`, `:131`).
- **Repair.** Replace the "Pins" and "Two restated predicates" bullets by: "The branch is at main's pins, Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, which the supplier contracts cite. `Suggested.lean` imports `Mathlib` and 22 `TauCeti.*` modules and states its theorems on the Tau Ceti carriers." Under "Direction of supply" add that JacobianChallenge Layers A–B are now taken from Tau Ceti.

## Verified sound

### Gate, dependency check, build, probe

- **Gate.** The worker's gate at `a5411fa`: every counter 0, `build=0`, OK. My re-run of `gate … SchemeAndStackFoundations --base origin/main`: every counter 0, OK, exit 0.
- **Dependency check**, verbatim:

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. R01 is the edge it cannot see.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 47 "declaration uses `sorry`" warnings and nothing else.
- **One-tactic probe.** A scratch copy with each of the 47 `sorry` replaced by `first | rfl | infer_instance | (simp; done) | trivial | decide` gives 47 errors, one per position: nothing is padding. In the same file `IsLocallyNoetherian (∐ X)` is not found by `infer_instance` without `Chow.isLocallyNoetherian_sigma`, so that proved instance is needed to state `CH_coprod` and is not a library duplicate.
- **Signatures.** `scratch/signatures.md`: 0 of 102 declarations lost a binder. I compared `isPseudoCoherentSheaf_iff_affineOpens`, `CH_coprod`, `hodge_index`, `weil_bound`, `alteration_theorem` and `vectorBundleDegree_pullback` with their README statements; they agree.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. `git merge-tree` against `origin/main` (`71c8f211`) exits 0.

### Library declarations opened at the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)

- §0.27, all twelve cited lines land on the named declaration: `RingTheory/Flat/Annihilator.lean:39`, `:67`, `:82`, `:97`; `RingTheory/Ideal/TensorProduct.lean:55`, `:72`, `:87`; `LinearAlgebra/TensorProduct/Quotient.lean:370`, `:381`, `:391`, `:399`; `LinearAlgebra/TensorProduct/Submodule.lean:78`. Mathlib's `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv` is at `Mathlib/LinearAlgebra/TensorProduct/Quotient.lean:273`.
- §3.3: `VectorBundle/Degree.lean:82`, `:102`, `:116`, `:132`, `:150`, `:168`; `VectorBundle/FixedRank.lean:106`; `Geometrically/GlobalSections.lean:99`.
- §4.19: `ProjectiveSpectrum/ProjectiveOver.lean:57` (class), `:65`, `:70`, `:77` (`IsProjectiveOver.isProper`).
- §0.20: `RingTheory/UniversallyJapanese.lean:67`, `:112`, `:117`, cited as the README says.
- §5.11: `WeierstrassCurve.hasse_bound` (`AlgebraicGeometry/EllipticCurve/HasseBound.lean`).
- §3.6 docstring: `relativePicardPresheaf` (`PicardFunctor/Relative.lean:84`), `relativePicardFppfSheaf` (`Fppf.lean:104`), `relativePicardDegreeZeroFppfSheaf` (`PicZero/Fppf.lean:114`).
- **Not duplicates.** `LineBundleClass.intersectionNumber` (`IntersectionNumber/Basic.lean:111`) pairs a class with a curve, not two classes, as `README.md:7537` says. `FieldTheory/Galois/SemilinearDescent.lean` is for fields and finite Galois groups; `galois_descent_affine` is for algebras and profinite groups. `exists_dense_open_flat` needs a locally Noetherian reduced base; `generic_flatness` an integral one.
- **Not-statable headlines.** At the pin there is no Nisnevich topology, algebraic stack (`Stack/Basic.lean` only names `SchPseudofunctor`), inertia, coarse space, Artinian coefficient category, Chern character or Todd class, and no `LineBundleClass (Spec R) ≃* CommRing.Pic R`. The docstring's list holds.

### Headline theorems

| Section | Headline | In `Suggested.lean` |
|---|---|---|
| §1.17 | Artin's bootstrap | `Groups.artinBootstrap` |
| §2.18 | Gluing in `D(O_X)` | `derivedObject_gluing` |
| §4.10 | Grothendieck existence, full faithfulness, algebraization of morphisms | `Formal.grothendieck_existence`, `_fullyFaithful`, `algebraize_hom` |
| §§4.19–4.20 | de Jong's alteration theorems | `alteration_theorem`, `semistable_alteration_theorem` |
| §5.10 | Hodge index | `hodge_index` |
| §5.11 | Weil bound | `weil_bound` |
| §§1.23, 2.19–2.20, 2.22, 3.6, 4.4, 5.7, 5.8 | Keel–Mori, coherent duality, Brauer class, Picard torsors, Schlessinger, `K_0 → G_0`, GRR | module docstring, each with the missing carrier |

### Seeded sample, checked at the text

Stacks is the cached book text (`stacks-project`, page markers equal printed pages); line numbers are of that text.

| Target | Locators checked | Result |
|---|---|---|
| §0.8 | 0AUW l.59553; 0578 l.154430, 0579 l.154452; 0559 l.154589, 055B l.154730; 055G l.154797, 055I l.154879; 054C l.112942; 005K l.7646; 038F l.134510; 01UA l.117464; 004Z l.6871; 054L l.119101; 04KV l.134375; 056T l.135952; 033N l.113334; 057G l.156192; 055U l.156231. `ega-iv-3`: 9.7.7 (iv) line 3109 (p. 79); 9.9.4 (i), (iii) line 3714 (p. 93); 9.9.5 line 3744 (p. 94); 12.2.4 (v), (viii) line 7512 (p. 183) | sound |
| §0.12 | 0A02 l.58669 (p. 1225); 0A03 l.58735; 04GV l.40597 (p. 858); 0AGV l.58748 (p. 1226); 07QY l.77534 (p. 1626); 07QR l.63140; 07PX l.63239 (case (4) covers `ℤ_{(p)}`) | sound |
| §0.27 | 07T8 l.25077 (both halves of Lemma 10.40.4); the Tau Ceti lines above | sound |
| §0.28 | no source claim beyond Stacks 26.17.6 and 26.4.3; the Checks recomputed below | sound |
| §1.7 | 03BU l.253455 (p. 5297); 03BV l.253461; 03H4 l.253467, 03H5 l.253481 (p. 5298); 03BX l.253514 (p. 5299); 03BY l.253574, 03BZ l.253579 (p. 5300) | sound |
| §2.2 | 0732 l.93057; 0734 l.93076; 072X l.93007; 03AV l.92660 with Lemmas 21.10.1–21.10.7 l.92666–92731; 03OW l.228829 | sound |
| §2.15 | 09ZI l.234948; 09Z8 l.234804 with 59.82.1–59.82.6; 03QQ l.232127, 59.59.1–59.59.2, 03QV l.232143; 09YQ l.231358. `milne-lec`: Definition 6.1 line 1643 (p. 42), Proposition 6.4 line 1687 (p. 43), Theorem 14.9 line 3834 (p. 96), application line 3943 (p. 99) | sound |
| §2.19 | 0A9E l.194634; 0A9I l.194671; 0B6I l.194736; 0A9Y l.196254 with Situation 48.16.1; 0AU0 l.196639; 0AA1 l.196663; 0B6U l.196752 (p. 4129); 0B6V l.196804 (p. 4130); 0E9U l.196853; 0FWI l.196880; 0BRT l.196231 (p. 4119); 0E9Z l.198108 (p. 4158); 069H l.159934; 0C06 l.197533; 0BV8 l.197296 (p. 4140); 0C10 l.197447 (p. 4144); 0DA7 l.300547; 0D9X l.300211; 0A9W l.196079 | sound; Nayak and Block–Holstein–Wei not read |
| §3.3 | 0AYR l.138304; 0B59 l.138315; 0AYS l.138322; 0AYX l.138413; 0DJ5 l.138418; 0AYY l.138432; 0AYZ l.138457; 0BUG l.134754; 0BS2 l.211164; 0BS3 l.211194; 0BS4 l.211207; 0C1A l.211589 | sound |
| §3.4 | 0BE4 l.129454; 0BE6 l.129506; 0BE8 l.129535; 0BE9 l.129549; 02RX l.177036 | R02; Hartshorne II.6.5, Fulton 1.8 and Bhatt–Scholze 2017 not read |
| §3.8 | 047I l.170069; `milne-av` lines 3702, 3737 | R04 |
| §4.6 | 08S5 l.315444; 08S7 l.315518; 0GPT l.315550; 0DY7 l.320999; 0DY8–0ET5 l.321017–321056; 0DZQ l.321728; 0D14 l.316613; 0D0N l.152799; 0C6R l.151161 | sound; Deligne–Mumford not read |
| §4.19 | Tau Ceti `IsProjectiveOver` and its three lemmas | sound; de Jong and Hartshorne uncertified |
| §5.3 | 02SN l.177720; 02TG l.178037 | sound; Fulton not verifiable |
| §5.11 | table (i)–(vi) recomputed below; Milne 2024 locators as read in the previous review, text unchanged | sound |

Docstring locators of `Suggested.lean` re-read at the book: 0A27 l.138240, 0A26 l.138149, 0BY9 l.211576, 04MF l.6987, 032W l.41730, 07QV l.63582, 04DZ l.230930, 01XF l.122785, 03RC l.232913, 06Z0 l.145906, 0D66 l.90486, 0D67 l.90502, 088C l.125892, 0899–0A42 l.126205–126264, 0AB0 l.121479, 0BEP l.138662, 0BEM l.138585, 0BEV l.138735, 02X2 l.252243, 06P9 l.287953, 04TY l.287980, 04S6 l.291655, 04SK l.291783, 0C1C–0C1F l.211975–212007, 02H0 l.152422, 02HG l.151660, 02HM l.151764, 0AIF l.304390, 02RW l.176998, 064Q l.64600, 03MJ l.258196, 04RD l.258265, 043H l.287788.

### Adversarial table

All rows computed this round.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| §1.8 negative control (04QY) | `Y = Spec ℂ[x_n]/(x_n x_m)`, `X = Y ∖ 0`, `V = X ⊔ Y` | `P(h)`: `X = ⋃ Spec ℂ[x_n^{±1}]`, true / `P(f)`: `O_{Y,0}` has infinitely many minimal primes, false; `𝟙_X` has `P`, `X ⊂ Y` not | Pass (control as stated) |
| §3.4 `cartierClass_picard_equiv` | pinned `classGroupAddEquivLineBundleClass`, `ℙ²` | README target / Tau Ceti `ClassGroup X ≃+ Additive (LineBundleClass X)`, integral `X` only | Fail → R02 |
| `IsAlteration.functionFieldMap` | pinned `Scheme.Hom.functionFieldMap`; Frobenius of `𝔸¹_{𝔽_p}` | same body `stalkSpecializes ≫ stalkMap`; `t ↦ t^p`, inseparable | Fail → R03 |
| §3.8 locator | Milne AV III 2.1, 2.2 | p. 91 / p. 92 | Fail → R04 |
| `isPseudoCoherentSheaf_iff_affineOpens` | DVR `R`, `j_!O`; `(ℤ/2)~` on `Spec ℤ`; `(⊕_ℕ ℤ)~` | sections `0`, `K` pseudo-coherent but not quasi-coherent: right side false; no surjection `O^n → j_!O` near the closed point: left false / both true / both false | Pass |
| `flat_over_dedekind` | `Spec k[x,y]/(xy) → Spec k[x]`; `S ⊔ 𝔸¹_S → S` | component `x = 0` maps to a point (excluded), `y` is `x`-torsion, not flat / flat, fibres of dimensions 0 and 1 | Pass |
| `Ring.IsJapanese.of_complete_local` | `k[[x]]`, `[k : k^p] = ∞`; §0.22's `A` | complete, Japanese / not complete, `A[f]` not finite | Pass |
| `smooth_iff_formallySmooth` | `Spec k[ε]/ε² → Spec k`, thickening `k[ε]/ε³ → k[ε]/ε²` | a lift `ε ↦ ε + aε²` needs `ε² = 0` in `k[ε]/ε³`: none; not smooth | Pass |
| `genus_of_finite_etale` | étale double cover of genus 2; `n = 0` | `3 − 1 = 2·(2 − 1)` / `X = ∅` has `h⁰ = 0 ≠ 1`, excluded | Pass |
| `vectorBundleDegree_pullback` | `z ↦ z²` on `ℙ¹`, `E = O(1)`; reduced line in `V(z²)` | `χ(O(2)) − χ(O) = 2 = 2·(2 − 1)` / degree 2 pulls back to 1, target not integral | Pass |
| `hodge_index` with `Chow.intersectionNumber` | `ℙ¹ × ℙ¹`, `χ(O(m,n)) = (m+1)(n+1)` | `(a,b)·(c,d) = 1 − (1−a)(1−b) − (1−c)(1−d) + (1−a−c)(1−b−d) = ad + bc`; `H = (1,1)`: `H² = 2`; `D = (1,−1)`: `D·H = 0`, `D² = −2`, `D·(1,0) = −1 ≠ 0`; `D = O`: `0` and numerically trivial | Pass |
| `weil_bound` | `y² + y = x³` over `𝔽_2`; Hermitian over `𝔽_4`; `ℙ¹` | `|3 − 3| = 0 ≤ 2√2` / `9 = 4 + 1 + 2·1·2` / `q + 1`, `g = 0` | Pass |
| §5.11 (iv) | symbolic | `Γ_0² = q(2−2g) − 2q − 2q + 2q = −2gq`; `Δ_0² = (2−2g) − 2 − 2 + 2 = −2g`; `Γ_0·Δ_0 = N − 1 − q − q + q − 1 + 1 = N − q − 1` | Pass |
| §5.11 Hermitian Check | `y^q + y = x^{q+1}` over `𝔽_{q²}` | `N = q³ + 1` / `q² + 1 + 2·(q(q−1)/2)·q = q³ + 1` | Pass |
| `alteration_theorem` degenerate | `X = Spec k`, `Z ≠ ⊥` | `Z = ⊤`, support `∅`; `B = ⊤` (empty product), support `∅ = (range j)ᶜ ∪ j(φ⁻¹∅)`; transversality vacuous | Pass |
| `CH_coprod` | `∐_ℕ 𝔸¹`, `α = Σ[0_n]`; `I = ∅` | each restriction `[0] = div(t)`; the union family is locally finite: both sides true / `∐ = ∅`, both true | Pass |
| §0.8 `rational_point_component`, `quasi_sections` | generic point of `𝔸¹_k`; closed point with residue field `L` | not closed in its fibre, no étale section through it / section after `Spec L → Spec k` | Pass |
| §0.12 Checks | `(ℤ[i,1/2], (2+i))`; `(ℤ[√2,1/2], (5))` | `N(2+i) = 5`, residue field `𝔽_5` / squares mod 5 are `1, 4`, residue field `𝔽_25` | Pass |
| §0.27 Checks | `ℤ → ℤ[1/2]`; `k[x,y] → k[x]`; `M = ⊕ℤ`, `Q = ⊕ nℤ`, `S = ℚ` | `(4) ∩ (6) = (12) ↦ (3)` and `(1) ∩ (3) = (3)` / `(xy) ↦ (x²)` against `(x) ∩ (x) = (x)` / `Ann = 0 ↦ 0` against `Ann(0) = ℚ` | Pass |
| §0.28 Checks | `ℙ¹`, two points; `𝔸² ∖ 0 → 𝔸²`, `I = (x,y)` | `Γ/ker = k` against `k × k` / quotient `k` against section kernel quotient `0` | Pass |
| §1.7 Checks | `L/K` quadratic; folded line | one point (`σ∘σ = id` gives a common extension) / origin and pairs `{x, −x}` | Pass |
| §2.15 Checks | `Spec 𝔽_q`; `Spec ℝ` | `Hom_cont(Ẑ, ℤ/n) = ℤ/n` / `H¹(𝔾_m) = 0`, `H² = ℤ/2` | Pass |
| §2.19 Checks | `i : Spec k → Spec k[t]`; `ℙⁿ_k → Spec k` | `RHom(k,k)`: `H⁰ = H¹ = k`; `Li^*k` in degrees `−1, 0`, tensored with `k[−1]` gives `0, 1`; `i^*k ⊗ k[−1]` has `H⁰ = 0` / `O(−n−1)[n]` | Pass |
| §3.3 Checks | nodal cubic, node skyscraper | `dim Ext¹(K,K) = 2` (embedding dimension) against `dim Hom(K, K ⊗ ω) = 1` | Pass |
| §3.4 Checks | quadric cone; `𝔸¹ ⊃ 𝔸¹ ∖ 0`; `Spec(k × k)`, `f = (0,1)` | `Pic = 0`, `Cl = ℤ/2` / `k^× → k^× × t^ℤ → ℤ → 0 → 0` / symmetry `(−1)^{f·f} = (1, −1)` | Pass |
| §4.6 line-bundle deformations | first-order thickening, 0C6R | fibre of `Pic(X') → Pic(X)` is a torsor under `H¹(I)` modulo the image of `H⁰(O^×)`; units lift for smooth proper `X` | Pass |
| §5.3 Checks | `ℙ¹`, `O(m)`; elliptic curve | degree `m` / `[P] − [Q] ≠ 0` in `CH_0` for `P ≠ Q` | Pass |

### Suppliers, overlaps, ownership

- Every supplier is on main (AlgebraicVectorBundles, StableReduction, JacobianChallenge, ClassFieldTheory, ProfiniteCohomology, GrothendieckEulerForms, DerivedModuleAlgebra, EtaleCohomologyFoundations, QuadraticFormInvariants). `scratch/citations.md` lists no cross-roadmap citation found nowhere; its 134 Lean-name leads are this roadmap's own names and the consumer names resolved in the previous review.
- `scratch/overlaps.md`: no dropped id in either direction, none that only an open revision defines. Four open pull requests change this folder and conflict with it; the generated merge-order block orders them (#1656 → this pull request → #1807 → #1808 → #1854).
- JacobianChallenge at the head of its open revision states the same two-way relation as main ("§4.9, §4.12 (not §4.14, which consumes this layer)"), so R01 is not settled there.
- No declared gaps (no readable `design/plan.json`, no `What <Supplier> must provide` contract).

## Not verifiable

- Fulton 1998 (§§3.4, 5.3): no legal copy.
- Hartshorne 1977 and de Jong 1996 (§§3.4, 4.19): settled as uncertified in the manifest.
- Deligne–Mumford 1969 (§4.6), Nayak and Block–Holstein–Wei (§2.19), Bhatt–Scholze 2017 Definition 12.14 and Construction 5.1 (§3.4): not read this round; the review edits no manifest and I did not fetch them.
- No repair report for the previous review was available to me, so I could not check whether R01 had been answered as not actionable.

## Source issues

- none
