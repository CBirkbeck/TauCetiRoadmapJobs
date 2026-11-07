# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at c83a1a6)

**Verdict:** needs changes

This re-review covers only the 77 lines changed since ffdd816. All four previous findings are repaired, and none of the repairs introduced a new defect. The gate passes and the dependency check reports 0 problems. One blocking finding is new and comes from outside the diff: PurityForFlatCohomology's open head, committed on the day of this review, states this roadmap's local Lefschetz theorem as its own §1.5. Each README says the other imports it. The consumer locator `§PF.1` used for that hand-off exists nowhere (P3).

## R01 (P2) — Local Lefschetz has two owners, PurityForFlatCohomology and this roadmap, and each hands it to the other

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:1406` (§7.3): "Let (R, 𝔪) be a regular local ring, f ∈ 𝔪 and ℓ a prime invertible in R. The restriction map H^i_𝔪(R, ℤ/ℓ) → H^i_𝔪(R/(f), ℤ/ℓ) is bijective for i < dim R − 1 and injective for i = dim R − 1". Also `:1374` (§7.1), `:23` ("there is no dependency on that consumer") and `:1570` ("PurityForFlatCohomology §PF.1 consumes local Lefschetz (§7.3)").

**Claim:** This roadmap owns local Lefschetz (§7.3) and the vanishing on principal punctured opens (§7.1). PurityForFlatCohomology consumes them.

**Witness:** At #1840 (head 8cbde9b), `TauCetiRoadmap/PurityForFlatCohomology/README.md` states §7.3 verbatim as its §1.5 (`:852`) and §7.1 as its §1.4(a) (`:822`). It says this roadmap imports them (`:164–165`, `:2791–2792`). The merge order puts it at line 214 and this roadmap at line 374.

**Comparison of the duplicated statements:**
- §7.3 and PurityForFlatCohomology §1.5 have the same quantifiers: R regular local, not assumed excellent, f ∈ 𝔪, ℓ invertible, bijective below dim R − 1 and injective at dim R − 1. Both cite CS24 Lemma 3.2.3, p. 33.
- §7.1 and §1.4(a) are the same statement: R strictly henselian, excellent and regular of dimension d, with `H^i(Spec R[1/f], ℤ/ℓ) = 0` for i > d.
- PurityForFlatCohomology §1.4(b)–(c) are the regular cases of §§6.11–6.12 here.

So the object has two owners, and the hand-off runs both ways. As the merge order stands, this roadmap's claim that PurityForFlatCohomology is a downstream consumer is an upward edge for that roadmap.

**Repair:** settle one owner, and have the other cite it by section. Either repair below is checked against the depcheck: a supplier earlier in the merge order produces no UPWARD line.

*Recommended: this roadmap owns.* PurityForFlatCohomology §1.4(a) is Gabber's affine Lefschetz theorem (ILO XV 1.2.4) restricted to strictly henselian excellent regular local rings. Here that is §§5.6–5.7, whose proof is Layers 1–5 of this roadmap. That roadmap cannot own it without re-planning this one.
- In this folder, replace the last clause of line 23 with: "local Lefschetz (§7.3), the vanishing on principal punctured opens (§7.1) and local duality on strictly local excellent schemes (§§6.11–6.12) are owned here; PurityForFlatCohomology consumes them and states none of them, so there is no dependency on that consumer".
- Repoint lines 1418 and 1570 as in R02.
- In its own pull request, PurityForFlatCohomology then deletes §1.4 and §1.5, and cites §§7.1, 6.11, 6.12 and 7.3 in a `From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` contract. The dependency check then moves it after this roadmap.

*Alternative: PurityForFlatCohomology owns, at its earlier place.*
- Delete §7.3 and §7.1 here, and cite PurityForFlatCohomology §§1.5 and 1.4(a) in Scope and in a new `From TauCetiRoadmap.PurityForFlatCohomology` contract.
- Keep §7.2 as the route step only if a target of this roadmap still uses it.
- Add one clause to §§6.11–6.12 saying that they generalise PurityForFlatCohomology §1.4(b)–(c) from excellent regular local rings to strictly local excellent schemes and arbitrary pinned dualizing complexes.
- Drop the "no dependency on that consumer" clause at line 23 and the consumer sentences at lines 1418 and 1570.

**Checked on the duplicated instances:** both statements give the same values.
- For a DVR with f a uniformizer, only injectivity in degree 0 is claimed: `0 → ℤ/ℓ`.
- For k⟦x, y⟧ with f = x, both sides vanish in degrees ≤ 1, and in degree 2 the map `0 → ℤ/ℓ(−1)` is not surjective.

So nothing is lost under either option.

## R02 (P3) — The consumer locator "PurityForFlatCohomology §PF.1" resolves nowhere

**Location:** `README.md:1418` ("the hypersurface case of CS24 3.2.4, consumed by PurityForFlatCohomology PF.1") and `README.md:1570` ("PurityForFlatCohomology §PF.1 consumes local Lefschetz (§7.3)").

**Claim:** PurityForFlatCohomology has a section PF.1 that consumes §7.3.

**Witness:** PurityForFlatCohomology at #1840 numbers its sections 0.1, 0.2, …, 1.1, … (headings from `:514`). The string "PF.1" occurs 0 times in it, and 0 times in its board package README. Its hypersurface step is §1.6, "where absolute purity and §1.5 conclude" (`:882`; *Needs:* `:884`).

**Repair:**
- Under R01's recommended option, replace "PF.1" and "§PF.1" by "§1.6 (the étale depth is at least the virtual dimension)". That section's hypersurface case is local Lefschetz plus LefschetzPencilsAndVanishingCycles §0.10, which is the sentence at line 1570.
- Under the alternative, delete both clauses.

Checked: §1.6 at the #1840 head lists §1.5 and LefschetzPencilsAndVanishingCycles §0.10 among its *Needs*, the two inputs line 1570 names.

## Previous findings

- R01 — repaired: `Suggested.lean:71–80` and `:94–106` now read "∃ _ : Algebra (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A, Function.Injective (algebraMap …) ∧ …". There is no `letI`; the gate has `statement-hygiene=0`. The bound instance is the one the conjuncts use (see Verified sound).
- R02 — repaired: `README.md:25` and `:110` now name `VanishingCycles.etaleExceptionalInverseImage`, `ClassicalAlgebraic.lciCycleClass` and `ClassicalAlgebraic.smoothBoundaryPurity`, with "twists for n invertible on X". A grep for cycleClassMap, IsPure, dualizingComplex and IsInvertibleOn finds 0 hits in the folder.
- R03 — repaired: `README.md:1144` now reads "checked on the normalization of the closure of y in the strict henselization at x̄, a strictly henselian trait, where it is the Kummer computation of the first Check (ILO XVII 2.4.2.1, 2.4.3.3–2.4.3.4)".
- R04 — repaired: `README.md:328` begins "For X quasi-separated, …" and ends "Layers 2–5 use the small site only over noetherian X, which is quasi-separated". The doubled-origin non-example is a new Check at `:354`.

## Verified sound

**Scope.** I read the whole diff and every passage that cites or depends on it:
- the Scope paragraph (`README.md:23, 25`) and the EtaleCohomologyFoundations contract (`:107–110`);
- §0.8 in full (`:320–358`), plus every use of the h-site in Layers 2–8 (`:614, 628, 708–724, 774–780, 812, 966`);
- §§1.1–1.2 (`:372–396`);
- §6.1 (for the sign of sp), §§6.2–6.3 in full, the §6.6 Checks, §§6.11–6.12, Layer 7 in full and the Layer 6 Dependencies;
- `Suggested.lean` in full.

The seeded sample falls in the changed text only at §6.2, which I re-verified against the source below. The other sampled targets (0.1, 0.4, 3.5, 4.1, 4.2, 5.4, 5.6, 6.5, 6.9, 6.10, 6.12, 7.1, 7.2, 8.1) are textually untouched since the verification at 047baea. §§6.12, 7.1 and 7.2 were re-read here for R01.

**Gate and dependency direction.** I ran the gate on this head. Every scanner is 0, including `statement-hygiene=0`, `outside-folder=0`, `stray-files=0` and `depcheck=0`, and the result is `OK` (exit 0). The worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder lists 0 paths. The required dependency check, complete output:

```text
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The diff adds citations of EtaleCohomologyFoundations §0.10 (on main) and repoints the §0.9 and §F.5 citations to main's names. It adds no roadmap edge.

