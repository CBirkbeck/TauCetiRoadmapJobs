# Review of K2SymbolsBrauerPartII (pull request #1432 at d3eace4)

**Verdict:** accepted

Incremental re-review of the 2 lines changed since a495ae1 (`scratch/changes.md`: README only, +1/−1, the EtaleCohomologyFoundations/SchemeAndStackFoundations contract sentence at line 70; `Suggested.lean` is byte-identical to 158e932). The one previous finding is accounted for under `## Previous findings`; the changed sentence and everything that cites it (§5.3's comparison paragraph at line 833 and its *Needs* line 841) were reviewed in full. No finding remains, new or carried; the gate passes.

## Previous findings

- R01 — repaired: line 70 "Consume EtaleCohomologyFoundations §0.9's `ClassicalAlgebraic.cycleClasses` for the Kummer first Chern class of a line bundle, and its `ClassicalAlgebraic.lciCycleClass` for the localized class of a regular closed immersion between locally noetherian schemes with ℓ invertible on the target, with its Cartier-divisor agreement". This is the sentence the repair prescribed, extended by the clause "the number-field pair (Spec O, v) is not a smooth pair over any base, so the smooth-pair class does not cover it", which records why the smooth-pair class is not the one consumed. Resolved against EtaleCohomologyFoundations §0.9 on main (a5530724): README line 1135 provides `lciCycleClass` for a regular closed immersion of pure codimension c between locally noetherian schemes with n > 0 invertible on X, and proves Cartier agreement, coefficient reduction, transverse pullback and agreement with `cycleClasses` in its smooth-pair scope; line 1122 provides `cycleClasses`' Kummer first Chern class of a line bundle for n invertible on a qcqs scheme. The sentence now claims nothing beyond those two scopes, and the repair introduced no new problem (the rows below).

## Verified sound

### Gate, order, build and signatures

My gate run at d3eace4 (the worker's at `scratch/gate.md` adds `build=0`):

```text
gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The prescribed dependency check:

```text
depcheck: 225 roadmaps, 2126 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean at d3eace43. The diff names no supplier that the previous head did not already name (EtaleCohomologyFoundations is on main; the declaration added, `lciCycleClass`, lives in the same §0.9 already on the *Needs* line 841).

`lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for all 8 declarations: exit 0, the file's own warnings exactly the five `sorry`s (lines 54, 64, 75, 97, 104), eight elaborated types printed. Each of the eight was compared mechanically with `scratch/signatures.md`: all eight agree (`SymbolRel`, `SymbolAlgebra`, `symbolAlgebra_isCentralSimple`, `symbolAlgebra_split`, `symbolAlgebra_matrix_corner`, `conicSymbol`, `conicSymbol_real_eq_neg_one_iff`, `conicSymbol_eq_hilbertSymbol`), every binder present. The Lean file is unchanged since 158e932, so the r5 one-tactic probe (nine attempts on the three Layer 2 headlines, all failing) and its headline-coverage audit carry forward; the pins are unchanged (Mathlib `6b7abb3c7686`, Tau Ceti `a91d3aafa8cd`).

### Sources: the seeded sample, where it falls in the diff

The diff touches only the contract sentence at line 70, which carries no source locator. Of the sampled targets, only §5.3 depends on it (through "§0.9's Cartier-divisor agreement" at line 833 and the *Needs* line 841); its locators are untouched and were re-read this round where cheap: tate line 575 (Theorem (6.2), printed p.270 beginning at line 558, continuing onto p.271 at line 600): S finite non-empty, containing the archimedean places and, in the number-field case, the places above ℓ; μ_ℓ ⊂ F; F any global field; the sequence 0 → μ_ℓ ⊗ Pic O_S → K₂O_S/ℓ → (⊕_{v ∈ S∖S_c} μ_ℓ)₀ → 0 with the last map the norm-residue symbols. This is §5.3's display and its "every global field" scope, as stated. weibel line 13950 (III, Example 6.10.1, Kummer theory: H¹(F, G_m) = 0 and H²(F, G_m) ≅ Br(F), the field contrast §5.3 cites); the cached page carries no printed number at that spot, so the printed p.242 of the README stands on the earlier rounds' offset. The other sampled targets (1.1, 1.2, 1.4–1.6, 2.1, 2.2, 2.4, 3.2, 3.4, 3.5, 4.3, 5.0e, 5.5) are untouched and stand on the r4–r6 verification.

### Adversarial values

Rows for untouched statements are those of the r6 report (its 17 rows for the §5.0d/§5.3 passages, from "Check line 852, cycle condition" to "Line 841, new *Needs* edges"), of the r5 report (its 22 rows) and of the r4 report (its 56 rows), carried forward unchanged. New rows for the changed statement:

| Statement | Instance | Values | Result |
|---|---|---|---|
| Line 70, `lciCycleClass` scope on (Spec O, v) | number field, S ⊇ places above ℓ and archimedean, v ∉ S | Spec O: Dedekind, so locally noetherian and regular; O_v a DVR, 𝔭_v locally principal, so v → Spec O is a regular closed immersion of pure codimension 1 = c > 0; ℓ ∈ Oˣ since S ⊇ places above ℓ; v is an effective Cartier divisor | in ECF §0.9's `lciCycleClass` scope (line 1135), with Cartier agreement available |
| Line 70, degree and twist of the class | c = 1, Λ = ℤ/ℓ | cl_v ∈ H_v^(2c)(Spec O, Λ(c)) = H²_v(Spec O, μ_ℓ) | agrees with LPVC §0.10's trait Check (degree two, twist one on the H²_v side) used at line 833 |
| Line 70, "not a smooth pair over any base" | Z = Spec k(v) → B smooth, X = Spec O → B smooth | fibre of Z over its image b is Spec k(v), smooth over k(b) and zero-dimensional, so k(v)/k(b) finite separable and k(b) finite of characteristic p; Z → B flat of finite presentation with m_b k(v) = 0 forces O_{B,b} = k(b); then k(b) → O_{X,v} = O_v makes a characteristic-0 DVR a 𝔽_p-algebra | contradiction; the clause holds for every number field, every S and every v |
| Line 70, instance of the clause | F = ℚ(μ₃, √2), ℓ = 3, S = {3, ∞}, v above 2 | O = O_F[1/3] ramified over ℤ[1/3] at 2: Spec O → Spec ℤ[1/3] not even étale at v; the general argument above excludes every other base | the smooth-pair class does not cover (Spec O, v), as stated |
| Line 70, scope of the clause | function field, (Spec 𝔽_q[t], v) | both Z and X smooth over Spec 𝔽_q: a smooth pair, covered by `cycleClasses` | the clause is restricted to "the number-field pair", correctly; §5.3's comparison (line 833) is number-field only |
| Line 70, `cycleClasses` for the line-bundle class | O(v) on Spec O, ℓ invertible | ECF line 1122: Kummer c₁ of a line bundle for n invertible on a qcqs scheme; Spec O affine | in scope without any smooth-pair hypothesis; the sentence splits the two uses correctly |
| Line 70 against lines 833 and 841 | §5.3's citations | line 833 cites "§0.9's Cartier-divisor agreement" without a declaration name; line 841 cites "EtaleCohomologyFoundations §0.9" | consistent with the contract; no other README line names either declaration (grep: line 70 only) |
| Line 70, `lciCycleClass`'s hypothesis "ℓ invertible on the target" | target X = Spec O | ECF line 1135: n > 0 invertible on X, the target of i: Z → X | the sentence's "target" is the right one of the two schemes |

### Pinned library audit

No new object is constructed by the diff; `cycleClasses` and `lciCycleClass` are roadmap declarations of EtaleCohomologyFoundations §0.9 on main, not library names, which is why `scratch/citations.md` lists them as found in no pinned source. The r5 duplication and ownership audit of the symbol algebra and conic symbol stands; the Lean file is unchanged.

### Supplier citations resolved this round

EtaleCohomologyFoundations §0.9 (main, a5530724, README lines 1120–1143: `cycleClasses` at 1122, `lciCycleClass` at 1135). The other suppliers of §5.3 (SchemeAndStackFoundations §3.4 on main; KTheoryFiniteLocalFields §§1.1–1.2, 1.8, 2.2; LefschetzPencilsAndVanishingCycles §0.10; ArithmeticKTheory §6.13 at the heads of their open pull requests) are unchanged from r6 and are not re-resolved: the diff neither adds nor alters a citation of them.

### Shape and policy

The changed line keeps the house shape: prose, backticked names only for supplier declarations, no LaTeX, process words or pull-request numbers (the gate's scanners agree). Ownership against open pull requests whose files the brief does not give was not checked beyond the roadmaps indices of 2026-11-05.

## Not verifiable

- The admitted proofs are not verified; the chain-model Check of §5.3 is a computation in a model, and whether that model is the library's raw boundary and Bockstein is deferred, as the Check says, to KTheoryFiniteLocalFields §§1.1–1.2 and 2.2 and GeneralAlgebraicKTheory §8.13.
- The printed page number of Weibel III.6.10.1 is not visible on the cached page (the OCR header reads only "Chapter III"); the locator p.242 is carried from the earlier rounds.

## Source issues

- none
