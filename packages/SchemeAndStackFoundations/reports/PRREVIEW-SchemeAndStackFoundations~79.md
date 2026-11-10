# Review of SchemeAndStackFoundations (pull request #1276 at 6da2b17)

**Verdict:** needs changes

This is a full review of the head that r77 read, which has not changed (`scratch/changes.md`: 0 lines). There are five findings, three of them blocking.

- **Carried.** R01 is the branch's pin lag. It is re-raised with a corrected repair: after the merge, `Suggested.lean` restates 20 Tau Ceti definitions, not the 2 that r77 named.
- **New, blocking.** R02 and R03.
  - R02: §1.8 equates "étale local on source-and-target" with Mathlib's `IsLocalAtSource` plus `IsLocalAtTarget`. Stacks has a counterexample to that identification.
  - R03: this roadmap and JacobianChallenge, both on main, supply each other. The dependency check cannot see this.
- **New, P3.** R04 is a locator. R05 is a wrong Check value.

## R01 (P2) — The branch pins Tau Ceti `358314d4`; the README is written against `2fd255d9`, and `Suggested.lean` restates 20 carriers that `2fd255d9` has

Re-raised: H01.

The merge of `origin/main` is the worker's to do, not the package's, so this finding goes to the worker or a human. It is re-raised because the folder is wrong at both pins:

- at the branch pin, the README cites 60 Tau Ceti files that do not exist there;
- at main's pin, `Suggested.lean` restates 20 Tau Ceti definitions.

r77's step 2 named only two of these 20, so the repair it handed over was incomplete.