**Elaboration and signatures.** I ran `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` from the pull-request checkout: 13.5 s, exit 0, exactly six `declaration uses sorry` warnings (lines 65, 88, 181, 225, 262, 280) and nothing else. In a scratch copy:
- `#check @cohenGabber_equalCharacteristic` and `#check @cohenGabber_equivariant` print the types of `scratch/signatures.md`. Every binder is present: `IsAdicComplete`, `IsReduced`, `CharP A p`, `hequi` in the first; `Algebra F A`, `Finite G`, `horder` in the second.
- With explicit printing, the `Module.Finite`, `Module.IsTorsionFree` and tensor-product instances are all `Algebra.toModule … x` for the bound `x`, not some other instance.
- `infer_instance` fails on `Algebra (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A`. No global instance can witness the existential vacuously.
- Three proved examples show the two forms are equivalent: `⟨f.toAlgebra, h⟩` gives the new form from the old, and the converse uses `Algebra.algebra_ext` (Mathlib `Mathlib/Algebra/Algebra/Defs.lean:250`).
- One-tactic probes: `simp` makes no progress on `cohenGabber_equalCharacteristic`. Neither theorem is padding.

The other seven declarations are textually unchanged; the only other change is one word of the docstring ("cycle-class morphism").

**Source checks at this head** (ILO14 is the arXiv v1 text; file page = printed page + 6):

