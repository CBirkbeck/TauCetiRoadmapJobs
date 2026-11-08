# Review of PurityOfBranchLocus (pull request #1808 at 974a2a4)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since ea43766. `README.md` (407 lines) and `Suggested.lean` (281 lines) are byte-identical to the head the previous review read; the only commit of the pull request touching this folder is still the one that moved §0.3 to SchemeAndStackFoundations §4.13. The change since ea43766 is in `TauCetiRoadmap/RigidAnalyticGeometry/` only, which mentions this roadmap nowhere. So each of the nine previous findings was re-verified against the suppliers as they stand at this head; all nine stand, and one new finding (the gate's build line) is added. Findings R01–R09 below repeat the previous report's, with their witnesses re-checked at this head; R10 is new.

## R01 (P2) — Suggested.lean still declares the five §0.3 objects the README assigns to SchemeAndStackFoundations §4.13

- **Location.** `TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` lines 129–165: `globalDimension`, `globalDimension_le_iff_hasProjectiveDimensionLE`, `isRegularLocalRing_of_projectiveDimension_residueField`, `isRegularLocalRing_iff_finite_globalDimension`, `isRegularLocalRing_localization`.
- **Claim.** `README.md` lines 139–150 (§0.3): these "are targets of SchemeAndStackFoundations §4.13 … nothing here restates them".
- **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` at this head, lines 5865–5891, lists *globalDimension*, *globalDimension_le_iff_hasProjectiveDimensionLE*, *isRegularLocalRing_of_projectiveDimension_residueField*, *isRegularLocalRing_iff_finite_globalDimension* and *IsRegularLocalRing.isRegularLocalRing_localization* as its own targets; line 5915: "PurityOfBranchLocus §§0.3 and 2.1 consume the localization statement of 0AFS". None of the five names occurs in this README (grep: 0). Docstrings at lines 136 and 144 still name "EnhancedDerivedSheaves E1.6" as the consumer, a sentence SchemeAndStackFoundations line 5916 now carries.
- **Repair.** Delete the five declarations (lines 129–165) from `Suggested.lean`; nothing else in the file mentions them (grep on `globalDimension`, `isRegularLocalRing_localization`: only these lines). Re-elaborate.

## R02 (P2) — the §2.2 headline `etale_of_etaleAt_codimOne` is statable at the pins and absent from Suggested.lean

- **Location.** `README.md` lines 37–39 (the end theorems) and 271–283 (§2.2); `Suggested.lean` Layer 2, lines 169–277.
- **Claim.** The README names `Scheme.Hom.etale_of_etaleAt_codimOne` as one of its three end theorems.
- **Witness.** `Suggested.lean` contains no such declaration (grep: 0), and the module docstring (lines 4–22) does not say the headline is not statable. It is: the statement below, with every carrier at the pins (`IsFinite`, `IsDominant`, `IsIntegral`, `IsLocallyNoetherian`, `IsRegularLocalRing`, `IsIntegrallyClosed`, `Etale`, `Scheme.Hom.stalkMap`, `ringKrullDim`, `genericPoint`), was appended to a scratch copy of the file and elaborated at this head with `sorry` as its only warning (26 `#check` outputs, exit 0).
- **Repair.** State it:
  ```lean
  theorem etale_of_etaleAt_codimOne [IsLocallyNoetherian X] [IsLocallyNoetherian Y] [IsIntegral X]
      [IsIntegral Y] (f : X ⟶ Y) [IsFinite f] [IsDominant f]
      [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
      [∀ y : Y, IsRegularLocalRing (Y.presheaf.stalk y)]
      (hgen : ∃ U : X.Opens, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) :
      Etale f ↔ ∀ x : X, ringKrullDim (X.presheaf.stalk x) = 1 →
        (f.stalkMap x).hom.FormallyUnramified := by
    sorry
  ```
  The README's prose statement stays as it is ("generically étale" written as étale at the generic point, the equivalent form the README gives). Tested on the README's own degenerate instance `Spec 𝔽_p(t)[u]/(uᵖ − t) → Spec 𝔽_p(t)`: both spectra are points, the right-hand side is vacuous, `Etale f` is false, and `hgen` excludes it.