- **Location.**
  - `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; `origin/main` (`4820485`) pins `2fd255d9` and `1b1ccf4b`.
  - `README.md:427` says "**From Mathlib** (`1b1ccf4b`)" and `README.md:468` says "**From Tau Ceti** (`2fd255d9`)".
  - In `Suggested.lean`, 20 definitions have docstrings naming the Tau Ceti carrier they copy, for example `:118` "The body of Tau Ceti's `TauCeti.Ring.IsJapanese`".
- **Claim.** The supplier contracts cite declarations that are absent at this branch's pin. At the pin the README declares, the acceptance test redefines 20 Tau Ceti carriers instead of using them.
- **Witness.**
  - Recounted this round: the README names 81 distinct `TauCeti/….lean` files.
    - 60 are absent at `358314d4`.
    - 80 exist at `2fd255d9`. The 81st, `Cohomology/FormalFunctions.lean`, is §4.9's planned home.
  - Every one of the 20 definitions below has its Tau Ceti counterpart at `2fd255d9` and none at `358314d4`.
- **Repair.**
  1. Merge `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` exits 0 at `4820485`.
  2. In `Suggested.lean`, delete each restated definition and state its theorems on the Tau Ceti carrier, importing the module. All files below are as at `2fd255d9`:

     | `Suggested.lean` | Tau Ceti carrier | File |
     |---|---|---|
     | `Ring.IsJapanese` (`:119`) | `TauCeti.Ring.IsJapanese` | `RingTheory/Japanese.lean:125` |
     | `Ring.IsNagata` (`:126`) | `TauCeti.Ring.IsNagata` | `RingTheory/Nagata.lean:65` |
     | `Excellence.GeometricallyRegular` (`:148`) | its namesake | `RingTheory/RegularLocalRing/GeometricallyRegular.lean:70` |
     | `Excellence.RegularAlgebraMap` (`:155`) | its namesake | `RegularLocalRing/RegularAlgebraMap.lean:54` |
     | `Excellence.regularLocus` (`:161`) | its namesake | `RegularLocalRing/Locus.lean:61` |
     | `Excellence.IsGRing` (`:166`) | its namesake | `RegularLocalRing/GRing.lean:57` |
     | `SchemePresheaf` (`:261`) | its namesake | `AlgebraicGeometry/AlgebraicSpace/Basic.lean:68` |
     | `Spaces.RepresentableDiagonal` (`:269`) | its namesake | same file, `:74` |
     | `Spaces.EtaleAtlas` (`:274`) | its namesake | same file, `:113` |
     | `Spaces.IsAlgebraicSpace` (`:281`) | its namesake | same file, `:195` |
     | `Proetale.IsReplete` (`:551`) | `TauCeti.IsReplete` | `CategoryTheory/Limits/Replete.lean:91` |
     | `Formal.IsThickening` (`:840`) | its namesake | `Morphisms/Thickening.lean:69` |
     | `Formal.IsFirstOrderThickening` (`:845`) | its namesake | same file, `:147` |
     | `Formal.IsRegular` (`:1009`) | its namesake | `Scheme/Regular/Scheme.lean:68` |
     | `Chow.cyclesOfDimension` (`:1194`) | its namesake | `Chow/Basic.lean:86` |
     | `Chow.RatEquiv` (`:1206`) | its namesake | same file, `:257` |
     | `Chow.ChowGroup` (`:1220`) | its namesake | same file, `:295` |
     | `PseudoCoherence.IsPseudoCoherentModule` (`:68`) | `IsPseudoCoherentOver A M ⊤` | `Algebra/Module/PseudoCoherent/Basic.lean:89` |
     | `PseudoCoherence.IsPseudoCoherentSheaf` (`:75`) | `Scheme.Modules.IsPseudoCoherent` | `AlgebraicGeometry/Modules/PseudoCoherent/Basic.lean:81` |
     | `DeJong.IsProjectiveOverSpec` (`:1071`) | `Scheme.IsProjectiveOver R` | `ProjectiveSpectrum/ProjectiveOver.lean:57` |

     The last row is equivalent to its carrier over any ring `R`: a finite `R`-module `M` is a quotient of `R^{n+1}`, so `Proj (Sym M)` is closed in `ℙⁿ_R`, and `ℙⁿ_R = Proj (Sym R^{n+1})`.
  3. In §§5.2 and 5.4, cite Tau Ceti's `totalSpaceScheme` (`VectorBundle/TotalSpace.lean`, at `2fd255d9`) for the total space that the README credits to AlgebraicVectorBundles L2B, and delete the aliases *Chow.totalSpace* and *Chow.HasRank* (`README.md:6950`, `:7075`).
- **Tested.**
  - All ten `TauCeti.*` modules that `Suggested.lean` imports exist at both pins, so step 1 alone does not break the imports.
  - Step 2 is not elaborated here: the brief's Lean commands run at the branch pin only.

## R02 (P2) — §1.8: `IsLocalAtSource` plus `IsLocalAtTarget` is not "étale local on source-and-target", and the API claimed under it fails

- **Location.** `README.md:2321–2325`: "Define `EtaleLocal P f` for a property `P` … that is étale local on the source-and-target (`IsLocalAtSource` and `IsLocalAtTarget` for `Scheme.etalePrecoverage`) … API: *EtaleLocal.iff_forall_square* (independence of the square), `.ofScheme_iff` (agreement with `P` on schemes)".
- **Claim.** Under these two classes alone, `EtaleLocal P f` is independent of the chosen square and agrees with `P` on morphisms of schemes.
- **Witness.**
  - Stacks §35.32 opens by warning that the two notions differ.
  - Example 35.32.2 (04QY), `stacks-project` (book) lines 144493–144534, pp. 3043–3044, is a property `P` that is étale local on the source and on the target. Mathlib's two classes are exactly these conditions; see `CategoryTheory/MorphismProperty/Local.lean:51`, `:154`.
  - The example: `Y = Spec ℂ[x_n; n ∈ ℤ]/(x_n x_m, n ≠ m)`, `X = Y ∖ {0}`, `U = X`, `V = X ⊔ Y`. Here `P(h)` holds, because `X` is covered by the opens `D(x_n) = Spec ℂ[x_n^{±1}]`. `P(f)` fails, because `O_{Y,0}` has infinitely many minimal primes.
  - So `EtaleLocal P f` holds while `P f` fails: this refutes `.ofScheme_iff`, and the identity square refutes square-independence.
- **Repair.**
  - Replace the parenthetical by Stacks's hypothesis: `P` is `IsLocalAtSource` and `IsLocalAtTarget` for `Scheme.etalePrecoverage` and is stable under postcomposition with open immersions. Lemma 35.32.6 (04R2), line 144637, shows that these three conditions give Definition 35.32.3 (04QZ), line 144538, p. 3044.
  - State *iff_forall_square*, `.ofScheme_iff` and `.comp` under those three conditions.
  - Add 04QY as a negative-control Check. It fails the third condition: `id_X` has `P`, but `X ⊂ Y` does not.
- **Tested.**
  - The repaired hypothesis excludes 04QY.
  - Smooth, flat, étale, locally of finite type and locally of finite presentation satisfy all three conditions.
  - `Spaces.EtaleLocal.baseChange` (`Suggested.lean:316`) is true as stated and needs no change. Pull the square back along an atlas `h_W → G`:
    - `U ×_H W → F ×_H G` is étale and surjective;
    - `h'` is a base change of `h`;
    - `[P.IsStableUnderBaseChange]` alone gives `P h'`.

