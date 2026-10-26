# FIX-RT-SchemeKTheoryOperationsPartII~1

Two red-team passes were merged: pass a (findings F01, F02, written a-F01, a-F02 below) and pass b (findings F01 to F07, written b-F01 to b-F07). Each section is headed by the review's own finding id and opens with its pass. Where they overlap, the finding is settled once and the overlap is named: a-F01 with b-F02 on the §1.8 scheme Check, and a-F01 with b-F06 on the Check blocks of §§1.4, 1.7, 1.8 and 2.2. Only `packages/SchemeKTheoryOperationsPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no Lean declaration exists or was added, no new source was cited beyond the cached EGA-I passage that the manifest already covers (Ch. I §10.10, pp. 201–203), and no new supplier gap is needed.

## F01 (P3) — applied

Pass a, finding F01 (written a-F01 below).

Old: five Checks restated compatibility laws with no computed instance: §1.4 strict group vs parent, §1.6 Cartan map, §1.7 product vs parent, §1.8 Tor pairing vs parent, §2.2 filtration vs parent. New: §1.4 has P¹_k with [O(1)] = 2[O] − [O(−1)]. §1.6 has the dual numbers with h(1) = 2. §1.7 has P¹ with h ≠ 0, h² = 0 and [O(1)]·[O(−1)] = [O]. §1.8 has two lines in P² with pairing 1. §2.2 has P² with F¹ = ℤh + ℤh², F² = ℤh², F³ = 0. All values were recomputed (table below).

## F02 (P3) — applied

Pass a, finding F02 (written a-F02 below).

Old (§0.2 Check): "would give every closed formal subscheme codimension 0". New: "every nonempty closed formal subscheme codimension 0 (V(t) and V(p, t) instead of 1 and 2); the empty V(1) has no points, so its infimum stays ⊤." Pattern repair: the §2.2 Check had the same overreach ("both a point for every Z"). It now says "for every nonempty Z".

## F01 (P2) — applied differently

Pass b, finding F01 (written b-F01 below).

The finding is right. AdicSpacesPartIII F0.6 (*associated-formal-module*, *affine-coherent-equivalence*, *coherent-as-inverse-system*) states no locally-free/projective comparison. The only Fitting/locally-free material in that README is in R2, for admissible formal schemes. The reviewer put the new target in §1.5. It goes in §1.3 instead, because §1.3 already consumes it ("Γ identifies C^b with bounded complexes of finite projective modules"), and placing it in §1.5 would make an internal dependency point upward. New §1.3 target: for adic noetherian A and finite M, M^Δ is locally free of finite rank iff M is projective. It comes with a proof route (faithful flatness of `A_𝔪 → 𝒪_{X,x}` from §0.1 and `Module.free_of_flat_of_isLocalRing`; conversely M_f free gives M^Δ free on D(f)), an API bullet and two new Checks: ℤ_p versus 𝔽_p, and the projective non-free ℤ_p × 0 over ℤ_p × ℤ_p. The §1.5 proof route now cites §1.3. In the AdicSpacesPartIII contract, "tensor and finite-projective comparisons" became "tensor and Hom comparisons; the comparison … is §1.3 here". The Mathlib contract gained `Module.FaithfullyFlat`, `Module.Free` and `Module.free_of_flat_of_isLocalRing`, all present at the pin: `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63`, `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43`, `Mathlib/RingTheory/LocalRing/Module.lean:299`.

## F02 (P3) — applied

Pass b, finding F02 (written b-F02 below).

Verified at the SchemeKTheoryOperations head: §6.1 exposes `gSupportPairing : K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z)`, a K × G pairing, and §3.5 gives the regular supported Cartan equivalence and coherent dévissage. The §1.8 sentence now reads: on a regular noetherian finite-dimensional scheme the pairing corresponds, under §3.5's K₀(X on Y) ≅ G₀(Y) and G₀(X on Z) ≅ G₀(Z), to the degree-zero part of the parent's K × G support pairing (§6.1). SchemeKTheoryOperations §3.5 was added to §1.8 *Needs*. The old Check 4 was replaced by the P² two-line instance of a-F01, which also states the Cartan-side value.