## R03 (P3) — backticked names of this roadmap's own that Suggested.lean does not declare

- **Location.** `README.md` lines 120 (`Scheme.Hom.etaleAt_spec_iff`), 124 (`Scheme.Hom.quasiFiniteAt_of_appLE`), 132 (`isNormalDomain_iff_of_etale`), 215 (`exists_elementaryEtale_finite_of_isolated`), 222 (`etale_of_etale_comp_surjective`); the table rows at lines 366–368 and 376–377; the Checks named `test_…` at lines 202, 204, 208, 262, 265, 344, 352, 355.
- **Claim.** A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; a Check never names a Lean counterpart.
- **Witness.** None of the five target names and none of the eight `test_` names occurs in `Suggested.lean` (grep at this head: 0 for each).
- **Repair.** Write README-only target names in italics, as SchemeAndStackFoundations §4.13 does at this head (*globalDimension*, *IsRegular.isNormal*), or declare them; give each Check a prose label in place of its `test_…` name. The headline `etale_of_etaleAt_codimOne` is R02, not this.

## R04 (P3) — §0.3 is a stub section, and its last sentence misstates what AbhyankarLemma does

- **Location.** `README.md` lines 139–151.
- **Claim.** The section defines and proves nothing ("nothing here restates them") and ends "AbhyankarLemma §3.3 consumes the localization statement from the same source."
- **Witness.** `TauCetiRoadmap/AbhyankarLemma/README.md` on main (and unchanged at this head), lines 31, 80, 363 and 375: "PurityOfBranchLocus §0.3 (0AFS)" is its supplier for the regularity of prime localizations; it does not cite SchemeAndStackFoundations for it. The layer table (line 25) and the Stacks alignment table (lines 362–384) already omit §0.3's content.
- **Repair.** Delete §0.3 (its two consuming sentences are already in *Scope and ownership*, second bullet) and its `*Needs:*` line, which has no target to attach to. Keep the numbering (0.1, 0.2, 0.4) or renumber §0.4 → §0.3 with the internal references at lines 25, 331 and 388 updated. The AbhyankarLemma citation of "PurityOfBranchLocus §0.3" is drift this pull request creates; repointing it to SchemeAndStackFoundations §4.13 (0AFS) is outside this folder's review.

## R05 (P3) — the scope section attributes the scheme-level API of regular schemes to ModularCurves §4D, which SchemeAndStackFoundations §4.13 owns