## R03 (P2) — This roadmap and JacobianChallenge supply each other

- **Location.**
  - This README `:531–536`: "**From JacobianChallenge**: A … B … C … D … E … F".
  - The *Needs:* of §4.9 (`:5687`, "JacobianChallenge Layers B–C") and of §4.14 (`:5950`, "JacobianChallenge Layer C").
  - §§3.6–3.8, which consume JacobianChallenge D–F (`:5066–5178`).
- **Claim.** JacobianChallenge is a supplier of this roadmap.
- **Witness.**
  - JacobianChallenge on main consumes this roadmap: `TauCetiRoadmap/JacobianChallenge/README.md`
    - `:152` (§4.12 `chow_lemma`);
    - `:196–199` (§4.9 `formalFunctionsIso`);
    - `:208` (§4.14);
    - `:229–230` (§§1.1, 2.2, 2.11);
    - `:277` (§0.9).
  - Its `:286` says "SchemeAndStackFoundations §§3.6–3.7 consume this represented object".
  - The two roadmaps therefore cite each other, which breaks single direction of supply. Main's copy of this README has the same 44 JacobianChallenge citations.
  - `gate --depcheck` prints 0 problems because it never treats a roadmap on main as an upward supplier, so its silence here is a false negative.
  - At target level the edges are acyclic: `chow_lemma` → JacobianChallenge C finiteness → §§4.9, 4.14 → JacobianChallenge C/D Picard → §§3.6–3.7. A split along those edges is therefore possible.
- **Repair.** Fix one direction. JacobianChallenge consumes only foundations from this roadmap (§§0.9, 1.1, 2.2, 2.11, 4.9, 4.12, 4.14), so the direction that fits is that this roadmap supplies JacobianChallenge.
  - (a) Replace the Layer A–B uses by the Tau Ceti declarations the README already names at main's pin: `LineBundleClass`, `Scheme.Modules.Cohomology`, `AlgebraicGeometry.Scheme.genus`, `InvertibleSheaf.eulerCharBelow_eq_relativeDegree_add_one_sub_genus` and `InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual`. Replace the Layer C flat-base-change uses by Tau Ceti's `Cohomology/FlatBaseChange.lean` where it covers them.
  - (b) State here, as a §2.6 target, the Layer C input that §§4.9 and 4.14 take: finiteness of coherent cohomology over a Noetherian affine base and coherence of proper higher direct images (Stacks 02O6, 02O5). Its route uses §4.12 `chow_lemma`, which needs only §§0.9 and 4.11 (`README.md:5855–5858`).
  - (c) Move §§3.6–3.8, the consumers of JacobianChallenge D–F, to a roadmap after JacobianChallenge, or let JacobianChallenge own them.
  - (b) needs a JacobianChallenge revision that cites §2.6 and drops its own copy. Name that revision in the description's merge-order paragraph.
- **Tested.** After (a)–(c), no *Needs:* line here names JacobianChallenge. Tau Ceti at `2fd255d9` has no `Cohomology/Proper.lean`, which is why (b) is a target and not a citation.

## R04 (P3) — `torsorRepresentability`'s docstring cites a theorem with hypotheses the statement drops

- **Location.** `Suggested.lean:377`: "Stacks, Lemma 80.11.1 (04SK); Poonen, Theorem 6.5.10 (i)."
- **Claim.** Poonen's Theorem 6.5.10 (i) supports the Lean statement.
- **Witness.** `poonen-2017` line 7502: Theorem 6.5.10 assumes `G` is an fppf group scheme over a locally Noetherian base, and case (i) also needs `G → S` affine. It concludes representability by a scheme. The Lean statement takes an arbitrary group algebraic space and concludes an algebraic space, which is Remark 6.5.11, line 7521, p. 182.
- **Repair.** Cite "Poonen, Remark 6.5.11, p. 182", as `README.md:2595` already does.

## R05 (P3) — §2.7: a Check states the wrong value