## F03 (P3) — applied

Pass b, finding F03 (written b-F03 below).

Verified: AdicSpacesPartIII F0.4 has *adic-morphism-of-formal-schemes*, *proper-formal-morphism* and *closed-formal-subscheme*, and no inverse image of a closed formal subscheme. No section of F0.1–F0.9 defines flat morphisms of locally noetherian formal schemes; the flatness notions in its R2 sections concern admissible formal schemes. §0.6 (retitled "…; inverse images and flat morphisms") now owns two definitions. The first is `g⁻¹Y := V(g^*𝒥·𝒪_{X′})`, the ideal being the image of g^*𝒥. It comes with the affine formula Spf(A′/JA′) (EGA-I (10.10.9), lines 8193–8199), identity and composition laws, and pullback of Coh_Y into Coh_{g⁻¹Y}. The second is flatness by stalks, with exactness of pullback. Also added: two API bullets, a proof route and two Checks. One is V(p²) along Spf ℤ_p⟦t⟧ → Spf ℤ_p; the other is i : Spec 𝔽_p → Spf ℤ_p, where i^*𝒥 ≠ 0 but its image is 0. The phrase "inverse images and" was deleted from the F0.4 contract. §0.6 was added to *Needs* of §1.1 (flat pullback), §3.4 and §4.7 (inverse images). Ownership: `roadmaps grep` by object found no other owner on main or in open pull requests.

## F04 (P3) — applied

Pass b, finding F04 (written b-F04 below).

§4.5 now defines its own `χ(X, F ⊗^L G) := Σ_j (−1)^j deg_{W_F}[Torⱼ(F, G)]`. It is computed on a noetherian neighbourhood of W_F through dévissage, and is finite because Torⱼ vanishes for j greater than the maximum of `dim 𝒪_{X,x}` over the finitely many support points. When §4.3's hypotheses hold, it is §4.3's pairing. §1.2 was added to *Needs*. New Check on the infinite-dimensional ⊔ₙ Spf ℤ_p⟦t₁,…,tₙ⟧: χ = 1 for G = 𝒪 and 0 for G = 𝒪/(t₁). The reviewer's instance gave the vanishing bound as j = 2; the stalk has dimension 3, and the recomputed value is used. The same pattern was checked in §4.6, which already defines its own two-term Euler characteristic, and in §4.7, which assumes finite dimension. Neither needed a change.

## F05 (P3) — applied

Pass b, finding F05 (written b-F05 below).

Verified: SchemeAndStackFoundations §2.6 (main, README line 3452) says finiteness of Hᵠ(X, F) over a noetherian base is "supplied by JacobianChallenge `Cohomology/Proper.lean`". JacobianChallenge Layer C (main) states and owns it. Changes:

- The SchemeAndStackFoundations contract now lists only Leray, affine acyclicity and the affine-base bound.
- A new contract "From TauCetiRoadmap.JacobianChallenge" (Layer C) was added.
- §4.1 *Needs* now reads "SchemeAndStackFoundations §2.6 (bound over an affine base); JacobianChallenge Layer C (finite A-modules …)".
- JacobianChallenge Layer C was added to the Layer 4 Dependencies and to Scope and ownership.

JacobianChallenge is on main, so it is a permitted supplier; depcheck is clean.

## F06 (P3) — applied

Pass b, finding F06 (written b-F06 below).

The duplicated later copies were deleted, and every distinct clause was merged into the first occurrence:

- §0.2: duplicates of V(t − p) and of ⊥.
- §0.3: two duplicates.
- §0.5: three duplicates; the empty-immersion clause was merged.
- §0.6: two duplicates (n = 0 merged); the J⁰ remark was merged into the full/empty-support Check.
- §0.7: three duplicates.
- §1.1: four duplicates ([k²] = 2 merged).
- §1.4: three duplicates.
- §1.7: two duplicates; the interchange sign was merged into the unit Check.
- §1.8: two duplicates.
- §2.2: two duplicates.
- §2.5: two duplicates.
- §4.2: three duplicates.
- §4.3: five duplicates.

