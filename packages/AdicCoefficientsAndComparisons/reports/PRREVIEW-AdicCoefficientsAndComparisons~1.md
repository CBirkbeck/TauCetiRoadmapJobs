# Review of AdicCoefficientsAndComparisons (pull request #965 at 248aad6)

**Verdict:** needs changes

One blocking finding, and it is the gate's own: the README cites AlgebraicVectorBundles, which the merge order lists after this roadmap, for two declarations that the pinned Tau Ceti already has and that `Suggested.lean` already imports. The repair is two lines and was tested. Everything else found is P3. The mathematics of the README and of the three Lean statements survived the adversarial pass; the sampled locators are all correct.

## R01 (P2) — Upward supplier: AlgebraicVectorBundles cited for two pinned Tau Ceti declarations

**Location.** `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md` line 438 ("| AlgebraicVectorBundles Layer L0B | `isFiniteLocallyFree`, `FiniteLocallyFreeSheaf` on Mathlib's `Scheme.Modules` …") and line 1431 (L2 Dependencies: "… AlgebraicVectorBundles L0B; StableReduction Layer 4 …").

**Claim.** The gate fails on this head. The dependency check prints

```text
not movable: AdicCoefficientsAndComparisons consumes AlgebraicVectorBundles (#242) and is consumed by ClassicalAdicEtaleCohomologyPartII (#190), which comes first: moving AdicCoefficientsAndComparisons after AlgebraicVectorBundles would put a supplier after a consumer, a cycle through AdicCoefficientsAndComparisons
UPWARD: AdicCoefficientsAndComparisons (#94) -> AlgebraicVectorBundles (#242) at README lines [438, 1431]
depcheck: 164 roadmaps, 1175 edges, 1 problem(s)
```

AlgebraicVectorBundles is on main, so a reader could take the citation as allowed; but the merge order places it at position 243 against this roadmap's 95, the check cannot move this roadmap past it, and no acceptance is possible while the gate fails. The citation is also unnecessary.

**Witness.** Both consumed names exist at the Tau Ceti pin `a91d3aa`: `AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree` is the abbrev at `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean` line 75 (locally free and finitely presented, exactly the predicate the row describes), and `FiniteLocallyFreeSheaf` is the abbrev at line 103 of the same file. `Suggested.lean` line 3 already imports that module and line 89 uses `Scheme.Modules.isFiniteLocallyFree`. AlgebraicVectorBundles L0B (main, README line 244) only says "Package `FiniteLocallyFreeSheaf X`"; it is not the owner of anything this roadmap uses.

**Repair.** Move the row of line 438 into the "Tau Ceti" paragraph of §3 as a pinned declaration, naming `AlgebraicGeometry.Scheme.Modules.isFiniteLocallyFree` and `FiniteLocallyFreeSheaf` with their file, and delete "AlgebraicVectorBundles L0B;" from line 1431. Tested on a scratch copy of the README with exactly these two edits:

```text
depcheck: 164 roadmaps, 1174 edges, 0 problem(s)
```

## R02 (P3) — Namespace is `TauCeti.…`, not `TauCetiRoadmap.…`

**Location.** `TauCetiRoadmap/AdicCoefficientsAndComparisons/Suggested.lean` lines 35 and 97: `namespace TauCeti.AdicCoefficientsAndComparisons`.

**Claim.** The required form is `namespace TauCetiRoadmap.<Name>`; every other roadmap on main uses it. This file declares five names into the Tau Ceti library's own root namespace, where a later library declaration could collide with them.

**Witness.** Elaborated `#check @IsCompactification` prints the name under `TauCeti.AdicCoefficientsAndComparisons`; on main, `grep -h -m1 '^namespace' TauCetiRoadmap/*/Suggested.lean` gives `TauCetiRoadmap.<Name>` for all but one legacy file.

**Repair.** Rename the namespace to `TauCetiRoadmap.AdicCoefficientsAndComparisons` on both lines. No other line changes; the file elaborates identically.

## R03 (P3) — An undefined "zero-category convention"

**Location.** README line 169 ("The zero coefficient ring has only zero complexes and is handled by that separate degenerate identification.") and line 270 ("the zero coefficient ring is instead covered by the separate zero-category convention").

**Claim.** No section defines this convention or identification; a reader looking for it finds nothing. The only place the zero ring is admitted is the `IsPrimeToPTorsion` Check at line 283 ("The zero ring satisfies it with annihilator 1").

**Witness.** `grep -n "zero-category\|degenerate identification"` returns only these two lines.