- **Location.** `README.md:3597–3598`: "`H⁰_Z(X, F)` is not `F(Z)`: for `𝔸¹`, `Z = {0}`, `F = O`, the restriction has sections `k`".
- **Claim.** The restriction of `O` to `Z` has sections `k`.
- **Witness.**
  - For the topological restriction, `Γ(Z, i⁻¹O_{𝔸¹})` is the stalk `O_{𝔸¹,0} = k[t]_{(t)}`, not `k`.
  - Only the closed subscheme has `Γ(Z, O_Z) = k[t]/(t) = k`.
- **Repair.** Write "`Γ(Z, i⁻¹O) = k[t]_{(t)}` and `Γ(Z, O_Z) = k`, both nonzero, while `H⁰_Z = 0`". The point of the Check is unchanged.

## Previous findings

- **R01 (r77) — not repaired.** `lake-manifest.json` still pins `358314d4`, and the folder is byte-identical to the one r77 read. It is carried as R01 above, with the repair corrected from 2 restated definitions to 20.

## Verified sound

### Gate, dependency check, build, probe

- **Gate.** The worker's gate reports every counter 0 with `build=0`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 and `OK`, and exited 0.
- **Dependency check.** The output of `gate --depcheck … --movable --content … --pr 1276`, verbatim:

  ```text
  depcheck: 233 roadmaps, 2259 edges, 0 problem(s)
  ```

  It exited 0, with no UPWARD, CYCLE or `moved:` line. R03 is the false negative it cannot see.
- **Elaboration.** `lake env lean <abs>/Suggested.lean` exited 0 in 1 min 36 s, printing only "declaration uses `sorry`": 47 warnings, matching the 47 `sorry`.
- **One-tactic probe.** A scratch copy with each of the 47 `sorry` replaced by `first | rfl | infer_instance | simp | trivial | decide` produced 47 errors, one per position. Nothing closes, so none of the 47 is padding.
- **Library candidates by object.** Generic flatness exists at both pins as `exists_dense_open_flat` (`AlgebraicGeometry/Morphisms/Flat/Generic.lean:137`), but only over a locally Noetherian reduced base. `Formal.generic_flatness` assumes only an integral base, as Stacks 052A does (`stacks-project` line 117622). The Tau Ceti theorem is therefore a special case, not a duplicate.
- **Signatures.** `scratch/signatures.md` reports 0 of 120 declarations with dropped binders. I compared `EtaleLocal.baseChange`, `torsorRepresentability`, `hodge_index` and `weil_bound` with their README statements; they agree. The entry "`on` (structure, line 43)" is a generator artifact from the docstring word "structure", not a declaration.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.

### Suppliers and ownership

- **Suppliers.** Every supplier is on main: AlgebraicVectorBundles, StableReduction, JacobianChallenge, ModularCurves, AlgebraicCurves, GrothendieckEulerForms, ClassFieldTheory, ProfiniteCohomology, QuadraticFormInvariants, EtaleCohomologyFoundations and DerivedModuleAlgebra.
- **Later roadmaps.** Names later in the order appear only as scope deferrals (`:1454`, `:2115`, `:3319`, `:4743`) or downstream consumers. Their Lean names resolve:
  - `VanishingCycles.*` and the trace names at the heads of InverseGaloisAndArithmeticFundamentalGroups and AbelianSchemesAndArithmeticModuli;
  - `artinComparison` and the related comparisons at ComplexComparisonPartII's head;
  - the EtaleCohomologyFoundations names on main.
- **Back-citations.** ModularCurves (`:3549`, "Nothing of this roadmap consumes SchemeAndStackFoundations"), StableReduction, AlgebraicCurves and DerivedModuleAlgebra cite nothing of this roadmap. The only two-way pair is R03.
- **`scratch/overlaps.md`.** No dropped id in either direction, and no id that only an open revision defines.
  - Four open pull requests change this folder and conflict with it.
  - The generated merge-order block orders them: this pull request → #1656 → #1807 → #1808 → #1854.
  - The roadmap is on main, so the closest open roadmaps in vocabulary (PurityForFlatCohomology, AdicCoefficientsAndComparisonsPartII, AlgebraicModuliForArithmeticGeometryPartII) cite it, not the reverse.
- **`scratch/citations.md`.** All 137 leads are this roadmap's own target names or downstream names resolved above.

### Library declarations opened

