# GATE-HabiroCohomologyFoundationsPartII~5: answers to human review

One review comment, from roed-math (2026-11-06T06:18:55Z), makes two points. The closing request to switch the label back is a process step, not a mathematical point, and is not numbered here. Repair commit: `57328223` on top of `61e97fe`; only `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md` changed (17 lines). `Suggested.lean` is unchanged.

## H01 (roed-math) — applied

RefinedTraceMethods now owns the lift. At its head `b0ad346`, §6.1 has a new statement, “Spherical lifts of perfect δ-rings” (README line 2553). It constructs S_B flat over S_p^∧ with `Map(S_B,R) ≃ Hom(B/p,π₀R/p)`, full faithfulness and the map S_C → S_p over x ↦ p for C = ℤ_p{x}_∞. Its own §7.6 uses that map (line 3604), its Scope (line 7) claims the lift, and its Downstream consumers (line 4143) records our use. The construction therefore now comes before its first use, as the suggestion asked.

What changed:
- README §0.1, line 146: the bullet "Construct the unique p-complete connective E∞ spherical lift S_B … Construct that perfect-base lift by spherical Witt vectors … it is a construction target" now reads "Use the spherical lift S_B … from RefinedTraceMethods §6.1".
- sphericalPerfection and relativeFormalEtaleLift stay as §0.1 targets. The sphericalPerfection route now uses the imported universal property: the map `S_{A_∞}` → colim(can⁻¹∘φ) at the identity of A_∞/p reduces to the identity of A_∞, so it is an equivalence.
- Line 148 adds one sentence saying how relativeFormalEtaleLift differs from the imported lift: at T = S_p with C perfect, U_C is the imported S_C. What this roadmap adds is the marked base T and inputs that are neither perfect nor finitely presented.
- The same edit is made everywhere the lift was claimed: Scope line 9, supplier row line 21, contract line 90, §0.1 intro line 141, Needs line 170, Examples line 174, quotientLift_perfected line 323, §2.1 Checks lines 336–337 and Needs line 343, §2.3 item 1 line 382, Layer 2 Dependencies line 404, and Downstream consumers line 537.
- The Checks on S_B that duplicated RefinedTraceMethods §6.1 (B = ℤ_p, B = 0, x ↦ 0 versus x ↦ p) are replaced:
  - a sphericalPerfection Check (line 161);
  - a Check that relativeFormalEtaleLift recovers S_C over S_p (line 163);
  - a §2.1 Check that only the specialization x ↦ p yields a Moore spectrum (line 337).

## H02 (roed-math) — answered

The suggestion to cite StableHomotopyKTheoryPartII §4.8 applied only if RefinedTraceMethods declined ownership, and it accepted (H01). StableHomotopyKTheoryPartII §4.8 has also changed at its head `e8c1239`:
- it now defines SW(k) as the marked étale lift of RefinedTraceMethods §6.1 at W(k) (line 627);
- its Downstream consumers (line 1075) say that a consumer of general perfect δ-ring lifts takes from §4.8 only the finite-field statements (finite-free rank d over S_p^∧ and the Frobenius comparison).

This roadmap constructs no such lift and uses neither statement. Its only finite-field instance is W(𝔽_p) = ℤ_p with lift S_p, which RefinedTraceMethods §6.1 covers in its B = ℤ_p Check. No citation of StableHomotopyKTheoryPartII is needed.

## Ownership against other roadmaps, and a consumer to repoint

- **Owner of the lift.** `roadmaps grep -i 'spherical Witt|spherical lifts? of (a )?perfect'` over main and all 466 open heads finds one constructor: RefinedTraceMethods §6.1. This README matched only at the old head `61e97fe`; the repair removes that match.
- **GeneralAlgebraicKTheoryPartII needs to repoint (worker action).** At its head `7f6a44d` it still says "HabiroCohomologyFoundationsPartII §0.1 owns the spherical lifts of perfect p-complete δ-rings". This appears at README line 15, in the supplier contract at lines 226–228, in the §6.1a route at line 1677, and in the Needs and Dependencies at lines 1692 and 1801.
  - It is later in the merge order (position 319, after this roadmap at 318).
  - The id §0.1 is kept here and the section text names RefinedTraceMethods §6.1, so the citation still resolves, but the ownership claim is now wrong.
  - It should cite RefinedTraceMethods §6.1, which comes earlier (position 314). I cannot edit that roadmap; its pull request needs this change.