The same pattern was repaired outside the listed blocks:

- §1.3: the Koszul duplicate was deleted and the [O →₁ O] clause merged.
- §1.6: the node duplicate was merged into one Check.
- §4.6: the a = −1, 0, 1 Check was merged into the zero-section Check.

Every definition keeps at least three Checks. The counts are 3 to 7 per subsection; §§0.1, 0.4, 1.2, 1.5 and 2.1 have 3.

## F07 (P3) — applied

Pass b, finding F07 (written b-F07 below).

Verified: EGA-I Proposition (10.10.8) runs from line 8186 to line 8192, and lines 8193 onward are (10.10.9) and (10.11.1). ZHANG21 footnote 11 is at lines 4643–4644. Changes: §0.7 "EGA-I lines 8098–8114 and 8190–8207" → "… and 8186–8192"; §3.1 "ZHANG21 lines 4607–4626" → "ZHANG21 lines 4607–4626 and 4643–4644". The EGA-I reference bullet cites only line 8098 and needed no change. The new §0.6 citation uses (10.10.9) at lines 8193–8199, which is the correct window for that corollary.

## Adversarial pass on new or changed statements

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| §0.6 inverse image `V(im g^*𝒥)` | Spf ℤ_p⟦t⟧ → Spf ℤ_p, 𝒥 = (p²); Spec 𝔽_p → Spf ℤ_p, 𝒥 = (p); identity | ideal (p²) in ℤ_p⟦t⟧, quotient (ℤ/p²)⟦t⟧ nonreduced, versus topological preimage = whole point; i^*𝒥 = 𝔽_p ≠ 0, image 0, inverse image = Spec 𝔽_p; id: image of 𝒥 = 𝒥 | holds; "image, not g^*𝒥" recorded as a Check |
| §0.6 g^* Coh_Y → Coh_{g⁻¹Y} | ℤ/p² on Spf ℤ_p pulled to Spf ℤ_p⟦t⟧ | (ℤ/p²)⟦t⟧ killed by p² = (p𝒪′)² | holds, using (𝒥𝒪′)ⁿ = 𝒥ⁿ𝒪′ |
| §0.6 flat ⇒ exact pullback | ℤ_p → ℤ_p⟦t⟧ flat; ℤ_p → 𝔽_p | 0 → ℤ_p →p ℤ_p stays injective after ⊗ℤ_p⟦t⟧; after ⊗𝔽_p it becomes 0 → 𝔽_p →0 𝔽_p, not injective | holds; non-flat Check added |
| §1.3 M^Δ locally free ⇔ M projective | ℤ_p, M = ℤ_p and 𝔽_p; ℤ_p × ℤ_p, M = ℤ_p × 0; zero ring | free rank 1 / stalk 𝔽_p not flat; ranks (1, 0), projective, not free; vacuous | holds; "free" in place of "projective" excluded by the product Check |
| §1.4 P¹ Check | L = [O(−1)] | Euler sequence: [O(1)] = 2 − L; (1 − L)² = 1 − 2L + L² = 0 ⇔ L(2 − L) = 1 | holds |
| §1.6 dual numbers | A = k[ε]/ε² | [A] has filtration εA ⊂ A with quotients k, k: h(1) = 2; rank map would give 1 | holds |
| §1.7 P¹ product | h = 1 − L | h has rank 0, first Chern class 1, so h ≠ 0; h² = (1 − L)² = 0; [O(1)][O(−1)] = (2 − L)L = 1 | holds |
| §1.7 sign | two degree-one generators; char 2 | −1; −1 = +1 in 𝔽₂ | holds |
| §1.8 scheme comparison | Spec ℤ_p, Y = Z = V(p); P², lines V(x), V(y) | Tor pairing [𝔽_p] − [𝔽_p] = 0; Cartan [𝔽_p] ↔ [K(p)], K(p) ⊗ᴸ 𝔽_p = 𝔽_p ⊕ 𝔽_p[1], class 0. x is regular on k[x, y, z]/(y): Tor₁ = 0, Tor₀ = O_P, value 1 on both sides | holds |
| §2.2 P² filtration | point, line, conic (e = 2) | F² = ℤh²; [O_C] = 1 − (1 − h)² = 2h − h² ∈ F¹; F³ = 0 since h³ = 0 | holds |
| §4.5 χ definition | infinite ⊔ₙ Spf ℤ_p⟦t₁..tₙ⟧, F = 𝔽_p on n = 2; G = 𝒪, 𝒪/(t₁); empty W_F | Tor bound j ≤ 3; χ = 1 = 1·1·1; Tor₀ = Tor₁ = 𝔽_p, χ = 0 = rank 0; empty sum 0 | holds; reviewer's bound "j = 2" corrected to stalk dimension 3 |
| §4.5 agreement with §4.3 | Spf ℤ_p⟦t⟧, F = 𝔽_p at the point, G = O/(t) | §4.3 value 1 − 1 = 0; §4.5 value 1·1·0 = 0 | holds |
| §4.6 merged Check | a = −1, 0, 1 | χ(O) − χ(O(−a)) = 1 − (1 − a) = −1, 0, 1 | holds |
| §0.2 empty codimension | V(1) in Spf ℤ_p⟦t⟧ | no source points: infimum ⊤; nonempty V(t): topological 0 versus ring 1 | holds |