- **Citations by file and line.** Every one of the 68 full-path `TauCeti/…:N` and `Mathlib/…:N` citations lands on a declaration at main's pin. Examples:
  - `RegularFunctions.lean:53` `pushforwardStructureAlgebra`;
  - `QuasiSeparated.lean:107` `isQuasicoherent_pushforward`;
  - `NonabelianCohomology/Torsor.lean:61/159/226/234/276`;
  - `Godement.lean:365/377/394`;
  - `Over.lean:141`;
  - `Replete.lean:91`;
  - `VectorBundle/FixedRank.lean:52/106`;
  - `Degree.lean:82/150`.
- **Mathlib at the branch pin.**
  - `Sheaf.H.longSequence_exact₃` (`ExactSequences.lean:138`) and `δ_naturality` (`:66`).
  - `Scheme.ProEt`, which is `MorphismProperty.Over @WeaklyEtale ⊤ S` (`AlgebraicGeometry/Sites/Proetale.lean:97`). This is Bhatt–Scholze's Definition 4.1.1 (`bhatt-scholze-2014` line 1233).
  - `MorphismProperty.IsLocalAtSource` and `IsLocalAtTarget`.
  - `FormallySmooth` and `FormallyEtale` exist only at ring level, so the scheme classes of §4.1 duplicate nothing.
- **Not-statable headlines checked at main's pin.** No algebraic stack, coarse moduli, Chern character or Todd class, dualizing complex or upper shriek, Schlessinger hull, or scheme Brauer map. The docstring's not-statable list therefore holds at both pins. Likewise there is no Weil bound or Hodge index for curves at either pin, so both stated headlines are new.

### Headline theorems

Each README end theorem is either stated in `Suggested.lean` or named, with the carrier it lacks, in the module docstring:

| Section | Headline | In `Suggested.lean` |
|---|---|---|
| §1.17 | Artin's bootstrap | `Groups.artinBootstrap` |
| §1.23 | Keel–Mori | docstring |
| §§2.19–2.20 | Coherent Grothendieck duality | docstring |
| §2.22 | Brauer class of an Azumaya algebra | docstring; affine splitting stated |
| §3.6 | Picard torsors | docstring |
| §4.4 | Schlessinger | docstring |
| §4.10 | Grothendieck's existence theorem, its full faithfulness, algebraization of morphisms | `Formal.grothendieck_existence`, `_fullyFaithful`, `algebraize_hom` |
| §§4.19–4.20 | de Jong's alteration theorems | `alteration_theorem`, `semistable_alteration_theorem` |
| §5.7 | `K_0 → G_0` | docstring |
| §5.8 | Grothendieck–Riemann–Roch | docstring |
| §5.10 | Hodge index | `hodge_index` |
| §5.11 | Weil bound | `weil_bound` |
| §2.18 | Gluing in `D(O_X)` | `derivedObject_gluing` |

### Seeded sample, checked at the text

The Stacks book is the cached `book.pdf`, page markers equal to printed pages.

