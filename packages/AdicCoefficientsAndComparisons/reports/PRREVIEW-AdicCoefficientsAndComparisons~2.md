# Review of AdicCoefficientsAndComparisons (pull request #965 at 000e3d5)

**Verdict:** accepted

Incremental re-review of the 83 lines changed since 248aad6. No finding. Every one of the six findings of the previous review is repaired, no repair introduced a new problem, the gate passes on this head, and the changed passages survive the adversarial pass with computed values below.

## Previous findings

- R01 — repaired: the AlgebraicVectorBundles row and the L2 Dependencies mention are gone; §3 now cites the pinned `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean` for `AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree` and `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` (README lines 416–422). Both exist at the Tau Ceti pin `a91d3aa` (lines 75 and 103 of that file, the second inside `namespace TauCeti.AlgebraicGeometry`, lines 61–63). `grep AlgebraicVectorBundles README.md` is empty. The dependency check on this head: `depcheck: 201 roadmaps, 1314 edges, 0 problem(s)`.
- R02 — repaired: `Suggested.lean` lines 35 and 97 read `namespace TauCetiRoadmap.AdicCoefficientsAndComparisons`; README §2.8 line 239–240 says the same. A scratch `#check` of all five declarations prints them under that namespace with types identical to those compared at 248aad6. No `Suggested.lean` on main declares this namespace.
- R03 — repaired: §2.1 lines 161–163 now say the zero ring is in no coefficient pair (Mathlib's regular sequences need a nonzero quotient) and enters only as a discrete coefficient ring through `IsPrimeToPTorsion` with annihilator 1, every category with zero coefficients being zero; §2.9 lines 263–264 say the unit ideal is rejected for the same reason. "zero-category convention" and "degenerate identification" no longer occur. Consistent with the Check at line 276.
- R04 — repaired: every citation now reads "[SW] Remark 10.1.4, p. 74" (lines 892, 923, 1996, 2089); L1 lines 892–893, the Check at line 923 and §7 item 2 cite DiamondsAndVStacks D6.1 (`spd-of-a-tate-pair`, Check `spd_zp_not_diamond`), D4.1 `total_relation` and D4.4 as the owner of the non-example, and `DiamondsAndVStacks:D6/spd-of-a-tate-pair` was added to the L1 `*Needs:*` line (line 926). Verified at the open head of DiamondsAndVStacks and at the SW text (values below).
- R05 — repaired: `## 9. Downstream consumers` (line 2071) carries the three consumer bullets; `## 10. References` follows; §1's subsection is now `### Boundaries` with a pointer to §9, and the three internal references (lines 121, 143, 491) point to §9.
- R06 — repaired: lines 1247–1249 say the prime-to-`p` torsion convention of [Abe] §1.2 is not assumed and name the two inputs the proof uses. Abe line 130–131 is §1.2 and states that convention; the lemma (line 193) adds noetherianity; its proof (lines 203–217) uses truncation, the presentation of a constructible module (SGA 4 IX 2.7, noetherian Λ), adjunction and the continuity of cohomology along the limit (SGA 4 VI 8.7.9), none of which uses torsion.

## Verified sound

**Gate.** Rerun on this head: `gate AdicCoefficientsAndComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate at this head agrees (build=0 as well). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AdicCoefficientsAndComparisons'` is empty: nothing changed outside the folder. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Dependency check.**

```text
depcheck: 201 roadmaps, 1314 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge-order positions: this roadmap 90; suppliers DiamondsAndVStacks 15, ClassicalAdicEtaleCohomology 52, DiamondEtaleCohomology 73, DiamondSixOperations 74 (the remaining suppliers are on main and not listed); consumers named in §9: EtaleDualityAndPerverseSheaves 91, FarguesFontaineDiamonds 102, VStackSheavesAndLisseCategories 112, GeometricSatakeAndFusion 115, HeckeStacksAndLocalShtukas 171, all after this roadmap.

**Lean.** `lake env lean TauCetiRoadmap/AdicCoefficientsAndComparisons/Suggested.lean` exits 0 with three `declaration uses 'sorry'` warnings (lines 50, 75, 86) and nothing else; the object files of both `TauCeti.*` imports are present at the pin. A scratch copy with `#check @` for `IsCompactification`, `IsStrictRefinement`, `fpStrictCofiltered`, `cartierBoundary_strictRefinement`, `vectorBundleExtension_strictRefinement` elaborated and printed every binder of the README statements (`[CompactSpace X] [QuasiSeparatedSpace X]`, `[IsSeparated f] [QuasiCompact f] [LocallyOfFinitePresentation f]` or `[LocallyOfFiniteType f]`, `[IsAffine S] [IsNoetherian S]`), unchanged from the previous review except for the namespace prefix. The diff touches no statement, so the one-tactic padding probe (`simp`, `infer_instance`, `aesop` all fail on each of the three theorems) and the headline audit (three statable L2 headlines stated; the L0, L1, L3–L6 headlines named in the module docstring with the missing carriers) carry over from the review at 248aad6. Every Lean name appears in the README (`IsCompactification` 2, `IsStrictRefinement` 2, `fpStrictCofiltered` 3, `cartierBoundary_strictRefinement` 3, `vectorBundleExtension_strictRefinement` 3 occurrences). Pins: Mathlib `6b7abb3c7`, Tau Ceti `a91d3aafa`.

**Adversarial table, rows for the changed statements (computed at this head).**

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| §2.1 zero ring (lines 161–163) | Λ = 0 with the empty sequence and with any sequence; `IsPrimeToPTorsion p 0`; D(X_v, 0) | Mathlib `IsRegular` (RegularSequence.lean line 146–147) requires `⊤ ≠ Ideal.ofList rs • ⊤`; in the zero ring ⊤ = ⊥ = I•⊤ for every I, so no sequence is regular and no coefficient pair exists. n = 1 is coprime to p and 1 = 0 in the zero ring: `IsPrimeToPTorsion` holds. Every module over the zero ring is zero, so every derived, complete or étale category with these coefficients is the zero category | correct; agrees with the Check at line 276 |
| §2.9 unit-ideal Check (lines 263–264) | Λ = ℤ, rs = [2, 3]; Λ = k a field, rs = [1] | [2, 3]: 2 is injective on ℤ and 3 acts as 1 on ℤ/2, so the sequence is weakly regular; `Ideal.ofList [2,3] = ⊤`, so ⊤ = ⊤•⊤ and `top_ne_smul` fails: rejected. [1] on k: the same. So "Λ/I ≠ 0" is exactly the clause that rejects the unit ideal | correct |
| §3 pinned predicate (lines 416–422) | F = O²; F = ⊕_ℕ O; F = O ⊕ O/(x) on 𝔸¹ | `SheafOfModules.isFiniteLocallyFree = isLocallyFree ⊓ isFinitePresentation` (Tau Ceti `TauCeti/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` lines 142–144), lifted to `Scheme.Modules` at FiniteLocallyFree.lean line 75: O² admitted; ⊕_ℕ O locally free but not of finite type: rejected; O ⊕ O/(x) finitely presented with fibre rank 2 at the origin and 1 elsewhere, not locally free: rejected. Locally free of finite type ⇒ locally ⊕_I O with I finite ⇒ finitely presented, so "finite type and finite presentation agree" holds for locally free modules | correct; the full subcategory is `FiniteLocallyFreeSheaf` at line 103 |
| L1 Spd ℤ_p non-example (lines 889–893, 923) | S = Spa(C♭, O_{C♭}); its untilts | Spd(𝔽_p, 𝔽_p)(S) is the set of untilts S♯ with p = 0 in O(S♯), i.e. the trivial untilt S alone: one element for every S, so Spd 𝔽_p = *. DiamondsAndVStacks D6.1 (open head, lines 8690–8692) states exactly this with `total_relation` (D4.1 line 5837: * is not a diamond) and D4.4 (line 5997: an injection of v-sheaves into a diamond is a diamond); its Check `spd_zp_not_diamond` is at line 8731. SW lines 3008–3015 are Remark 10.1.4 and line 3013 is the warning that Spd ℤ_p is not a diamond; printed page 75 begins at SW line 3019, so the remark is on printed p. 74 | supplier and locator correct |
| L2 Hom continuity, dropped torsion (lines 1247–1249) | Λ = ℤ (noetherian, torsion-free); Λ = ℤ/ℓ | Abe line 131 (inside §1.2, which starts at line 130): Λ torsion with mΛ = 0, (m, p) = 1; lemma line 193: Λ noetherian; proof lines 207–217: for F ∈ D⁻_c, G ∈ D⁺, truncate, reduce to a constructible module and a shifted module, present F by `0 → K → j_!Λ_U → F → 0` (needs noetherian Λ), adjunction, then continuity of cohomology (SGA 4 VI 8.7.9, any abelian sheaf). For Λ = ℤ every step applies; for Λ = ℤ/ℓ the source's own hypothesis holds | sentence correct: the two named inputs are the only ones |
| §9 consumers (lines 2071–2082) | merge-order positions | 90 (this) < 91, 102, 112, 115, 171 (the five consumers) | no upward edge |
| §2.8 namespace (lines 239–240) | `#check` of the five declarations | each prints under `TauCetiRoadmap.AdicCoefficientsAndComparisons`; types equal to those of 248aad6 | README and Lean agree |

**Adversarial table, rows carried from the review at 248aad6 (statements the diff leaves untouched; values as computed there).**

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| §2.1 coefficient pair | (ℤ_ℓ,(ℓ)); (ℤ/ℓ,0); (ℤ_p,(p)); (ℤ,(ℓ)); unit ideal; zero ring | ℓ regular, ℤ_ℓ/ℓ ≠ 0, complete, ℓ ∈ I coprime to p: admitted. Empty sequence regular iff ℤ/ℓ ≠ 0; 0-adically complete; ℓ = 0 ∈ I: admitted. (p): every n ∈ (p) divisible by p: rejected. (ℤ,(ℓ)): not complete: rejected. Unit ideal: `top_ne_smul` fails: rejected. Zero ring: ⊤ = ⊥ = I•⊤: rejected | consistent with ECD p. 161 and Mathlib `IsRegular` |
| §2.2 completeness and telescope | Λ = ℤ_ℓ, I = (ℓ) | colim(Λ̂ →ℓ Λ̂ → ⋯) = Λ̂[1/ℓ]; T(K,ℓ) = K for an ℓ-local K, so L_I K = cofib(K → K) = 0 | agrees with EDS E4.1 Check |
| §2.3 reconstruction is a limit of enhancements | tower N = ⊕_{k≥1} ℤ/ℓ^k, A_n = N ⊗ᴸ ℤ/ℓⁿ | H⁻¹(A_n) = ⊕_k ℤ/ℓ^{min(k,n)}, transition = ℓ; image of the m-step map in component k is ℓ^{max(m,k−n)}ℤ/ℓ^k, nonzero for all k > m: not Mittag-Leffler, lim¹ ≠ 0 | example correct; ECD 26.2 is an ∞-categorical limit |
| §2.4 residue avatars | k = 𝔽_p; 𝔽̄_p; perfection of 𝔽_p(s) | k⁺ = 𝔽_p, 𝔽̄_p, 𝔽_p respectively, so Spd(k,k) ≠ Spd(k,k⁺) in the third case | ECD p. 166 states this non-compatibility |
| §2.4/§2.5 direction of the plus-convention map | k⁺ ⊂ k | `spa_antitone`: Spa(k,k) ⊂ Spa(k,k⁺); map Spd(k,k) → Spd(k,k⁺) | direction correct |
| §2.5 c_X direction | — | morphism of sites X◇_v → X_ét; pullback c_X*: schemes → v-sheaves; ECD p. 163 | correct |
| §2.6 strictness | fold Y ⊔ Y → Y, Y a point; identity; empty Y | g⁻¹(j(Y)) = Y ⊔ Y ≠ Y = j'(Y): not strict. Identity: equal. Empty: both ∅: strict | Checks correct |
| §2.7 constructible | Λ = ℤ (L2) vs finite (L5–L6) | L2 needs only noetherian Λ; L5–L6 finite prime to p as ECD 27.6 | consistent |
| §2.8 names | — | all nine Mathlib names and `TauCeti.ValuationSpectrum.spa` exist at the pins | correct |
| §2.9 `IsPrimeToPTorsion` | ZMod ℓ; ZMod p; ℤ_ℓ; zero ring | ℓ·1 = 0 with ℓ coprime to p: yes. ZMod p: annihilators multiples of p: no. ℤ_ℓ: no positive annihilator: no. Zero ring: 1 = 0: yes | four Checks correct |
| §2.9 `IsCompleteDVRBase` | ℤ_p; k[[t]] perfect k; ℤ_ℓ; imperfect k; discrete topology; identity ℤ_p(adic) → ℤ_p(indiscrete) | residue char p and perfect: yes/yes; ℤ_ℓ: no; imperfect: no; discrete topology: mⁿ ⊄ {0}: no; continuous iso onto a non-adic target does not transport | six Checks correct |
| §2.9 `charPPlus` | 𝔽_p; 𝔽̄_p; 𝔽_p(s) | integral closure of ZMod p: all; all; 𝔽_p only | three Checks correct; `spa_integralClosure` |
| §2.9 `IsCharPScheme`, `LFTScheme` | Spec 𝔽_p; Spec ℤ; ∅; Spec O; Spec O[T]; Spec k[T₁,T₂,…] | p = 0; p ≠ 0; zero ring; identity lft; O[T] lft; infinitely many variables not lft | Checks correct |
| §2.9 `IsInvertibleTorsionOn` | ZMod ℓ on Spec k; ZMod p on Spec k; ℤ_ℓ; ∅ | ℓ unit: yes; p·m zero in k: no; no annihilator: no; empty scheme, Γ = 0: yes | Checks correct; positivity needed |
| `fpStrictCofiltered` clause 3 | Y = ∅, C₁ = C₂ = X ⊔ X over X = Spec k, a = id, b = swap; u = v | C₃ = ∅, g: ∅ → X ⊔ X, g⁻¹(∅) = ∅ = range j₃, g ≫ a = g ≫ b; u = v: E = B | holds; Zavyalov 2.1.5(3) |
| `fpStrictCofiltered` proof route | diagonal argument | Δ closed immersion of finite presentation (Stacks 0818); E = B ×_{C×_X C} C; E ×_B Y = Y | route correct |
| `cartierBoundary_strictRefinement` | f proper, C = Y; Y = ∅, C = S; 𝔸¹ ⊂ ℙ¹ | C' = C, I = ⊤, support ∅ = (range id)ᶜ. Y = ∅: C' = ∅ forced. ℙ¹: I = ideal of ∞, support {∞} = (𝔸¹)ᶜ | holds; BP 2.1.5 with the blow-up of the compactification |
| `vectorBundleExtension_strictRefinement` | F = 0; ranks 1 and 2 on two components; Y = ∅ | F' = 0 on C' = C; separate closures, Fitting-ideal blow-up (Stacks 0ESN: fp, schematically dense, constant rank, all arranged); Y = ∅: C' = ∅, F' = 0 | holds; §7 item 9 is the hypothesis gap of BP 2.1.6 |
| L0 adic forms, 1.8(iii) | f: Y → X | ECD p. 5 prints A on the target and B on the source; Prop 22.23 the reverse | §7 item 1 correct |
| L0 adic forms, 1.9(i) | A complete with A ⊗ Λ/I ∈ D⁺ | both sides complete, Λ/I perfect, ECD 17.6 at level Λ/I | hypothesis right |
| L0 adic forms, 1.10 | (ℤ_ℓ,(ℓ)) | Λ/Iⁿ killed by ℓⁿ, ECD 1.10 at every level | suffices |
| L0 1.13 domains | three cases | match ECD Theorem 1.13 (i)–(iii) | correct |
| L0 `AdicEtale.tensor_point` | ℤ/ℓ ⊗ᴸ_{ℤ_ℓ} ℤ/ℓ | Tor₁ = ℤ/ℓ in degree −1 | correct |
| L0 rational lattices | rank-one lattice; ℓ-power torsion | End = ℚ_ℓ; Hom ⊗ ℚ_ℓ = 0 for torsion | BS 6.8.14(2) |
| L1 `SchemeDiamond.Fp` | Spec 𝔽_p | plus ring 𝔽_p; Spd(𝔽_p,𝔽_p) | correct |
| L2 Comp_fp empty example | A = 𝔽_p[x₁,x₂,…], J = (x₁,…) | an fp compactification would make Spec(A/J) → Spec A fp; J not finitely generated | Check correct |
| L2 strict refinement comparison | boundary stalk | (Rg_* j'_! A)_c = RΓ(g⁻¹(c), j'_!A) by proper base change; strict ⇒ 0 | route correct |
| L2 limit Check (§6) | X_n = ⊔_{m≥n} Spec k | limit ∅, maps 0 and 1 to 𝔸¹ agree on ∅, differ at every stage | correct non-example |
| L4 test space | special fibre; generic fibre; x = 0; k[[t]] with transcendental s; ℤ_q discrete; indiscrete | π = 0 or topologically nilpotent with x ≠ 0 nilpotent: in T; x = 0: not; rank-two valuation with |s| > 1: in Cont, not Spa; ℤ_q discrete: |qⁿ| = 1 > |x|; indiscrete: Cont empty | Checks correct |
| L5 Checks | 𝔽₂(s,t) conic; 𝔸¹ with Z = V(T^p − a) | conic regular, double line after F(√s,√t); Z regular not smooth | correct |
| L5 normal-crossing stalks | r branches | (R^q j_*Λ)_x̄ = ⋀^q(Λ(−1)^r) | standard, Checks correct |
| L6 trait | closed point | (Rj_*M)_{s̄} = RΓ(Gal(K^sep/K^sh), M) | correct |
| L6 27.7 hypothesis | Λ = 𝔽_p | D_ét(X◇, 𝔽_p) undefined in ECD's conventions; proof via 27.6 | §7 item 6 correct |
| §7 item 5 case split | O = k[[t]] | locus p ≠ 0 empty; generic fibre not of finite type over k | gap confirmed |

**Sources opened for the changed passages.** SW (author version, fetched from the author's page): Definition 10.1.3 line 3006, Remark 10.1.4 lines 3008–3015, printed page 75 beginning at line 3019 (so the remark is on p. 74). Abe arXiv:2405.19601v2: Conventions line 96, §1.2 lines 130–131 (the torsion convention), Theorem line 185, §1.4 lemma line 193, proof lines 203–217. Stacks 0818, SGA 4 IX 2.7 and VI 8.7.9 were not reopened: they enter only through Abe's proof as read. The remaining 47 locators of the previous review are untouched by the diff and were not reopened.

**Library declarations opened at the pins (4).** Mathlib `RingTheory.Sequence.IsRegular` with its field `top_ne_smul` (`Mathlib/RingTheory/Regular/RegularSequence.lean` lines 146–147). Tau Ceti `SheafOfModules.isFiniteLocallyFree` (`TauCeti/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean` lines 142–144: locally free ⊓ finitely presented), `AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree` (`TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean` line 75) and `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` (line 103, inside `namespace TauCeti.AlgebraicGeometry`). The 49 declarations of the previous review are untouched by the diff.

**Cross-roadmap citations resolved for the changed passages (4).** DiamondsAndVStacks at its open head via `roadmaps show`: D6.1 `spd-of-a-tate-pair` (line 8667) with the Spd ℤ_p non-example in its prose (lines 8690–8692) and its Check `spd_zp_not_diamond` (line 8731); D4.1 `total_relation` (line 5837); D4.4 `diamonds-are-v-sheaves` with the injection statement (line 5997). The worker's `resolve` list (91 names) is unchanged in kind: every entry is one of this roadmap's own planned target names or Check labels, and the gate's `readme-ids-missing` is 0.

**Ownership.** The diff adds no construction; it hands the Spd ℤ_p non-example to its existing owner (DiamondsAndVStacks D6.1) and the finite-locally-free predicate to the pinned Tau Ceti. The ownership search of the previous review (scheme avatars, comparison functor, finitely presented and strict compactifications, ECD 27.1–27.7, the five Lean names) stands. Ownership against open pull requests whose files this brief does not give was not checked beyond the `roadmaps show` of DiamondsAndVStacks.

**Principles.** The diff introduces no route-specific shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage (the two sentences on Spd ℤ_p and on Abe's convention are the author's own words), no algorithm, no sorry'd data, no `set_option`, no pull-request number, no process word.

## Not verifiable

- The printed Annals of Mathematics Studies pagination of [SW]: the author version read carries the typeset running head and shows printed page 75 beginning immediately after Remark 10.1.4, so "p. 74" is consistent, but the printed book was not opened.

## Source issues

The nine entries of the previous review (ECD Theorem 1.8(iii), ECD §27 p. 165, ECD proofs of 27.5–27.7, BP Definition 2.1.2, BP Lemmas 2.1.5–2.1.6) concern passages the diff does not touch and are not repeated here. Checking the two changed locators found nothing new.

- none