- **Not a dependency.** No id this roadmap cites is changed, and the citation targets are new-roadmap pull requests already in the merge order. Nothing here is defined only by an open revision.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Imported S_B contract (line 90) | B = ℤ_p at p = 2, 3; B = 0 | S_{ℤ_p} = S_p: π₁ = ℤ/2 at 2 (η), π₃ = ℤ/3 at 3 (3-part of ℤ/24). B = 0: Map(0,R) ≠ ∅ ⇔ R = 0 ⇔ π₀R/p = 0 for derived p-complete π₀R, so both sides of the universal property agree | consistent with RefinedTraceMethods §6.1 Checks | contract added |
| sphericalPerfection route (line 146) | A = ℤ_p; A = 0; A = ℤ_p⟨x⟩ with φ(x) = x^p; wrong model id_{S_A} | ℤ_p: Map_CAlg(S_p,S_p) is contractible, so can⁻¹∘φ = id and the colimit is S_p. 0: the colimit is 0. ℤ_p⟨x⟩: the stage-n copy of x is x^{1/p^n}, π₀ of the colimit is ℤ_p⟨x^{1/p^∞}⟩, and the comparison map reduces to an endomorphism of a perfect ring that is the identity mod p, hence the identity (Hom(W(k),W(k′)) = Hom(k,k′)). id_{S_A} reduces to id_A ≠ (A → A_∞) | holds; the wrong model is excluded | route made explicit with the imported universal property |
| KU Lemma A.1 flatness input | A p-complete, p-torsion free | A ≅ (⊕_J ℤ_p)^∧ (lift a basis of A/p); then (⊕_J S_p)^∧ → S_A is an equivalence after ⊗ℤ_p, hence an equivalence, so S_A is flat as A.1 assumes (KU line 3900) | no added hypothesis needed | none |
| relativeFormalEtaleLift at T = S_p (line 148) | C = ℤ_p⟨x^{1/p^∞}⟩ at p = 2, 3; C = 0; wrong model HC | (L_{C/ℤ_p})⊗𝔽_p = L_{𝔽_p[x^{1/p^∞}]/𝔽_p} = 0. π₁U_C = C/2 ≠ 0 at p = 2; π₁ = 0 and π₃ = C/3 at p = 3. Our Map(U_C,U_D) ≃ Hom(C,D), and RefinedTraceMethods gives Hom(C/p,D/p); these are equal for perfect C, D. C = 0 gives U_0 = 0 = S_0. HC: π₂((HC⊗_Sℤ)^∧_2) = H₂(Hℤ;ℤ)⊗C = C/2 ≠ 0, so the discrete marking fails | holds; HC excluded | sentence and Check (line 163) added |
| quotientLift_perfected (line 323) | A = B = ℤ_p{x}^∧_p (HabiroCohomologyFoundations §5.15 Check), R = A/x^α | B_∞ = ℤ_p{x}_∞ is perfect, so S_{B_∞} = S_C. Odd p, α = 2: E1QuotientExponent holds and S_C/x² is E₁. p = 2, α = 2: fails, agreeing with the line 369 Check (the algebraic theorem §5.19 covers it) | consistent | citation added |
| Specialization map (line 337) | x ↦ p and x ↦ 0 at p = 2, 3; α = 2, 4, 6 | π₀ images p ≠ 0. Mod p they also differ through δ(x): δ(2) = −1 ≡ 1 mod 2 and δ(3) = −8 ≡ 1 mod 3. Base change of S_C/x^α: along x ↦ p it is cofib(p^α) = S_p/p^α (S/9 at p = 3, α = 2; S/16 and S/64 at p = 2, α = 4, 6); along x ↦ 0 it is cofib(0) = S_p ⊕ ΣS_p with π₀ = ℤ_p ≠ ℤ/p^α | only x ↦ p gives a Moore spectrum | Check rewritten |
| §2.3 item 1 (line 382) | A = R = ℤ_p | sphericalPerfection = id, so the base change of the lift of R̂_p is the lift itself | consistent | name added |

Checks on S_B were removed from this roadmap because RefinedTraceMethods §6.1 states them. Every remaining §0.1 target still has at least three Checks: lines 160–168 cover completed étale lifting, relativeFormalEtaleLift and sphericalPerfection.

## Suggested.lean signature check

`Suggested.lean` declares nothing; its docstring explains why. So there was no `#check` scratch file to elaborate. The docstring entry "sphericalPerfection (§0.1) needs … spherical Witt vectors" is still accurate: the target `S_{A_∞}` is that carrier, and it is absent at the pins. The file was not changed.

## Build and gate

- `lake build TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested`: `Build completed successfully (8976 jobs).`
- Gate, run after the commit: `gate HabiroCohomologyFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
  - The first run, before the commit, failed only on `dirty=1`.
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `roadmaps resolve` on the README finds no cross-roadmap citations or Lean names that exist nowhere.

No suspicious instructions were found in the review text. No sources were fetched and `needs-references.toml` was not created.