| Target | Locators checked | Result |
|---|---|---|
| §0.1 | 01LM l.110572 and 01LN l.110581 (p. 2325); 01LC l.110231; 02KH l.123108 (p. 2591, case `i = 0` of (1)); 01I6 l.108558 | sound |
| §0.22 | 00PB l.34084 (p. 719: `[k : k^p] = ∞`, `A ⊂ k[[x]]`); 09E1 l.41960 (p. 887: `A[f]` not N-1); 02JE l.351914 (§110.19: `dim A[x]_{m'} = 3`, maximal chain of length 2) | sound |
| §1.2 | 02W8 l.159057 (effectivity for separated locally quasi-finite data); 02WQ l.252285; 04SK l.291783; 0ADV l.291827 ((1) countable index, (2) finite type) | sound |
| §1.6 | 02WW l.252549; 0265 l.252468 (affine `U`); 0262 l.252333; 0263 l.252354 | sound |
| §1.8 | 025W l.252126; 02X0 l.252212; 02X2 l.252243; 03MJ l.258196 (p. 5397–5398, `a` surjective, `b` only étale, matching `Spaces.EtaleLocal`); 04RD l.258265 | R02 |
| §1.15 | 04TW l.287961; 04TY l.287980; 03P8 l.229140; 022U l.169957; Poonen §5.12.4 l.6440, 5.12.14 l.6457, Warning 5.12.6 l.6368, 6.5.5 l.7445, 6.5.9 l.7482, 6.5.10 l.7502, 6.5.11 l.7521 (printed = pdf − 14) | R04 |
| §2.3 | 03AH l.92221 (p. 1933); 03AI l.92234; 03AJ l.92237 (the `ℤ[F] → ℤ` extension, as the README describes `equivSheafH`) | sound |
| §2.4 | 0CK0 l.92799 (p. 1946, hypotheses as paraphrased); Mathlib names at both pins | sound |
| §2.5 | 03F3 l.92363; 02UZ l.87310; 0739 l.93136 (finite coverings in `Cov`, Čech products in `B`, cofinality: matches); 0FKR, 09SV are section tags of the cited lemma ranges | sound |
| §2.7 | 0A39 l.87342; 0G6Y l.89338; 0954 l.192332; 0955 l.192580 (Noetherian); 0A6T l.204068; 0AVZ l.192637; 0BUW l.192685; 47.9.7 (0AM0), 47.10.3 (0957) | R05 |
| §2.17 | `bhatt-scholze-2014`: Def 3.1.1 l.701 (p. 16); Prop 3.2.3 l.798 (p. 18); Prop 3.3.3 l.852 (p. 19); Prop 3.1.10 l.755; Prop 4.2.8 l.1361 (p. 29: locally weakly contractible, with 3.2.3 (1) giving repleteness); Def 2.4.1 l.604 (p. 13); Lemma 2.4.9 l.652 (p. 14); Thm 1.5 l.98 (p. 3) | sound |
| §3.5 | 0BCY l.128028 (p. 2696); 0BCZ l.128045; 0BD2 l.128084 (p. 2697, finite locally free of degree `d ≥ 1`, locally constant degree as the README says) | sound |
| §4.5 | 07YG l.330173 (p. 6903); 06GD l.311826 (p. 6521: surjective, nonzero principal kernel killed by `m_B`) | sound |
| §5.4 | 02TV l.179010 (p. 3760; Stacks uses the quotient convention, which the README records as `projectiveBundle_dual_convention`); 02TZ l.179130; 02UK l.179788 | sound; Fulton not verifiable |
| §5.11 | Milne 2024 (`AG11.pdf` cache): Def 11.12 l.326 (p. 9); Thm 11.53 l.1461, Cor 11.54 l.1471, Ex 11.55 l.1478 (p. 37); Frobenius l.1490 (p. 38). Milne's `C_1 × pt` is the README's `F_2`, as stated | sound |

### Adversarial table

Rows marked r79 were computed this round. Rows marked r74, r76 or r77 are carried for statements this head leaves unchanged.