## Checks run

- Elaboration: `lake env lean packages/SchemeKTheoryOperationsPartII/Suggested.lean` from the content checkout exited 0 with no output. The file is unchanged: one module docstring, an empty namespace, `import Mathlib` only. No `TauCeti.*` import needed building. The `#check @name` comparison has zero inputs (no declarations), so no signature changed.
- Dependency check: `tauceti-roadmap … gate --depcheck packages/SchemeKTheoryOperationsPartII/README.md --name SchemeKTheoryOperationsPartII --order merge-order/ORDER.txt --movable` printed:

  ```text
  depcheck: 56 roadmaps, 647 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- Citation resolver: `roadmaps resolve` on the edited README reports "Cross-roadmap citations found nowhere: None" and "Lean names found nowhere: None".

## Notes for the maintainer

- No gate failures were listed for this round.
- No Lean names changed. No new supplier gap: the single gap `proper-formal-coherent-direct-images` is unchanged in README and `design/plan.json`.
- New supplier: JacobianChallenge Layer C, which is on main. It replaces the indirect citation through SchemeAndStackFoundations §2.6.
- New targets owned here, each required by a finding:
  - §0.6: inverse images of closed formal subschemes and flat morphisms of locally noetherian formal schemes.
  - §1.3: the locally-free/projective criterion on Spf A.
  - §4.5: the self-contained χ definition.

  These three objects were searched for (`roadmaps grep` on main and open pull requests, the board's packages and the sibling checkouts) and no other owner was found. AdicSpacesPartIII's `flatLocus`, rig-flatness and Fitting-ideal material concern admissible formal schemes and module flatness, not these objects.
- Consumers: GrossZagierAndArithmeticHeightsPartII cites this roadmap by layer only. The changes keep every section number, so its citations are unaffected.
- Ownership against open pull requests was checked through the `roadmaps grep` index and the sibling checkouts given in the brief.
- No suspicious instructions were found in either review text.

## Worker check failures repaired

- Report headings: the finding sections were headed `a-F01`, `b-F01`, …; they now carry the reviews' own ids (`## F01 (P3) — applied`, …), and each section's first line names its pass.
- TeX-like notation (3 lines): three formulas with braced subscripts stood outside code spans in the README (§0.6 definition paragraph, §0.6 API bullet, §4.5 Check). They are now code spans: `Coh_{g⁻¹Y}(X′)` and `g^*`, `g^*𝒥` and `𝒪_{X′}`, `X = ⊔_{n≥1} Spf ℤ_p⟦t_1, …, t_n⟧`. The wording and the mathematics are unchanged.