| Target / passage | Text checked | Outcome |
| --- | --- | --- |
| §6.2 (sample): Définition 2.1.2 | ILO14 lines 12581–12601 (printed p. 263): putative = K ∈ D⁺(X_ét, Λ) with pinnings RΓ_x(K) ≅ Λ(δ(x))[2δ(x)]; potential = commuting with sp at every immediate specialization; lines 12602–12610: only for noetherian excellent ℤ[1/n]-schemes | Agrees with the two data fields, the Prop field and the class arguments. The new carrier sentence names Mathlib's `Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`), which exists. |
| §6.2: Remarque 2.1.3, Théorème 5.1.1 | lines 12611–12613; 13878–13885 (printed p. 287) | Unchanged claims; locators hold. |
| §6.3 regular term: Proposition 2.4.1.1 | lines 12669–12680 (printed p. 265): pinning at x = inverse of the Gysin map Cl_i : Λ(δ(x))[2δ(x)] → i^!Λ, an isomorphism by absolute purity | Same as the README's construction: cl_x : Λ_x → i_x^!Λ(c)[2c] after the twist-shift by (−c)[−2c], with δ(x) = −c, then inverted. |
| §6.3: Proposition 2.4.4.1 and proof | lines 12835–12851 (printed pp. 267–268): reduce to X strictly henselian at x; C = closure of y, n : C̃ → C its normalization; i^!Λ potential ⇔ n^!i^!Λ potential (2.4.3.3) ⇔ Λ(−c)[−2c] on the trait C̃ (2.4.3.4), potential by 2.4.2.1 | The repaired §6.3 Check (`:1144`) follows this route step for step. |
| §6.3 Check: 2.4.2.1, 2.4.3.3, 2.4.3.4 | lines 12682–12694 (printed p. 265), 12748–12763, 12765–12781 (printed pp. 266–267) | Locators and line numbers correct. 2.4.3.3's proof gives the Gysin map of a purely inseparable residue extension as multiplication by its degree (lines 12760–12763). |

**Library and supplier citations resolved at this round** (EtaleCohomologyFoundations on main at eaf17b1):