**Repair.** Replace both sentences by one statement in §2.1: the zero ring is excluded from coefficient pairs (Mathlib's regular sequences need `Λ/I ≠ 0`) and enters only as a discrete coefficient ring through `IsPrimeToPTorsion` with annihilator 1, for which every category in the roadmap is zero.

## R04 (P3) — Spd ℤ_p non-example: wrong locator and an existing owner

**Location.** README lines 892, 925, 1995 and 2076 ("[SW] Lecture 10, remark after Remark 10.1.4, p. 74").

**Claim.** The warning that `Spd ℤ_p` is not a diamond is the last sentence of Remark 10.1.4 itself, not a remark after it (SW line 3013). Separately, DiamondsAndVStacks D6.1 (open head, its README lines 8662–8665 and the Check `spd_zp_not_diamond`) already states and proves this non-example, with the argument that `*` is not a diamond (`total_relation`, D4.1) and that an injection of v-sheaves into a diamond is a diamond (D4.4), which is the same argument §7 item 2 and L1 re-derive from ECD 11.10.

**Witness.** SW line 3008–3013: Remark 10.1.4 ends with the sentence warning that Spd ℤ_p is not a diamond; DiamondsAndVStacks D6.1 at #820 as quoted.

**Repair.** Cite "[SW] Remark 10.1.4, p. 74", and in L1 (`SchemeDiamond.notDiamond`) and §7 item 2 cite DiamondsAndVStacks D6.1 / D4.1 / D4.4 as the supplier of the non-example instead of giving the argument again; keep ECD 11.10 as the source.

## R05 (P3) — README shape: no `## Downstream consumers` section

**Location.** README line 119 ("### Consumers and boundaries", inside §1) and line 2070 ("## 9. References").

**Claim.** The upstream shape ends with `## Downstream consumers`, optionally `## Worked examples`, then `## References`; here the consumer list lives in §1 only.

**Witness.** `grep -n "^## " README.md` shows no "Downstream consumers" heading; every roadmap on main that was read for shape (EtaleCohomologyFoundations, EnhancedDerivedSheaves, SchemeAndStackFoundations) has one.

**Repair.** Add `## Downstream consumers` before §9 carrying the four bullets now at lines 119–135 (or a pointer to them). The author may leave this.

## R06 (P3) — Hom continuity: say explicitly that the source's standing torsion hypothesis is dropped, and why

**Location.** README line 1248 ("… no integer is assumed invertible on the schemes") and line 1255 ("[Abe] §1.4, the proof of the continuity lemma, pp. 4–5").

**Claim.** Abe's standing convention is "Λ a torsion ring with mΛ = 0 for some m prime to p" (Abe lines 131 and 185), and his §1.4 lemma adds "Λ noetherian". The README restates the map statement for an arbitrary noetherian Λ, which is wider than the source states. The restatement is true: the proof (Abe lines 203–217) uses only truncation, the resolution `0 → K → j_!Λ_U → F → 0` of a constructible module, adjunction and continuity of étale cohomology along the limit, and each of these holds for any noetherian Λ (Stacks 09YQ for all abelian sheaves). But a reader opening the locator meets a hypothesis the target drops.

**Witness.** Abe line 131: standing torsion hypothesis; line 207: "In fact, we show this for any F ∈ D⁻_c(X_i) and G ∈ D⁺(X_i)".

**Repair.** Add one clause at line 1248: the source's standing prime-to-p torsion hypothesis is not used in this proof, whose inputs are the two named ones.

## Verified sound

**Gate.** All scanners pass except depcheck (R01): set_option, blob, latex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, metadata, stray-files, dirty, outside-folder, source-material, build all 0. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AdicCoefficientsAndComparisons'` is empty: no change outside the folder.

**Lean.** `lake env lean TauCetiRoadmap/AdicCoefficientsAndComparisons/Suggested.lean` exits 0 with three `declaration uses 'sorry'` warnings (lines 50, 75, 86) and nothing else. A scratch copy with `#check @IsCompactification`, `@IsStrictRefinement`, `@fpStrictCofiltered`, `@cartierBoundary_strictRefinement`, `@vectorBundleExtension_strictRefinement` elaborated; each printed type was compared with its README statement (§2.6, L2/fp-strict-cofiltered, L2/cartier-boundary-cofinal, L2/vector-bundle-extension-cofinal) and agrees: qcqs base as `[CompactSpace X] [QuasiSeparatedSpace X]`, "separated finitely presented" as `IsSeparated` (which gives quasi-separated) + `QuasiCompact` + `LocallyOfFinitePresentation`, "noetherian affine S" as `[IsAffine S] [IsNoetherian S]`, "separated finite type" as `IsSeparated` + `QuasiCompact` + `LocallyOfFiniteType`. No binder was lost: every instance appears in the elaborated type. Nothing changed. One-tactic probe on scratch copies: `simp` leaves the goals unsolved, `infer_instance` fails, `aesop` fails after exhaustive search; no declaration is padding. Imports: `import Mathlib` plus two `TauCeti.*` modules that exist at the pin and whose object files are present. No `set_option`, no `lemma`, no sorry'd data, no `example`.

**Pins.** `lake-manifest.json`: mathlib `6b7abb3c7`, TauCeti `a91d3aafa`, as §3 states.

**Adversarial table** (values computed on each side).

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| §2.1 coefficient pair | (ℤ_ℓ,(ℓ)); (ℤ/ℓ,0); (ℤ_p,(p)); (ℤ,(ℓ)); unit ideal; zero ring | ℓ regular, ℤ_ℓ/ℓ ≠ 0, complete, ℓ ∈ I coprime to p: admitted. Empty sequence regular iff ℤ/ℓ ≠ 0; 0-adically complete (Mathlib `IsHausdorff ⊥`: x ≡ 0 mod ⊥ ⇒ x = 0); ℓ = 0 ∈ I: admitted. (p): every n ∈ (p) divisible by p: rejected. (ℤ,(ℓ)): not complete: rejected. Unit ideal: `top_ne_smul` fails (⊤ = (1)•⊤): rejected. Zero ring: ⊤ = ⊥ = I•⊤: rejected (R03 asks for the wording). | consistent with ECD p. 161 and Mathlib `IsRegular` (RegularSequence.lean line 146) |
| §2.2 completeness and telescope | Λ = ℤ_ℓ, I = (ℓ) | colim(Λ̂ →ℓ Λ̂ → ⋯) = Λ̂[1/ℓ]; T(K,ℓ) = K for an ℓ-local K, so L_I K = cofib(K → K) = 0 | agrees with EDS E4.1 Check "colim(ℤ_p →p ℤ_p →p ⋯) is ℚ_p in D(ℤ_p) but 0 in Dcomp" |
| §2.3 reconstruction is a limit of enhancements | tower N = ⊕_{k≥1} ℤ/ℓ^k, A_n = N ⊗ᴸ ℤ/ℓⁿ (L0 example) | H⁻¹(A_n) = N[ℓⁿ] = ⊕_k ℤ/ℓ^{min(k,n)}, transition = multiplication by ℓ; image of the m-step map in component k is ℓ^{max(m,k−n)}ℤ/ℓ^k, nonzero for all k > m: images never stabilise, tower not Mittag-Leffler, lim¹ ≠ 0 | example correct; ECD 26.2 is an ∞-categorical limit |
| §2.4 residue avatars | k = 𝔽_p; k = 𝔽̄_p; k = perfection of 𝔽_p(s) | k⁺ = integral closure of 𝔽_p: 𝔽_p, 𝔽̄_p, and 𝔽̄_p ∩ k = 𝔽_p for the third (s transcendental), so Spd(k,k) ≠ Spd(k,k⁺) | ECD p. 166 states exactly this non-compatibility |
| §2.4/§2.5 direction of the plus-convention map | k⁺ ⊂ k | `spa_antitone`: Spa(k,k) ⊂ Spa(k,k⁺); map goes Spd(k,k) → Spd(k,k⁺) | direction correct |
| §2.5 c_X direction | — | morphism of sites X◇_v → X_ét; pullback c_X*: schemes → v-sheaves; ECD p. 163 line 6773 | correct |
| §2.6 strictness | fold Y ⊔ Y → Y, Y a point; identity; empty Y | g⁻¹(j(Y)) = Y ⊔ Y ≠ Y = j'(Y): not strict. Identity: equal. Empty: both ∅: strict | Checks at lines 1033–1036 correct |
| §2.7 constructible | Λ = ℤ (L2) vs finite (L5–L6) | L2 needs only noetherian Λ (R06); L5–L6 finite prime to p as ECD 27.6 | consistent |
| §2.8 names | — | all nine Mathlib names and `TauCeti.ValuationSpectrum.spa` exist at the pins (list below) | correct |
| §2.9 `IsPrimeToPTorsion` | ZMod ℓ; ZMod p; ℤ_ℓ; zero ring | ℓ·1 = 0 with ℓ coprime to p: yes. ZMod p: annihilators are multiples of p: no. ℤ_ℓ: char 0, no positive annihilator: no. Zero ring: 1·1 = 0: yes | four Checks correct |
| §2.9 `IsCompleteDVRBase` | ℤ_p; k[[t]] perfect k; ℤ_ℓ; imperfect k; discrete topology; identity ℤ_p(adic) → ℤ_p(indiscrete) | residue char p and perfect: yes/yes; ℤ_ℓ residue 𝔽_ℓ: no; imperfect: no; discrete topology: {0} open but mⁿ ⊄ {0} since m ≠ 0: no; continuous iso onto non-adic target: forward continuity does not transport | six Checks correct |
| §2.9 `charPPlus` | 𝔽_p; 𝔽̄_p; 𝔽_p(s) | integral closure of ZMod p: all; all; 𝔽_p only (s transcendental) | three Checks correct; `spa_integralClosure` gives Spa(R,𝔽_p) = Spa(R,R⁺) |
| §2.9 `IsCharPScheme`, `LFTScheme` | Spec 𝔽_p; Spec ℤ; ∅; Spec O; Spec O[T]; Spec k[T₁,T₂,…] | p = 0 in 𝔽_p; p ≠ 0 in ℤ; p = 0 in the zero ring; identity lft; O[T] lft; infinitely many variables: cotangent space at the origin infinite-dimensional | Checks correct |
| §2.9 `IsInvertibleTorsionOn` | ZMod ℓ on Spec k; ZMod p on Spec k; ℤ_ℓ; ∅ | ℓ unit in k: yes; every annihilator of ZMod p is p·m, zero in k: no; no annihilator: no; empty scheme: Γ = 0 so every n is a unit: yes | Checks correct; positivity needed, else n = 0 |
| `fpStrictCofiltered` clause 3 | Y = ∅, C₁ = C₂ = X ⊔ X over X = Spec k, a = id, b = swap | C₃ = ∅ (proper, fp over X), g: ∅ → X ⊔ X, g⁻¹(∅) = ∅ = range j₃, g ≫ a = g ≫ b | holds; Zavyalov 2.1.5(3) |
| `fpStrictCofiltered` clause 3 | u = v | E = B, equaliser the identity (Check line 1136) | holds |
| `fpStrictCofiltered` proof route | diagonal argument | C → X proper fp ⇒ Δ a closed immersion (separated) of finite presentation (Stacks 0818: qs + lft ⇒ Δ fp); E = B ×_{C×_X C} C; E ×_B Y = Y since u∘j = v∘j | route correct |
| `cartierBoundary_strictRefinement` | f proper, C = Y; Y = ∅, C = S; 𝔸¹ ⊂ ℙ¹ | C' = C, g = id, I = ⊤: support ∅ = (range id)ᶜ (`isEffectiveCartier_top`). Y = ∅: C' = ∅, I = ⊤ on ∅, support ∅ = ∅ᶜ in ∅; zero ideal on a nonempty C would fail (Check line 1176) so C' = ∅ is forced. ℙ¹: I = ideal of ∞, support {∞} = (𝔸¹)ᶜ | holds; BP 2.1.5 with the blow-up of X̄ (strict since the blow-up is an isomorphism off the centre) |
| `vectorBundleExtension_strictRefinement` | F = 0; rank 1 on one component and 2 on another; Y = ∅ | F = 0: F' = 0 on C' = C. Split Y = Y₁ ⊔ Y₂, closures in C are disjoint-union ambient, Y_r = \bar{Y_r} ∩ Y (Y_r clopen in Y), each Y_r schematically dense in its closure, Fitting-ideal blow-up (Stacks 0ESN: needs fp F̄, schematic density, constant rank; all arranged) gives rank-r strict transforms. Y = ∅: C' = ∅, F' = 0 | holds; §7 item 9 is exactly the hypothesis gap of BP 2.1.6 |
| L0 adic forms, 1.8(iii) | f: Y → X | ECD p. 5 prints A ∈ D_ét(X), B ∈ D_ét(Y) in Rf_!(A ⊗ f*B); Prop 22.23 line 5765: B on Y', A on Y | README §7 item 1 correct |
| L0 adic forms, 1.9(i) | A complete with A ⊗ Λ/I ∈ D⁺ | both sides complete (f*, Rf_* commute with limits), Λ/I perfect so reduction commutes, ECD 17.6 applies at level Λ/I | hypothesis "reduction bounded below" is the right one |
| L0 adic forms, 1.10 | (Λ,I) = (ℤ_ℓ,(ℓ)) | Λ/Iⁿ killed by ℓⁿ, so ECD 1.10 (Λ ℓ-power torsion) applies at every level | hypothesis "Λ/I killed by a power of ℓ" suffices |
| L0 1.13 domains | three cases | match ECD Theorem 1.13 (i)–(iii) lines 277–296 including C⁺ ⊂ C'⁺ and surjectivity | correct |
| L0 `AdicEtale.tensor_point` | ℤ/ℓ ⊗ᴸ_{ℤ_ℓ} ℤ/ℓ | Tor₁ = ℤ/ℓ in degree −1 | correct |
| L0 rational lattices | rank-one lattice; ℓ-power torsion | End = ℤ_ℓ ⊗ ℚ_ℓ = ℚ_ℓ; Hom ⊗ ℚ_ℓ = 0 for torsion | BS 6.8.14(2), topologically noetherian X (BS line 2840) |
| L1 Spd ℤ_p | O = ℤ_p | Spd ℤ_p ⊃ Spd 𝔽_p = * (locus p = 0); SW Remark 10.1.4 warns it is not a diamond; ECD 11.10: injection into a diamond is a diamond | correct; R04 on locator and owner |
| L1 `SchemeDiamond.Fp` | Spec 𝔽_p | plus ring = 𝔽_p; Spd(𝔽_p,𝔽_p) | correct |
| L2 Comp_fp empty example | A = 𝔽_p[x₁,x₂,…], J = (x₁,…) | open immersion fp, fp ∘ fp = fp, so an fp compactification would make Spec(A/J) → Spec A fp; J not finitely generated: contradiction; identity compactification still exists in Comp(f) | Check at line 1316 correct |
| L2 strict refinement comparison | boundary stalk | (Rg_* j'_! A)_c = RΓ(g⁻¹(c), j'_!A) by proper base change (ECF F.2.1, arbitrary torsion); strict ⇒ g⁻¹(c) ∩ j'(Y) = ∅ ⇒ 0 | route correct |
| L2 limit Check (§6) | X_n = ⊔_{m≥n} Spec k | tail inclusions affine open immersions, limit ∅, maps 0 and 1 to 𝔸¹ agree on ∅, differ at every stage | correct non-example for the qc hypothesis |
| L4 test space | special fibre; generic fibre; x = 0; O = k[[t]] with transcendental s; ℤ_q discrete; indiscrete | points with π = 0 or π topologically nilpotent and x ≠ 0 nilpotent: in T. x = 0: not in T. Rank-two valuation with |t| = 0, x-adic first, |s| > 1 second: continuous (x-power dominates lexicographically) but |s| > 1 on the plus ring: in Cont, not in Spa. ℤ_q discrete: |qⁿ| = 1 > |x| in every chart. Indiscrete: Cont empty | Checks correct; ECD 24.4 (line 6502) needs analytic target, so §7 item 3 is right |
| L5 Checks | 𝔽₂(s,t) conic; 𝔸¹ with Z = V(T^p − a) | conic regular, over F(√s,√t) a double line with reduced base change ℙ¹; Z regular not smooth, splits after F(a^{1/p}) | correct; SSF 4.19 has the same conic Check |
| L5 normal-crossing stalks | r branches | (R^q j_*Λ)_x̄ = ⋀^q(Λ(−1)^r); r = 0: Λ in degree 0; r = 1: Λ(−1) in degree 1 | standard, Checks correct |
| L6 trait | closed point | (Rj_*M)_{s̄} = RΓ(Gal(K^sep/K^sh), M), generic stalks M | correct |
| L6 27.7 hypothesis | Λ = 𝔽_p | D_ét(X◇, 𝔽_p) undefined in ECD's conventions; proof goes through 27.6 | §7 item 6 correct |
| §7 item 5 case split | O = k[[t]] | locus p ≠ 0 empty, every open "of characteristic p", generic fibre over k((t)) not of finite type over k | gap confirmed |

**Sources opened (locators checked at the text).** ECD arXiv 1709.07343v4 (file matches the author version cited): §26 standing hypotheses line 6717, Definition 26.1 line 6721, Proposition 26.2 line 6728, Remark 26.3 line 6753, §27 opening line 6767, Propositions 27.1–27.7 lines 6785–6946 (pp. 163–167), Theorems 1.8–1.13 lines 185–296 (pp. 5–8), Definition 14.13 line 3625, Proposition 11.10 line 2360, Definition 23.8 line 6043, Proposition 22.3(iii) line 5263, Proposition 24.4 line 6502, Proposition 22.23 line 5762, Proposition 17.6 line 4029, Lemma 15.6 line 3741: every page and theorem number in §§2, 5, 7 and 9 agrees. BS arXiv 1309.1198v2: Proposition 5.2.6 line 1734 (p. 37), 5.3.2 line 1806 (p. 38), 6.8.14 line 2908 (pp. 61–62), Definition 5.3.1 line 1802, Lemma 3.4.12 line 1065. Zavyalov arXiv 2111.01830v3: Definition 2.1.1, Remarks 2.1.2–2.1.3, Lemma 2.1.4, Corollary 2.1.5 lines 440–488 (pp. 10–11). Boxer–Pilloni author version: Definition 2.1.2, Remark 2.1.3, Lemmas 2.1.4–2.1.6 lines 302–329 (p. 7). de Jong (Numdam): 2.20 line 407 (p. 61), Theorem 4.1, Remark 4.2, 4.5 lines 597–626 (p. 66), Theorem 5.8 line 1105 (p. 79), Theorem 6.5 line 1253 (p. 83). Scholze–Weinstein author version: Remark 10.1.4 lines 3008–3015 (p. 74). Abe arXiv 2405.19601v2: §1.4 lines 190–230 (pp. 4–5). Česnavičius arXiv 1711.06456v4: Theorem 4.10 line 351 (pp. 9–10), Theorem 5.3 line 464, §5.4 line 484. Stacks: 0ESN (31.36.3, hypotheses finitely presented, schematically dense, constant rank), 0G41 (28.23.5), 0818 (29.22.12), 0ATU (38.32.1), 0F7G (63.8.6), 0DDE (59.91.12), 0DHM (85.36.4), 01WQ (§31.14, Definition 31.14.1 is tag 01WR), 01T0 (§29.15). Total: 49 locators opened, all correct except the SW wording of R04.

**Library declarations opened at the pins (49).** Mathlib: `isAffineHom_π_app` (AffineTransitionLimit.lean 358), `isLimitOpensCone` (230), `Scheme.compactSpace_of_isLimit` (364), `exists_map_preimage_eq_map_preimage` (290), `Scheme.exists_π_app_comp_eq_of_locallyOfFinitePresentation` (1152), `Scheme.exists_hom_hom_comp_eq_comp_of_locallyOfFiniteType` (381), `Scheme.Hom.toImage_imageι`, `Scheme.kerAdjunction` (IdealSheaf/Subscheme.lean), `IdealSheafData.support` (IdealSheaf/Basic.lean 327), `IsSchemeTheoreticallyDominant` (Morphisms/SchemeTheoreticallyDominant.lean 37), `AffineSpace` (AffineSpace.lean 43), `Proj`, `Scheme.Modules`, `Scheme.Modules.pullback` (Modules/Sheaf.lean 182), `SheafOfModules.IsLocallyFree`, `smallEtaleTopology` (Sites/Etale.lean 50), `pointSmallEtale` (Sites/EtalePoint.lean 62), `Scheme.ProEt` (Sites/Proetale.lean 97), `Sheaf.H`, `Scheme.ellAdicSheaf` and `EllAdicCohomology` (Sites/ElladicCohomology.lean), `conjugateIsoEquiv` (Adjunction/Mates.lean), `Ideal.ofList`, `RingTheory.Sequence.IsRegular` (RegularSequence.lean 146, `top_ne_smul`), `IsAdicComplete` (AdicCompletion/Basic.lean 56), `IsDiscreteValuationRing`, `PerfectField`, `MorphismProperty.Localization`, `MorphismProperty.Q_inverts` (Localization/Construction.lean 136), `Functor.Initial` (Limits/Final.lean 99), `IsCofiltered` (Filtered/Basic.lean 590: nonempty + cone objects + cone maps, the three axioms of L2), `MorphismProperty.Over`, `ObjectProperty.FullSubcategory`, `IsProper` (Morphisms/Proper.lean 41: separated, universally closed, locally finite type), `IsSeparated`, `QuasiCompact`, `LocallyOfFiniteType`, `LocallyOfFinitePresentation`, `IsNoetherian`. Tau Ceti: `ValuationSpectrum.spa` (Spa/Basic.lean 101: `cont A ∩ {v | ∀ a ∈ Aplus, v a ≤ 1}`, as §3 says, set-level), `spa_antitone`, `spa_integralClosure`, `Scheme.IdealSheafData.IsEffectiveCartier` (EffectiveCartierDivisor/Basic.lean 50), `isEffectiveCartier_top` (90), `isEffectiveCartier_ofIdealTop_span_singleton` (99), `IsEffectiveCartier.exists_eq_span_singleton_le` (61), `isEffectiveCartier_iff_exists_comap` (106), `isEffectiveCartier_iff_exists_isOpenImmersion` (137), `IsEffectiveCartier.comap` (166), `Scheme.Modules.isFiniteLocallyFree` (VectorBundle/FiniteLocallyFree.lean 75), `FiniteLocallyFreeSheaf` (103).

**Cross-roadmap citations resolved (68).** On main: EtaleCohomologyFoundations §§G.1, G.2, G.3, 0.5, 0.6, 0.7, 0.8, F.0.1, F.2.1, F.3, F.4.1–F.4.5, 0.9, 0.10, F.6 with the 22 declaration names (`Compactification`, `Compactification.Hom`, `DenseCompactification`, `Compactification.baseChange`, `denseReplacement`, `denseReplacementMap`, `nagataCompactification`, `compactificationCommonRefinement`, `denseCompactification_cofiltered`, `denseCompactification_hom_unique`, `ClassicalCoefficients.finitePresentationDescent`, `constructibleDerivedDescent`, `constructibleHomContinuity`, `ClassicalAlgebraic.supportLocalization`, `properSupports`, `cycleClasses`, `smoothBoundaryPurity`, `VanishingCycles.properBaseChange`, `smoothPairGysin`, `classicalAdicRealization`, `etaleProetaleAdicComparison`, `rationalAdicRealization`), each present and saying what the README says (§0.8: separated finitely presented maps of qcqs schemes, D⁺ torsion, any Λ, conditional unbounded extension; §F.4.2–F.4.3: locally Noetherian; §F.4.5: Noetherian; §G.3: equalisation after dense replacement; no strictness predicate and no finitely presented subcategory, so L2 owns those). EnhancedDerivedSheaves §§E1.3, E1.4, E2.3, E2.6, E3.2, E3.4, E4.1, E4.2, E4.4, E4.5 with the 13 names (`enhancedDerived`, `DerivedCompleteSheaves`, `completeSheaf`, `derivedComplete_colimit`, `regularIdeal_quotients`, `completedSheafTensor`, `derivedComplete_internalHom`, `completedTensor_hom_adjunction`, `CompatibleCoefficientSystems`, `completedCoefficientRing`, `coefficientSystemReconstruction`, `perfectCoefficientChange`, `isIso_of_isIso_mod`); E4.5 states reconstruction for finite regular sequences with I = 0 allowed and no noetherian hypothesis, as L0 uses. SchemeAndStackFoundations §§0.4, 0.9 (`affine_transition_limits`, `finite_presentation_limits`, `noetherian_approximation`), 0.23, 0.23a, 2.15 (`etale_cohomology_limits`), 2.16 (`proper_hypercover_descent`, abelian sheaves), 2.17, 4.16–4.20 (`alteration_theorem` retains the finite extension and the k'-structure but states regularity, not smoothness, so L5's `smoothAlterationPair` is new). StableReduction Layer 4 (blow-up of a finite-type quasi-coherent ideal, properness, strict transform, behaviour off the centre). PerfectoidSpaces P1 (`characteristic-p-perfectoid-iff-perfect` line 3705, `marked-untilt` line 4914), P3.17a.1–P3.17a.4 (line 9061 on). AdicSpacesPartII R1.2 `scheme-fibre-product-analytification` (line 8571), `analytification-universal-property` (line 9104). AdicSpacesPartIII R2 `noetherian-formal-scheme-as-adic-space` (line 4618), `fitting-ideal-invertible-locally-free` (line 7267). At open heads via `roadmaps show`: DiamondsAndVStacks #820 D2.7 `v-descent-of-functions`, D4.7 `small-v-sheaves-and-small-v-stacks`, D6.2 `untilt-descent-along-v-covers`, D6.4 `gluing-and-the-diamond-functor`, D6.5 `etale-site-comparison`; DiamondEtaleCohomology #922 Layers C0, C2, C3, C6; DiamondSixOperations #927 Layers S0, S2, S3, S4, S5; ClassicalAdicEtaleCohomology #875 §§1.3, 4.3, 4.4, 8.2, 10.4, 11.1, 11.2 (its §11.2 cites the proof of ECD 27.2 and supplies the radius stabilisation and affine-space exhaustion this roadmap consumes). The worker's `resolve` list of 91 "names found nowhere" consists only of this roadmap's own planned target names in `*Target names:*` lines and Check labels, which the gate accepts (readme-ids-missing = 0).

**Supplier order.** All suppliers except AlgebraicVectorBundles precede this roadmap in the merge order (positions 2, 9, 10, 13, 16, 18, 19, 56, 79, 80 against 95); consumers named in §1 (EtaleDualityAndPerverseSheaves 97, FarguesFontaineDiamonds 109, VStackSheavesAndLisseCategories 119, GeometricSatakeAndFusion 122, HeckeStacksAndLocalShtukas 173) come after. No cycle. No declared gaps (no `plan.json`), and none needed: every `*Needs:*` item resolves.

**Ownership.** `roadmaps grep` over main and the 389 open pull requests for `X◇`, `c_X*`/`Rc_X`, `Comp_fp`/finitely presented compactification, strict morphisms of compactifications, ECD Propositions 27.1–27.7, `Spd O`, `AdicEtale`/adic étale category, `SchemeDiamond`/`SchemeComparison`/`RationalLattice`, Cartier boundary and vector-bundle extension of compactifications, and the five Lean names: no other roadmap builds any of them (PerfectoidTowers uses `X^◇` of perfectoid spaces only; DiamondsAndVStacks D6.1 states the Spd ℤ_p non-example, R04). This roadmap is the owner of the scheme avatars, the comparison functor, the L2 refinements and ECD 27.1–27.7.

**Principles.** No route-specific shortcut (L2 is stated over qcqs bases, finite type kept apart from finite presentation, no "good primes"); no re-planned roadmap; no computational algorithm; no copied passage found in the sampled sections; no sorry'd data; no `set_option`; no pull-request numbers in the README.

## Not verifiable

- Stacks tags 0ATT, 0F41, 01YX, 01ZA, 07RN, 01ZM, 01ZR, 0EUU, 081F, 01ZJ, 09YQ, 0F7H, 0DHP (README §3 limit contract and L2/L5 secondary citations): not opened; they are cited through SchemeAndStackFoundations §0.9 and EtaleCohomologyFoundations §G.2, whose own locators name the same tags.
- Huber 1996 Theorems 3.7.2, 3.8.1, 3.5.10, 3.5.13 and Proposition 6.1.1: cited only through ClassicalAdicEtaleCohomology, not by this README; not opened here.
- The printed Annals of Mathematics Studies pagination of [SW]: the author version read carries the typeset running head "Berkeley Lectures March 27, 2020" and shows the page break to 75 immediately after Remark 10.1.4, so p. 74 is consistent, but the printed book was not opened.

## Source issues

- **Misprint** in ECD at Theorem 1.8(iii), printed p. 5: the projection formula places the first argument on the target stack and the second on the source; it should be the source for the first and the target for the second, as in Proposition 22.23; affects nothing.
- **Error** in ECD at §27, printed p. 165: the functor from schemes locally of finite type over O is said to take values in diamonds over Spd O; it should be small v-sheaves whose structure map is representable in locally spatial diamonds, since Spd ℤ_p is not a diamond; affects nothing.
- **Gap** in ECD at proof of Proposition 27.5, printed p. 166: ℓ-cohomological smoothness of the test space over Spd O is attributed to Proposition 24.4, whose target must be analytic; it should be checked after base change to perfectoid test objects; affects the proof.
- **Gap** in ECD at proof of Proposition 27.6, printed p. 166: the dichotomy between the locus where p is invertible and the characteristic-p locus is degenerate in equal characteristic; it should split by the uniformiser; affects the proof.
- **Gap** in ECD at proof of Proposition 27.6, printed pp. 166–167: the alteration reduction, the normal-crossing computation, the semistable induction and the punctured-trait computation are asserted without argument; they should be carried out; affects the proof.
- **Gap** in ECD at Proposition 27.7, printed p. 167: the hypothesis on Λ is finiteness only; it should include killed by an integer prime to p, which the proof uses through Proposition 27.6; affects a stated result.
- **Gap** in BP at Definition 2.1.2 and the following paragraph, printed p. 7: cofilteredness is justified by the closure of the diagonal alone; parallel maps must also be equalised, since compactifications need not be dense; affects nothing.
- **Misprint** in BP at proof of Lemma 2.1.5, printed p. 7: the blow-up is taken on the open scheme; it should be the blow-up of the compactification along the boundary ideal; affects nothing.
- **Gap** in BP at proof of Lemma 2.1.6, printed p. 7: the Fitting-ideal blow-up of Stacks 0ESN needs a schematically dense open and constant rank; neither is arranged; affects the proof.