- **Location.** `README.md` lines 64–70 and 134–136.
- **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` at this head, lines 5838–5842: "Define `IsRegular X` … API: … *IsRegular.of_etale*"; `TauCetiRoadmap/ModularCurves/README.md` at this head, lines 1305–1313: "The general scheme-level API is consumed from SchemeAndStackFoundations … regular schemes in terms of regular local rings (§4.13)", keeping for its own moduli schemes only "locality and invariance under isomorphism and étale morphisms" (line 1320). The local-ring statements 039S (`dim A = dim B`) and 025N (`A` regular iff `B` regular) that §2.1's route uses are stated by neither supplier in those words.
- **Repair.** Cite SchemeAndStackFoundations §4.13 (*IsRegular.of_etale*) for the invariance of regularity under étale morphisms of schemes; state the two local-ring inputs §2.1 uses (for an étale homomorphism of Noetherian local rings `A → B`: `dim A = dim B`, Lemma 41.19.1 (039S); `A` regular iff `B` regular, Proposition 41.19.4 (025N)) as targets of §0.2 beside 025P, with Tau Ceti `TauCeti.IsRegularLocalRing.of_flat_of_formallyUnramified` (`TauCeti/RingTheory/RegularLocalRing/Flat.lean` line 71) as the ascent half of 025N; drop the sentence that ModularCurves owns the scheme-level API, and the ModularCurves §4D row of the supplier diagram (line 33) and the `*Needs:*` lines at 136 and 254 with it.

## R06 (P3) — `unramifiedAt_iff_stalkMap` cites the definition, not the lemma that states the equivalence

- **Location.** `README.md` lines 113–115 and the table row at line 366; `Suggested.lean` line 40, `@[stacks 02G4 "equivalence with the stalk form"]`.
- **Witness.** stacks-02G4 line 3333: Definition 29.36.1 (02G4) defines "unramified at `x`" by an affine neighbourhood with `R → A` unramified. stacks-02GF line 3448: Lemma 29.36.14 (02GF), for `f` locally of finite type, (1) unramified at `x` ⇔ (3) `Ω_{X/S,x} = 0`; and `Ω_{X/S,x} = Ω_{𝒪_{X,x}/𝒪_{S,s}}`, which is formal unramifiedness of the stalk map.
- **Repair.** Cite "Lemma 29.36.14 (02GF), (1) ⇔ (3)" for the target in the README and in the attribute (`@[stacks 02GF "(1) ⇔ (3)"]`), keeping 02G4 for the definition.

## R07 (P3) — padding in Suggested.lean

- **Location.** `Suggested.lean` line 95 `isClosed_nonEtaleLocus`, line 99 `ramificationLocus_subset_nonEtaleLocus`.
- **Witness.** `nonEtaleLocus f` is by definition (line 69) the complement of the union of the opens `U` with `Etale (U.ι ≫ f)`, so its closedness restates the definition (the docstring: "with no hypothesis on `f`"). The inclusion is `FormallyUnramified.stalkMap` (`Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean` line 148) applied to `U.ι ≫ f`. Neither is a headline; neither closes in one tactic (probe at this head: `rfl`, `infer_instance`, `simp [defs]`, `exact?` all fail), but both are definition-level API lemmas of the kind the acceptance test excludes.
- **Repair.** Delete both from `Suggested.lean`; the README keeps them as §0.4 targets (lines 183–185).

## R08 (P3) — module docstring is in the "suggested forms" shape

- **Location.** `Suggested.lean` lines 4–22: "suggested forms", "not exhaustive", "so that contributors and reviewers converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap".
- **Witness.** The required form is "<title>: target signatures", saying the roadmap is `README.md`, that the file states the headline theorems against the pinned APIs, and which headlines are not statable and what each lacks; the present text is process narrative and names no headline.
- **Repair.** Replace the docstring with that form; after R02 every headline is statable, so the last clause says so.

## R09 (P3) — gate: two files outside the pull request's named roadmap folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` (gate line `outside-folder=2`; `git diff --stat origin/main...HEAD` excluding the fifteen named folders: 2 files, 1 line changed in each, rewording "supplies" to "consumes").
- **Witness.** The brief names fifteen folders as the pull request's own; these two are not among them.
- **Repair.** List them in the pull request as its own, or drop them from it. This concerns the pull request, not this folder's text.

## R10 (P3) — gate: the build step fails on Lake's module-system warning

- **Location.** `Suggested.lean` lines 1–2: `import Mathlib`, `import TauCeti.RingTheory.RegularLocalRing.Basic`; gate line `build=1 FAIL` with "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`".
- **Claim.** The gate counts every non-`sorry` warning of `lake build TauCetiRoadmap.PurityOfBranchLocus.Suggested` as a failure, and no acceptance is possible while it fails. The pull request's manifest pins Mathlib `f6090c70` and Tau Ceti `358314d4`, both module-system packages, so the warning is Lake's on this header, not a tooling slip; `lake env lean` never prints it, which is why the previous review saw a clean elaboration.
- **Witness.** `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` in this same pull request (lines 1–4 and 30 at this head) already carries the repaired form (`module`, `public import Mathlib`, `public import TauCeti.…`, `public section`) and its gate build line is clean; `LocalPurity/Suggested.lean` and `SchemeAndStackFoundations/Suggested.lean` in the pull request still have the plain header.
- **Repair.** Replace lines 1–2 by `module`, a blank line, `public import Mathlib`, `public import TauCeti.RingTheory.RegularLocalRing.Basic`; keep the module docstring; put `public section` (or `@[expose] public section`) after the docstring, before `universe u`. A bare `module` with plain `import` silences the warning but makes every theorem private to importers, so the `public` forms are the repair. Re-run the gate.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 129–165 still declare the five global-dimension and localization statements; SchemeAndStackFoundations §4.13 lines 5865–5891 lists them as its own.
- R02 — not repaired: no `etale_of_etaleAt_codimOne` in `Suggested.lean`; docstring silent; the proposed statement elaborates at this head.
- R03 — not repaired: the five backticked target names and eight `test_` Check names are still absent from `Suggested.lean`.
- R04 — not repaired: §0.3 (lines 139–151) unchanged; AbhyankarLemma lines 31, 80, 363, 375 still cite PurityOfBranchLocus §0.3.
- R05 — not repaired: lines 64–70 still say ModularCurves §4D owns the scheme-level API of regular schemes; SchemeAndStackFoundations §4.13 line 5842 owns *IsRegular.of_etale*.
- R06 — not repaired: README line 115 and `@[stacks 02G4 "equivalence with the stalk form"]` at `Suggested.lean` line 40 unchanged; the equivalence is 02GF (Morphisms text line 3448).
- R07 — not repaired: `isClosed_nonEtaleLocus` (line 95) and `ramificationLocus_subset_nonEtaleLocus` (line 99) still in the file.
- R08 — not repaired: docstring lines 4–22 unchanged ("suggested forms … not exhaustive").
- R09 — not repaired: gate at 974a2a4 still reports `outside-folder=2`, the same two files.