| Citation in the diff | Where found | Outcome |
| --- | --- | --- |
| §F.0.3 `VanishingCycles.etaleTateTwists`, "for n invertible on X" | `README.md:231–239`; `Suggested.lean:497` | Exists, "For N invertible on X and NΛ = 0", with Λ(1) = Λ ⊗ μ_N, negative dual powers and twist addition. |
| §0.7 `ClassicalAlgebraic.supportLocalization`, with the support identification | `README.md:443`; `Suggested.lean:512` | Exists: i^!, sections supported on Z and the triangle i_*i^!K → K → Rj_*j^*K, which identifies RΓ_Z(X, K) with RΓ(Z, i^!K). Any ring Λ. |
| §0.9 `ClassicalAlgebraic.lciCycleClass` | `README.md:1135`; `Suggested.lean:515` | Exists, exactly as cited: regular closed immersion of pure codimension c between locally noetherian schemes, n invertible on X, coefficient unit for c = 0. It agrees with `cycleClasses` on smooth pairs. |
| §0.10 `ClassicalAlgebraic.smoothBoundaryPurity` | `README.md:1147`; `Suggested.lean:516` | Exists: closed immersion between schemes smooth over k, `i^!Λ_X ≅ Λ_Z(−c)[−2c]`, "with its counit carrying the class of Section 0.9". |
| §F.5 `VanishingCycles.etaleExceptionalInverseImage` | `README.md:1181`, with the §F.2.4 geometry at `:599`; `Suggested.lean:555` | Exists: right adjoint to Rf_! on the finite-cohomological-dimension domain, with separated finite-type f between noetherian schemes. |
| §F.6 `VanishingCycles.smoothPurity` | `README.md:1202`; `Suggested.lean:556` | Exists: f^!Λ ≅ Λ(d)[2d]. The diff drops the earlier unsupported "composition and base-change laws". |
| LefschetzPencilsAndVanishingCycles §0.10 "pointwise pure" | head of #873, `README.md:708–709, 855–858` | Pointwise pure means `Λ(−d)[−2d] → i_x^!Λ` is an isomorphism at regular local points. Absolute purity holds for regular noetherian X via the fundamental class `cl_Z`, which is the invertibility §6.3 uses. |
| Tau Ceti at the pin | grep over the pinned package for `IsInvertibleOn`, `etaleTateTwists`, `lciCycleClass` | 0 hits; the docstring's "not statable" bullet stands. |

**Adversarial table.** The rows below carry computed values for every statement the diff changes and for every target a finding touches. Rows for untouched statements carry forward from the reviews at ffdd816, d6c3ae4, f7fc49c and 047baea. Throughout: Λ = ℤ/n with n invertible where required; complexes are graded cohomologically.