| Statement | Instances | Values computed (left / right) | Result | Round |
|---|---|---|---|---|
| §1.8 `.ofScheme_iff`, *iff_forall_square* under the README's hypothesis | Stacks 04QY: `Y = Spec ℂ[x_n]/(x_n x_m)`, `X = Y ∖ 0`, `V = X ⊔ Y` | `P(h)`: `X = ⋃ Spec ℂ[x_n^{±1}]`, locally Noetherian, true / `P(f)`: `O_{Y,0}` has ∞ minimal primes, false | Fail → R02 | r79 |
| `Spaces.EtaleLocal.baseChange` | square pulled back along an atlas `h_W → G` | `U ×_H W → F ×_H G` étale surjective; `h'` a base change of `h`, `P h'` | Pass | r79 |
| `torsorRepresentability` locator | Poonen 6.5.10 (i) | needs `G` affine, `S` locally Noetherian, concludes a scheme / Lean: any group space, concludes an algebraic space | Fail → R04 | r79 |
| §2.7 Check value | `𝔸¹`, `Z = {0}`, `F = O` | `Γ(Z, i⁻¹O) = k[t]_{(t)}`, `Γ(Z, O_Z) = k` / README: `k` | Fail → R05 | r79 |
| §0.1 `pushforwardAlgebra_baseChange` | `⨿_{n≥0} Spec k`, `g : Spec k(s) → Spec k`; `𝔸¹_k` | `(sⁿ)_n ∉ (∏k) ⊗ k(s)`, map not onto `∏k(s)` / qcqs: `k[t] ⊗ k(s) = k(s)[t]` both sides | Pass | r79 |
| §0.1 quasi-coherence Check | `⨿_{n≥1} Spec k[t]/(tⁿ)` | `M_t ∋ (1)_n ≠ 0` (coordinate `r+1` of `t^r·1`) / sections over `D(t)` are 0 | Pass (not quasi-coherent, as claimed) | r79 |
| §0.22 `nonJapaneseDVR` | `k = 𝔽_p(t_1, t_2, …)`, `f = Σ t_i xⁱ` | `f ∉ A`, `f^p ∈ k^p[[x]] ⊂ A`, `[Frac A[f] : Frac A] = p` / `h_n = (f − g_n)/xⁿ`, infinitely many, closure not finite | Pass | r79 |
| §0.22 `nagata_nonCatenary` | Nagata's `A`, `B = A[x]/p` | `dim A[x]_{m'} = 3` / maximal chain `(0) ⊂ p ⊂ m'` of length 2 | Pass | r79 |
| §1.6 `etaleQuotientTheorem` | `(U ⊔ U)/R`; folded line, char ≠ 2 | `R` = 4 copies of `U`, quotient `h_U` / `𝔸¹/(Δ ⊔ Γ)` not locally separated at 0 | Pass | r79 |
| §1.15 Checks | `t ↦ t^p` over `𝔾_m`; fibre `t = 1`; `F(g)x` action | generic fibre `k(t)[s]/(s^p − t)`, purely inseparable / section `s = 1` / `(a, pr₂)` of degree `p^{dim G}` | Pass | r79 |
| §2.3 Checks | `ℤ/2` on `(Spec ℝ)_ét`; `S₃` | `H¹ = Hom(ℤ/2, ℤ/2)`, 2 elements / `(12)(13) = (132)`, order 3 | Pass | r79 |
| §2.4 `abelianBoundary` Checks | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` on `(Spec ℝ)_ét` | `H¹(ℤ/4) → H¹(ℤ/2)` is zero; the nonzero `x` maps to `x² ≠ 0` in `H²(ℤ/2, ℤ/2)` | Pass | r79 |
| `SiteCohomology.noetherianSpace_vanishing` | `Spec` of a DVR, `d = 1`; `ℙ^d`; `∅` | `Γ` exact, `H^{p≥1} = 0` / `H^d(O(−d−1)) = k` at `p = d`, not `> d` / `dim = ⊥`, `H = 0` | Pass | r79 |
| §2.5 colimit Check | `ℕ` discrete, `F_E = ℤ_E` | `⊕ℤ → ∏ℤ` not onto | Pass (negative control) | r79 |
| §2.7 DVR Check | `R`, `I = m = (t)` | `colim Ext¹(R/tⁿ, R) = colim R/tⁿ = K/R`; `H⁰ = 0` | Pass | r79 |
| §2.7 non-Noetherian Check | `A = k[x_0, …]/(x_j^{j+2})` | `f·x_jⁿ ≠ 0` for a fresh `j` with `j + 2 > n`: native `H⁰ = 0` / geometric `H⁰ = A` | Pass | r79 |
| `Proetale.isReplete_proetale` | `Spec ℚ`, tower `μ_{ℓⁿ}` | étale: discrete part of `ℤ_ℓ(1)` is 0 (stabilizer `ker χ` not open), leg `0 → μ_ℓ` not epi / pro-étale: `ℤ_ℓ(1)`, legs onto | Pass | r79 |
| §3.5 norm Checks | `z ↦ z²` on `ℙ¹`; hyperelliptic genus `g` | `Norm O(1) = O(1)`, `Norm π^*O(1) = O(2)` / `π_*O = O ⊕ O(−g−1)`, `det = O(−g−1)`, `_det` at `L = O` consistent | Pass | r79 |
| §4.5 Checks | `ℚ[ε]/ε³ → ℚ[ε]/ε²`, `ε ↦ 2ε`; `k[[x,y]]/(xy)` | kernel scaled by 4: `v = 4v ⇒ v = 0` / `(ε + aε²)(ε + bε²) = ε² ≠ 0` | Pass | r79 |
| §5.4 Checks | `ℙ(O ⊕ O(1))` over `ℙ¹`; `ℙ¹ × ℙ¹`; `T_{ℙ¹}` | `E² = −1` (odd) / `(a,b)² = 2ab` (even); `c_1 = 2h`, degree 2 = `χ_top` | Pass | r79 |
| §5.11 table (iv) | symbolic | `Γ_0² = q(2−2g) − 4q + 2q = −2gq`; `Δ_0² = −2g`; `Γ_0·Δ_0 = N − q − 1` | Pass | r79 |
| `weil_bound` | Hermitian `y² + y = x³` over `𝔽_4` | `g = 1`, `N = 2 + 3·2 + 1 = 9` / `4 + 1 + 2·1·2 = 9` (equality) | Pass | r79 |
| `hodge_index` via `Chow.intersectionNumber` | `ℙ¹ × ℙ¹`, `χ(O(a,b)) = (a+1)(b+1)`, `H = O(1,1)`, `D = O(1,−1)` | `H·H = 1 − 0 − 0 + (−1)(−1) = 2`; `D·H = 1 − 0 − 0 − 1 = 0`; `D·D = 1 − 3 = −2 ≤ 0` | Pass | r79 |
| `alteration_theorem` degenerate | `X = Spec k'`, `Z ≠ ⊥` | `Z = ⊤`, support `∅`; `X₁ = Xbar₁`, `B = ⊤` (empty SNC family, empty support) | Pass | r79 |
| `IsProjectiveOverSpec` vs `Scheme.IsProjectiveOver` | any `R`, finite `M` | `Proj Sym M ↪ ℙⁿ_R` / `ℙⁿ_R = Proj Sym R^{n+1}`: equivalent | → R01 | r79 |
| §0.8 dense open, non-affine `S` | `S = ℙ¹`, `V(s·xy − t·z²)` | locus `ℙ¹ ∖ {0, ∞}`; on `D₊(s)` it is `D(u)` ∋ `η` | Pass | r77 |
| §0.8 normal/smooth | `ℤ[x,y]/(y² − x³ − 5)` | `Δ = −2⁴·3³·5²`, locus `D(30) ∋ η` | Pass | r76 |
| §0.20 permanence | `ℤ[i]`; `ℤ/4`; `𝔽_p(t) ⊂ 𝔽_p(t^{1/p})` | finite; `(ℤ/4)/(2) = 𝔽_2`; closure is `L`, degree `p` | Pass | r76 |
| `derivedHom_isSheaf` | `O[0]`; `O`, `O[1]` on `𝔸² ∖ 0` | `H^{i<0} = 0`; `H¹ ∋ x⁻¹y⁻¹` | Pass | r74 |
| `derivedObject_gluing` | `O(−2)[1]` on `ℙ¹`; `X = ∅`; `O ⊕ O[1]` | glues to `Ω¹[1]`; `D(O_∅) = 0`; excluded, `Hom(K, K[−1]) ≠ 0` | Pass | r74 |
| `artinBootstrap` | `F = h_X`, atlas `𝟙` | flat, locally of finite presentation, surjective | Pass | r74 |
| `grothendieck_existence` | `A = k[[t]]`; `𝔸¹_A` | `lim A/t^{n+1} = A`; `Σ tⁿxⁿ ∉ A[x]` (properness needed) | Pass | r74 |
| `Curve.vectorBundleDegree_pullback` | `z ↦ z²`, `E = O(1)` | `3 − 1 = 2` / `2·1` | Pass | r74 |
| §1.17 `IsGeometricQuotient` | `Spec k[ε]/ε² → Spec k` | topology fine; `k → k[ε]/ε²` not iso | Pass | r74 |
| §2.19 `upperShriek` | `𝔸¹_k → Spec k` | `Ω¹[1] = O·dx[1]` | Pass | r74 |
| §5.12 Bézout | double line; skew lines | `1 ≤ 2`; `0 ≤ 1` | Pass | r74 |
| §5.10 `Num(E × E)` | `y² = x³ + x` over `𝔽̄_p` | rank 4 (`p ≡ 1` mod 4) / rank 6 (`p ≡ 3` mod 4) | Pass | r74 |

## Not verifiable

- **Fulton 1998, *Intersection Theory*.** Springer, and r74 found no legal copy. The §5.4 locators (Prop. 3.1, Thm. 3.2, Thm. 3.3 (b), §3.2) agree with the Stacks sections 02TV, 02TZ and 02UK checked above, but are not checked at Fulton's text.
- **Hartshorne 1977 and de Jong 1996.** The manifest settles both as uncertified. Neither is cited by a sampled target, except for `IsProjectiveOverSpec`'s Hartshorne II.4 in R01.
- **Elaboration at main's pins.** The brief's Lean commands run at the branch pin only, so R01's step 2 and R03 (a)–(b) are not elaborated.

## Source issues

- none