## Verified sound

**Scope of this re-review.** `git diff ea43766..974a2a4 -- TauCetiRoadmap/PurityOfBranchLocus` is empty; the only commit of the branch touching the folder is cbd8b936 (the §0.3 move the previous review read). The one commit since ea43766 edits `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `Suggested.lean`, which contain no mention of PurityOfBranchLocus. The seeded sample (§§0.1, 0.2, 0.3, 0.4, 1.1, 2.1, 2.2, 2.3) falls in no changed passage; the previous report's locator checks of those sections carry forward, and the two locators R06 turns on (02G4, 02GF) were re-opened at stacks-02G4 line 3333 and stacks-02GF line 3448.

**Gate.** The worker's gate at 974a2a4: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=1 FAIL`; outside-folder is R09, build is R10. My own re-run of the gate command from the brief (without the pull request's sibling-folder list and without the targeted build) reports `outside-folder=19` and everything else 0: the 17 extra files are the pull request's own named folders, so that count is the invocation's, not a finding. Depcheck: `depcheck: 230 roadmaps, 2167 edges, 0 problem(s)`; no UPWARD or CYCLE line; LocalPurity, SchemeAndStackFoundations and ModularCurves are all on main, so the roadmap consumes nothing in the merge order above it. Pins of `lake-manifest.json`: Mathlib `f6090c70`, Tau Ceti `358314d4`, the current ones.

**Elaboration.** `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` (21 s, exit 0): 21 `declaration uses 'sorry'` warnings and nothing else. Scratch copy with `#check @name` for all 25 declarations and the R02 statement appended: 26 types printed, exit 0, 22 sorry warnings; each type compared with the README statement, and the worker's `signatures.md` (25 declarations, 0 lost binders) agrees: `exists_etale_of_formallyUnramified_stalk_codimOne` carries `IsLocallyNoetherian X`, `IsLocallyNoetherian Y`, `LocallyOfFiniteType f`, `IsDomain`/`IsIntegrallyClosed` of the source stalk, `IsRegularLocalRing` of the target stalk, `f.QuasiFiniteAt x`, the dimension equality, `1 ≤ dim` and unramifiedness at codimension-one generizations, exactly 0BMB (1)–(5); `isEtaleAt_of_purity` carries `IsNoetherianRing R`, `Algebra.FiniteType R S` and the same five in affine form; the §2.3 statements carry `IsLocallyNoetherian Y`, `IsIntegral X`, `IsIntegral Y`, `LocallyOfFiniteType f`, `LocallyQuasiFinite f`, `IsDominant f`, integrally closed source stalks (omitted in `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, as the README says) and regular target stalks. The R02 statement elaborates as `∀ {X Y : Scheme} [IsLocallyNoetherian X] [IsLocallyNoetherian Y] [IsIntegral X] [IsIntegral Y] (f : X ⟶ Y) [IsFinite f] [IsDominant f] [∀ x, IsIntegrallyClosed (X.presheaf.stalk x)] [∀ y, IsRegularLocalRing (Y.presheaf.stalk y)], (∃ U, genericPoint X ∈ U ∧ Etale (U.ι ≫ f)) → (Etale f ↔ ∀ x, ringKrullDim (X.presheaf.stalk x) = 1 → (f.stalkMap x).hom.FormallyUnramified)`.

**Padding probe.** Copy of `Suggested.lean` with each `sorry` replaced by `first | rfl | infer_instance | (simp [ramificationLocus, nonEtaleLocus, branchLocus, globalDimension]; done) | exact?` (75 s): all 21 fail (`exact?` could not close the goal at 20 of them; a `whnf` heartbeat timeout at `ramificationLocus_eq_stacks`, not a close). No declaration computes a value, mirrors a Check or treats a boundary case; R07 names the two definition-level API lemmas.

**Adversarial table.** The folder is unchanged, so every row is carried forward from the previous report (PRREVIEW-PurityOfBranchLocus_r3, at ea43766), whose values were recomputed there; `d` is `dim 𝒪_{X,x}`. The one statement this review adds (R02's Lean form) has its own row.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `unramifiedAt_iff_stalkMap` (lft) | `Spec k → 𝔸¹_k` at the origin; `Spec L → Spec K`, `L = K(t^{1/p})` (r3) | closed immersion: unramified true, stalk map `k[t]_(t) → k` surjective, `Ω = 0`, true; inseparable: `Ω_{L/K} = L·dt^{1/p} ≠ 0`, both sides false | iff holds both ways | locator R06 |
| `etaleAt_iff_stalkMap` (lfp) | same two; `𝔸¹_k → Spec k` at a closed point (r3) | closed immersion: étale false, `k` not flat over `k[t]_(t)` (`t`-torsion), RHS false; `𝔸¹`: étale false, flat true but `Ω_{k[t]/k} ≠ 0`, RHS false | agree | none |
| `etaleAt_spec_iff` (README) | `S = R[x]_g/(f)`, `f'` unit (r3) | `Algebra.etaleLocus ⊇ D(g)` by `Algebra.basicOpen_subset_etaleLocus_iff_etale` (`Mathlib/RingTheory/Etale/Locus.lean` line 97) | both sides true | R03 (name) |
| `ramificationLocus`, `nonEtaleLocus`, `branchLocus` | Frobenius `t ↦ t^p` on `𝔸¹_k`; `(x,y) ↦ (x²,y)`, char `≠ 2`; closed point of `𝔸¹` (r3) | Frobenius: `Ω = k[t]dt ≠ 0` at every prime, all three loci `= 𝔸¹`; square map: `Ω = k[x,y]dx/(2x dx)`, support `V(x)`, image `V(u)`; closed point: ramification `∅`, non-étale `{pt}` | definitions pick out the intended sets; wrong model "ramification = non-étale" excluded by the closed-point Check | none |
| `ramificationLocus_eq_stacks` | as row 1 (r3) | pointwise `unramifiedAt_iff_stalkMap` | agree | none |
| `isClosed_ramificationLocus` (lft) | `Spec K[x_1, x_2, …] → Spec K`, not lft (r3) | no unramified prime (`Ω` free of infinite rank); the hypothesis is the one `Algebra.isOpen_unramifiedLocus [EssFiniteType]` (`Unramified/Locus.lean` line 141) needs | holds | none |
| `isClosed_nonEtaleLocus` | any `f` (r3) | complement `= ⋃ {U ∣ Etale (U.ι ≫ f)}`, open | true by definition | R07 |
| `ramificationLocus_subset_nonEtaleLocus` | any `f` (r3) | `Etale → FormallyUnramified → stalkMap` formally unramified | true | R07 |
| `isClosed_branchLocus` (finite) | square map; open immersion `𝔸¹ ∖ {0} → 𝔸¹` (r3) | finite ⇒ integral ⇒ universally closed (`Finite.lean` line 117, `UniversallyClosed.lean` line 45); image of the closed ramification locus `V(x)` is `V(u)`, closed; open immersion: ramification locus `∅` | true | none |
| `ramificationLocus_spec` (no finiteness) | `R → S` any, `𝔮` over `𝔭` (r3) | `Ω_{S_𝔮/R_𝔭} = Ω_{S_𝔮/R}` since `Ω_{R_𝔭/R} = 0`; `Algebra.unramifiedLocus` is `FormallyUnramified R S_𝔮` (`Unramified/Locus.lean` line 45) | equal sets | none |
| `nonEtaleLocus_spec` (fp) | standard étale `S` (r3) | `Algebra.etaleLocus = {q ∣ FormallyEtale R S_q}` (`Etale/Locus.lean` line 36); row 3 | equal sets | none |
| `branchLocus_spec` | square map (r3) | `comap '' V(x) = V(u)` | agree | none |
| `isNormalDomain_iff_of_etale` (README, 025P) | `A` field, `C = A × A`, `𝔮` first factor; `A = k[t]_(t)`, `B = A[s]_(…)/(s² − t − 1)`, char `≠ 2` (r3) | `B = A`; `B` étale over `A` (derivative `2s` a unit) and a DVR: both normal domains | iff holds; converse is faithfully flat descent, Stacks 10.164.3 in the proof of 025P | R03 (name) |
| `exists_elementaryEtale_finite_of_isolated` (02LK) | origin of `t ↦ t²` on `𝔸¹`, char `≠ 2` (r3) | `U = S`, `V = X` already finite with one point over `0`; `κ(x) = κ(v) = k` | matches 02LK (i)–(iii) and its "Moreover" clause | R03 (name) |
| `etale_of_etale_comp_surjective` (036W) | `g = id`; `g` a Zariski cover (r3) | lfp, flat, `Ω = 0` descend along étale surjective `g` (`Ω_{X'/Y} = g^*Ω_{X/Y}`, `g` faithfully flat) | iff holds | R03 (name) |
| `exists_etale_of_formallyUnramified_stalk_codimOne` (0BMB) | `d = 1`; constant map `𝔸¹ → 𝔸¹`; `𝔸² → 𝔸²/±1`; square map at the origin; Frobenius (r3) | `d = 1`: both stalks DVRs, local map injective hence flat, étale; constant map: fibre `𝔸¹`, (3) fails; quotient: target `A₁`-singular, (2) fails, `Ω ⊗ κ = k²`, not étale; square map: `V(x)` ramified, (5) fails; Frobenius: (5) fails everywhere | matches 0BMB (1)–(5); Checks are correct negative controls | none |
| `etaleAt_of_unramifiedAt_codimOne` (Stacks form) | same (r3) | hypotheses translate by rows 1 and 5; `f` lft on an open `U ∋ x` containing every generization of `x` | sound | none |
| `isEtaleAt_of_purity` (affine) | `R = k[u,v]`, `S = k[x,y]`, `u = x²`, `q = (x,y)` (r3) | `q.height = 2 = (u,v).height`, `(x)` of height 1 ramified: hypothesis (5) and the conclusion both fail; `1 ≤ q.height` in `ℕ∞` fine | sound | none |
| `etale_of_etaleAt_codimOne` (§2.2 README, and the R02 Lean form) | `Spec L → Spec K`, `L/K` purely inseparable of degree `p`; `𝔸¹_L → 𝔸¹_K`; square map (this review) | points: no codimension-one point, RHS vacuous, `Etale` false, `hgen` false (the generic point is the only point and `f` is not étale there): excluded; curve: `Ω_{L[s]/K[s]} ≠ 0` at every closed point, RHS false, LHS false; square map: `hgen` holds (étale off `V(x)`), RHS fails at the generic point of `V(x)` (`d = 1`, `Ω ≠ 0`), LHS false (`Ω ≠ 0` at the origin) | sound; `hgen` is implied by the RHS when `dim X ≥ 1` (a redundancy, not a defect) | R02 (state it) |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite` | square map at `(x,y)`: `2 = 2`; generic points `0 = 0`; `𝔸² → 𝔸²/±1` at the origin `2 = 2` (r3) | `R → S` injective; 00Q9 gives `S_𝔮 = R'_{𝔮'}`, `R'` integral over normal `R`; going down (00H8) for `R_𝔭 → S_𝔮`, Noetherian, so 00ON (`KrullsHeightTheorem.lean` line 486) with fibre height 0; 02JU with `trdeg = 0` agrees | equality sound | none |
| `ramificationLocus_eq_nonEtaleLocus` | generic point; `d ≥ 1` (r3) | generic: `K(Y) → K(X)` finite separable ⇒ flat + formally unramified ⇒ row 2; `d ≥ 1`: generizations of an unramified point unramified (open), 0BMB with the previous row | equality sound; `f` lfp since lft over locally Noetherian `Y` | none |
| `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` | Frobenius (`hne` fails, `z = η`, `d = 0`); empty ramification locus (vacuous); square map, `z = V(x)`, `d = 1` (r3) | `z ≠ η` since the closed set would be `X`; `d ≥ 2` gives a height-one prime of `𝒪_{X,z}`, a proper generization, unramified by `hmax`; 0BMB ⇒ étale ⇒ unramified at `z`, contradiction | sound | none |
| `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` | square map, `w = V(u)`, `dim 𝒪_{Y,w} = 1`; `𝔸² → 𝔸²/±1`: branch locus the origin, `dim = 2`, target regularity needed (r3) | `z₀` of least height among ramified generizations of `z` has no proper ramified generization; `f z₀ ⤳ w`, `f z₀ ∈ branchLocus` ⇒ `f z₀ = w`; previous row and the dimension equality | sound | none |

Convention 5 (étale homomorphism of local rings as `B ≅ C_𝔮` for étale `C`): Stacks Definition 41.11.1 (0258) and Lemma 41.11.2 (039L), equivalent for `A` Noetherian (r3); no change.

**Previous findings re-verified at this head, with the lines read.** R01: SchemeAndStackFoundations README lines 5865–5891, 5915–5918; its `Suggested.lean` declares none of the five names (grep: 0), so there is no clash of fully qualified names, only two owners of the object. R02: grep of `Suggested.lean`; scratch elaboration above. R03: grep of `Suggested.lean` for the thirteen names. R04: AbhyankarLemma README on main, lines 31, 80, 101, 363, 375, identical in the pull request's checkout. R05: SchemeAndStackFoundations lines 5838–5842 (*IsRegular.of_etale*), ModularCurves lines 1288–1336. R06: stacks-02G4 line 3333, stacks-02GF lines 3448–3456. R07, R08: `Suggested.lean` lines 93–100 and 4–22. R09: `git diff --stat origin/main...HEAD` excluding the fifteen folders: the same two files, one line each.

**Ownership against open work.** `roadmaps grep` over main and the 446 open pull requests of the index of 2026-11-05 for `0BMB`, `branchLocus`, `nonEtaleLocus`, `02LK`, `036W`, `025P`: every hit for the three loci and the two lemmas is in `TauCetiRoadmap/PurityOfBranchLocus/` (carried by pull requests 1807 and 1808 and on main); 0BMB is otherwise cited as a consumer only (CrystallineCohomology, LefschetzPencilsAndVanishingCycles, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology); the CalibratedGeometry hits for `025P` are an unrelated numeral. No other roadmap states these objects.

**Declared gaps.** None declared (no readable `design/plan.json`); the README states no `gap:` contract. Nothing to check.

**Sources.** The folder being unchanged, the previous report's locator checks of the seeded sample carry forward (0BMB = Lemma 58.21.4, Fundamental Groups text line 2524; 02LK line 5984; 036W line 3086; 025P line 976; 0AFS line 12566; 00Q9 line 14138; 00H8 line 4098; 00ON line 12677; 02JU line 6106; SGA 1 X 3.1 at arXiv text line 8359, I 9.5 at line 987). Re-opened this round: 02G4 and 02GF as above.

## Not verifiable

- none. (Nagata 1959 and Zariski 1958 are cited only as the origin of the theorem, with no locator-bearing claim.)

## Source issues

- **Misprint** in sga1 at X 3.1, remark after the theorem, printed page 212: the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