| Statement | Instances tried | Values on each side; wrong model | Result / change |
| --- | --- | --- | --- |
| `cohenGabber_equalCharacteristic` (new binder) | d = 0; d = 1, A = 𝔽_p⟦t⟧; A = 𝔽_p⟦x,y⟧/(xy); A = k⟦x,y,z⟧/(xy, xz) | **d = 0:** A is reduced artinian local, so a field equal to its residue field k. MvPowerSeries (Fin 0) k ≅ k via constantCoeff; the algebra is the inverse of the residue map. Rank 1, torsion-free, Frac ⊗ A = A étale. **𝔽_p⟦t⟧:** substitution by t, all conjuncts hold. **xy = 0:** t ↦ x + y; A is CM of dimension 1, free of rank 2, since A/(x + y) = 𝔽_p⟦x⟧/(x²) has length 2. Frac ⊗ A = 𝔽_p((x)) × 𝔽_p((y)) is étale. **(xy, xz):** hequi fails (A/(x) has dimension 2, A/(y,z) dimension 1). **Wrong model** "a global instance": none exists (`infer_instance` fails), and every conjunct uses the bound `x`. | Correct; equivalent to the previous ring-map form (proved in scratch). |
| `cohenGabber_equivariant` (new binder) | G trivial; G = ℤ/2 on k⟦t⟧ by t ↦ −t, char k ≠ 2; G = ℤ/2 on ℂ⟦t⟧ by coefficient conjugation; char 2 | **Trivial G:** the equivariance conjunct is vacuous. **t ↦ −t:** equivariance at X₀ forces algebraMap X₀ ∈ A^G. With X₀ ↦ t², A is free on 1, t, and k((t))/k((t²)) is separable of degree 2. X₀ ↦ t is excluded, since ρ g (t) = −t ≠ t. **Conjugation:** the identity map is equivariant with mapEquiv = conj on ℂ. **Char 2:** Nat.card G = 2 = 0 in A, so horder excludes it. | Correct. |
| README §§1.1–1.2 native-signature sentences (`:374, :394`) | against the Lean above | "Algebra structure of A over k⟦t⟧ with injective structure map; residue ∘ structure map = constant coefficient"; κ⟦t⟧ in §1.2 now matches its κ notation. | Correct. |
| Scope paragraph (`:25`) | main §§F.5, F.0.3, 0.9 | §F.5: a^!Λ_S for separated finite-type a over noetherian S on the finite-cohomological-dimension domain, plus the Verdier layer. §F.0.3: twists for n invertible. §0.9: lciCycleClass. All three match main. | Correct (previous R02 repaired). |
| Contract paragraph (`:110`) | each named declaration on main | Six names, each found with the stated hypotheses (table above). The new clause "§6.3 reads cl_Z as Λ_Z → i^!Λ_X(c)[2c]" holds because `H^(2c)_Z(X, Λ(c)) = H^(2c)(Z, i^!Λ(c)) = Hom(Λ_Z, i^!Λ_X(c)[2c])`. | Correct. |
| §0.8 bullet (`:328`) | X = Spec k[x₁, x₂, …]; Y finite type over X, U ⊂ Y affine | U is quasi-compact and X quasi-separated, so U → X is quasi-compact. U is open in Y, so locally of finite type, hence of finite type. Proper members are of finite type. So the composite refinement stays in the small category. | Correct. |
| §0.8 new Check (`:354`) | X = 𝔸^∞_k with doubled origin | U₁ ∩ U₂ = ⋃ D(xᵢ), and D(x₁), …, D(x_m) miss the point x₁ = … = x_m = 0, x_(m+1) = 1. So the preimage of U₂ under U₁ → X is not quasi-compact, and U₁ is not a finite-type X-scheme. Affine case: {X ∖ 0, id} is refined by {id}. | Correct; discriminates the quasi-separated hypothesis. |
| "Layers 2–5 use the small site only over noetherian X" (`:328`) | every h-site use | §2.4 (`:614`): noetherian quasi-excellent X. §3.6 (`:774`): noetherian S with finite-type S-terms. Layers 4–5 reach the small site only through §§2.4 and 3.6 (`:812, :966`). §3.3 (`:708`) uses the big h-topology on all schemes. Layers 6–8 do not use §0.8. | Correct. |
| §6.2 structure (`:1100`), carrier and class argument | Spec k̄, δ ≡ 0; strict trait, δ(s) = 0, δ(η) = 1 | **Spec k̄:** i^! = id, pin : Λ ≅ Λ(0)[0]. **Trait, K = Λ(1)[2]:** pin_η = id; `pin_s : H²_s(Λ(1)) ≅ Λ` (Kummer). The unnamed "class recording n invertible" is the hypothesis of §F.0.3's twists; no name from the revision of EtaleCohomologyFoundations remains. | Correct. |
| §6.2 relative case (`:1102`) | S = Spec k, X = 𝔸¹; S a strict trait, a = id | **𝔸¹:** a^!Λ = Λ(1)[2] (smoothPurity, d = 1), δ(η) = 1, δ(0) = 0. The pins are id at η, and at 0, `H²_0(Λ(1)) ≅ Λ`. **a = id:** a^!Λ = Λ, δ = −codim, the regular term of §6.3. Rf_! has bounded amplitude for separated finite type, so Λ_S lies in the domain of f^!. | Correct. |
| §6.2 Checks 1–2 and §6.2/§6.6 field-scheme Checks (`:1098, 1108, 1110, 1210`) | as at ffdd816; only "dualizingComplex a" became "a^!Λ" | Point class trace +1, so the pin is Λ at a rational point. A −1 normalization differs for n ≥ 3: −1 ≠ 1 in ℤ/3, but −1 = 1 in ℤ/2. | Unchanged values; correct. |
| §6.3 regular term (`:1134`) and *Needs* (`:1136`) | c = 0; strict trait (c = 1); surface (c = 2); X smooth over k at a separable closed point | **c = 0:** unit, pin id. **c = 1:** cl_s = Kummer boundary of π; the pin sends it to 1, and cl_(uπ) = cl_π. This matches LPVC §0.10's Check: degree two, twist −1. **c = 2:** target Λ(−2)[−4], concentrated in degree 4. **Smooth case:** lciCycleClass agrees with cycleClasses, whose counit is smoothBoundaryPurity's. *Needs* lists §§0.7, 0.9, 0.10 and F.0.3 and LPVC §0.10, exactly the inputs used. | Correct. |
| §6.3 Check 3 (`:1144`) | Λ = ℤ/5, strict regular surface, closed pin × 2 | C̃ is the normalization of the closure of y in X^sh: excellent of dimension 1, so finite normalization, so a DVR. Its residue field is purely inseparable over a separably closed field, and it is henselian: a strict trait. The Gysin map along the residue extension is ×p^e, a unit since p ≠ 5, so the factor 2 reaches C̃. By 2.4.2.1(b)–(c), the unique map from Λ compatible at η then fails at s by 2 ≠ 1. The sign is fixed by §6.1's Check: sp = the Kummer boundary. | Correct (previous R03 repaired). |
| Layer 6 Dependencies (`:1366`) | *Needs* lines of §§6.2–6.3 | It adds §0.10 (smooth-boundary purity) and lciCycleClass, which §6.3's *Needs* cites; §0.7 is already on the first line. | Correct. |
| §7.3 local Lefschetz | DVR, f = π; R = k⟦x,y⟧, f = x; f = 0; d = 0 | **DVR:** `0 → ℤ/ℓ` injective only. **k⟦x,y⟧:** degrees ≤ 1 are 0 on both sides; degree 2: `0 → ℤ/ℓ(−1)`, not onto. **f = 0:** identity. **d = 0:** f must be 0. PurityForFlatCohomology §1.5 (#1840 `:852`) gives the same values on every instance. | Statement correct; a second owner exists (R01). |
| §7.1 punctured-open vanishing | d = 1, f = π; d = 2, k⟦x,y⟧, f = x; f = 0 | **d = 1:** Spec R[1/π] = Spec K with cd_ℓ(K) ≤ 1, so H^i = 0 for i > 1. **d = 2:** H^i(R[1/x]) = 0 for i > 2 (affine Lefschetz §5.7). **f = 0:** empty. PurityForFlatCohomology §1.4(a) (`:822`) gives the same values. | Statement correct; duplicated (R01). |
| §§6.11–6.12 against PurityForFlatCohomology §1.4(b)–(c) | d = 0; strict trait | **d = 0:** both are linear duality of finite Λ-modules. **Trait:** `H²_x(Λ) ≅ Hom(H⁻²(Λ(1)[2])_x̄, Λ) = Λ(−1)` (§6.12 Check), with PurityForFlatCohomology's μ_ℓ[2] at d = 1. §6.12 is general (strictly local excellent X, any pinned dualizing K); PurityForFlatCohomology states the regular case. | Correct here; the regular case overlaps (R01). |
| Lean docstring (one word) | — | "cycle-class morphism", matching §6.3's heading. | Correct. |
| 0.1–0.7, 0.8 (statement and other Checks), 1.1–1.7 (statements), 2.1–2.4, 3.1–3.6, 4.1–4.2, 5.1–5.8 | as in the reviews at 047baea, f7fc49c, d6c3ae4 and ffdd816 | values recorded there | Unchanged; carried forward. |
| 6.1, 6.4, 6.5, 6.7–6.10, 7.2, 8.1–8.6 and the other four Lean declarations | as in the reviews at 047baea and ffdd816 | values recorded there; 0 dropped binders | Unchanged; carried forward. |

**Declared gaps.** The diff leaves the five gap slugs and their contracts untouched, so the previous reports' checks stand. No new gap is declared, and none is needed: main's §§0.7, 0.9, 0.10, F.0.3, F.5 and F.6 supply every name the repaired Layer 6 uses.

**Ownership against open work.** I ran `roadmaps grep` over main and the 466 open pull requests for "potential dualizing", `PotentialDualizingComplex`, `PutativeDualizingComplex` and "putative dualizing". They hit this roadmap only, so §6.2's structure has one owner. For "local Lefschetz" they hit this roadmap, PurityForFlatCohomology (R01), and LocalPurity §1.4 on main. LocalPurity's theorem is the local Lefschetz extension theorem for finite étale covers of punctured spectra: a different object, no conflict. Ownership was checked against the open pull requests through the tool's index. Only the objects of the changed passages, plus local Lefschetz, were searched.

## Not verifiable

- **Ill03** and **Epp73** remain settled as uncertified; nothing in the diff touches them.
- The WeilConjectures board package, which the history names as a consumer of §6.2, has no README in the board checkout available to this review. Its use of §6.2 was not read.
- How R01 is resolved depends on the PurityForFlatCohomology pull request, which this review does not change. The next review must re-read its head.

## Source issues

- **Gap** in ILO14 at Exposé XVII, Proposition 2.4.2.1(a), p. 265 (printed), ILO14 line 12694: the source calls the trait's pinning–transition compatibility easy but checks it only up to sign; it should fix the sign against the normalization of the transition map of §1.2; affects the proof.
