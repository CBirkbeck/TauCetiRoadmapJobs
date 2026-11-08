# Review of StableHomotopyKTheoryPartII (pull request #1733 at b984cf9)

**Verdict:** needs changes

This is a full review. The head is the same one the previous review read, and nothing in the folder or outside it has changed. There are two findings, both P3, and nothing blocks.

- R01 is carried from the previous review: the manifest entry is still incomplete.
- R02 is new: a missing ownership citation of an earlier roadmap.

The previous review's other finding (`Module.Finite K M`) is not re-raised. The author's dispute holds for the tree this pull request merges into; the reasons are under "Previous findings".

## R01 (P3) — The `stacks-algebra` manifest entry still has no `authors`, `title` or `year`

Carried from the previous review's R02. Neither the manifest nor the head has changed.

**Location.** `packages/StableHomotopyKTheoryPartII/sources.toml`, lines 186–197: the `[[source]]` table with `id = "stacks-algebra"`, which runs from `locator_scheme = "tag"` to `cited_for = ["4.8"]` and has no bibliographic fields.

**Claim.** The manifest schema records `authors`, `title` and `year` for every cited work. The other eleven entries have all three. This one is cited by the README at line 651 (§4.8) and line 1108 (References).

**Witness.** I ran `tauceti-roadmap sources check` on a scratch copy of the manifest. It reports exactly three problems: "source 12 (stacks-algebra): missing authors / missing title / missing year". The reply to the previous review agrees ("The claim is right").

**Exact repair.** Add three lines to that table:

- `authors = "The Stacks project authors"`
- `title = "The Stacks project, Commutative Algebra"`
- `year = 2026`, the year of access, since this is a living text.

These match the README's reference line 1108. Nothing in the roadmap folder changes.

**Tested.** With the three lines added, the same `sources check` on the scratch copy reports 0 problems.

## R02 (P3) — Scope and ownership does not cite HermitianKTheoryOfPoincareCategories §5.1a for the C₂ sphere case that §2.7 restates

**Location.** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:374` reads "In particular S→S^(tC_p) is the Segal conjecture for C_p (Lin at p=2, Gunawardena at odd p)". The sphere case is used in the Checks of §§1.2, 2.1, 2.7, 3.4 and 5.4 (lines 214, 255, 382, 478, 765) and in the Layer 7 Examples (line 1003). The Scope section (lines 5–18) names no owner of the p=2 sphere case.

**Claim.** HermitianKTheoryOfPoincareCategories is earlier in the merge order (position 62 against this roadmap's 329). Its §5.1a owns, as a target, that for the trivial action S→S^(tC₂) exhibits its target as the 2-completion. Its Scope assigns the general bounded-below and finite-type extensions to §§2.7 and 3.4 here. It also states that their p=2 sphere case agrees with §5.1a's comparison by the universal property of 2-completion.

This README states the same p=2 sphere case as its own corollary and never cites that owner. The reciprocal ownership sentence that the house style requires is missing: a kept variant must say in one clause how it differs from the owner's statement.

This is P3 rather than P2. What §2.7 owns is the general theorem, and HermitianKTheoryOfPoincareCategories itself assigns that here. Only the citation is missing.

**Witness.** At its open head febd6d9, HermitianKTheoryOfPoincareCategories README line 787 (§5.1a) says "Prove that for the trivial C₂-action the canonical map 𝕊→𝕊^{tC₂} exhibits its target as the 2-completion of the sphere". Line 19 says "Section 5.1a owns the shared C₂ sphere Tate-completion comparison … StableHomotopyKTheoryPartII §§2.7 and 3.4 own the finite-type and general bounded-below Segal extensions".

**Exact repair.** Insert this bullet in Scope and ownership, before the AInfCohomology bullet (line 14). No *Needs:* line changes, and no layer depends on §5.1a.

> HermitianKTheoryOfPoincareCategories §5.1a owns the C₂ sphere comparison: for the trivial action, S→S^(tC₂) is the 2-completion (the Segal–Lin theorem), proved there through the inverse tower of stunted real projective Thom spectra. §2.7 here proves the generalization to every prime and every bounded-below finite-type spectrum by the Singer route and does not use §5.1a; its p=2 sphere case agrees with §5.1a's comparison by the universal property of 2-completion, both being maps under S whose composite to S₂^∧ is the completion unit.

**Tested.** On a scratch copy of the README with exactly this bullet inserted, the dependency check prints `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`. That means no UPWARD or CYCLE line, even though HermitianKTheoryOfPoincareCategories names this roadmap in its own Scope.

## Previous findings

- **Previous R01 (`Module.Finite K M` in the `residueFieldHomEquiv` bullet, README line 55): not re-raised.** The author disputed it twice, and the dispute is correct for the tree the pull request merges into. The branch and main pin different Tau Ceti commits:
  - At this branch's `lake-manifest.json` pin (Tau Ceti 358314d, 7 October), the `variable` block of `TauCeti/NumberTheory/LocalField/Unramified/Rigidity.lean` (lines 67–71) contains `[Module.Finite K M]`. My `#check @TauCeti.IsUnramified.residueFieldHomEquiv` there elaborates with it.
  - At main's pin (Tau Ceti 2fd255d, 4 November), the block ends `[ValuativeExtension K M] [IsUnramified K L]`. `variable [Module.Finite K M]` appears only at line 159, after the definition at line 142.
  - The pull request does not change `lake-manifest.json`; the three-dot diff outside the folder is empty. So after the merge the README is read at 2fd255d, where line 55 states the declaration's exact hypotheses. The repair the previous review proposed would misstate it there.
  - Either way, the only use is M=L in §4.8, where `Module.Finite K L` is already assumed, so no statement depends on the difference.
  - A rebase onto main would make the branch's pin agree with main's. That is the worker's action, not a README change.
- **Previous R02 (`stacks-algebra` manifest fields): not repaired.** The manifest is unchanged. Carried as R01.

## Verified sound

**Gate, dependency direction, elaboration, run on this head.**

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

- The worker's gate record also shows `build=0`. My `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exits 0 with no output.
- The worktree is clean at b984cf9, and `git diff --stat origin/main...HEAD` outside the folder is empty.
- Every supplier is earlier than position 329 in the merge order or on main:
  - TangentialBordism 14, StableHomotopyKTheory 16, AInfCohomology 80, KTheoryFiniteLocalFields 89, PadicHodgeRegulators 323, RefinedTraceMethods 326.
  - BordismFormalGroups, GeneralizedCohomology, EnhancedDerivedSheaves, TopologicalKTheory and AlgebraicTopology are on main.

**Suggested.lean.**

- The file has `module` and a single `import Mathlib`, and no `set_option`, `lemma` or sorry'd data. The module docstring is titled "…: target signatures" and says README.md is the roadmap. The namespace is `TauCetiRoadmap.StableHomotopyKTheoryPartII` and it declares nothing.
- The docstring names fourteen headlines as not statable: README §§2.4, 2.2, 2.6, 2.7, 3.4, 4.1, 5.6, 4.8, 6.3, 7.3, 7.4 with 7.5, 8.1, 8.2 and 8.3. I searched both pins for spectrum, symmetric-spectrum, Ω-spectrum, Steenrod-algebra and E∞-ring carriers and found none, so the docstring is right that each lacks its carriers.
- The finite-set tower lemma (§3.1) and the integral Witt comparison (§4.8) are statable but are supporting results, not headlines, as the docstring says.
- The padding probe has zero entries, and there are no `#check @name` signatures to compare.

**Pinned declarations: 40 `#check`s elaborated in one scratch file at this branch's pins (Mathlib f6090c70, Tau Ceti 358314d).** All resolve. Each matches its README description, with the one exception in the last row.

| Declarations | Elaborated hypotheses checked | README | Match |
|---|---|---|---|
| `CategoryTheory.Functor.sections`, `eventualRange`, `isMittagLeffler_of_exists_finite_range`, `toEventualRangesSectionsEquiv`, `surjective_toEventualRanges`, `eval_section_surjective_of_surjective`, `eventually_injective`, `nonempty_sections_of_finite_cofiltered_system` | `IsCofilteredOrEmpty`; `eventually_injective` and `eval_section_surjective_of_surjective` need nonempty finite stages and surjective maps; `eventually_injective` also needs `Finite F.sections` | §3.1 route and line 36 keep exactly these hypotheses | yes |
| `frobenius`, `WittVector.frobenius`, `coeff_frobenius_charP` (`[CharP R p]`), `frobenius_zmodp`, `WittVector.equiv` (`𝕎(ZMod p) ≃+* ℤ_[p]`), `IsPoly.map`, `constantCoeff` | as stated | line 38 | yes; the `WittVector` structure is in `Defs.lean` and its `CommRing` instance in `Basic.lean` (line 244), as the README's "Basic.lean" reading of the ring needs |
| `FiniteField.frobeniusAlgEquivOfAlgebraic`, `orderOf_…` (`[Finite L]`), `natCard_algHom_of_finrank_dvd`, `IsGalois.of_card_aut_eq_finrank` | as stated | line 38 | yes |
| `tateCohomology` (abbrev, `TateCohomology/Basic.lean:145`), `Rep.FiniteCyclicGroup.tateCohomologyIsoEven/Odd`, `periodicIso` (`[IsCyclic G]`, `m ≡ n [ZMOD 2]`) | as in the previous review | lines 40, 48 | yes, at both pins |
| `TauCeti.TateCohomology.cup`, `cupUnit`, `cup_assoc`, `cup_gradedComm` (`(p*q).negOnePow`) | as in the previous review | line 49 | yes |
| `TauCeti.IsUnramified`, `IsUnramified.inertiaDegree_eq_finrank`, `isUnramified_iff_etale` (`Algebra.Etale` of the integer rings) | no finiteness hypothesis | line 54 | yes, at both pins |
| `residueFieldAutEquiv`, `isCyclic_algEquiv`, `frobeniusAlgEquiv`, `orderOf_frobeniusAlgEquiv`, `eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one`, `frobeniusAlgEquiv_teichmullerLift` | `[FiniteDimensional K L] [IsGalois K L] [IsUnramified K L]` | line 56 | yes |
| `Padic.integerRingEquiv` (`TauCeti/NumberTheory/LocalField/Padic.lean`, line 86 at this pin, line 151 at main's pin) | `[Fact p.Prime]` | line 57 | yes |
| `IsUnramified.residueFieldHomEquiv` | `Module.Finite K M` at 358314d, absent at 2fd255d | line 55 | matches main's pin (see Previous findings) |

The file paths named in the Mathlib contract exist at both Mathlib pins (f6090c70 and 1b1ccf4b). I checked each declaration by grep at main's pins.

**Seeded sample: all fifteen locators read against the cached texts.**

| Target | Locator read | What the source says, and the hypotheses | Result |
|---|---|---|---|
| 2.2 | lnr12 lines 265–269, Prop. 2.2, p.867 | tower {Y_n}, each stage bounded below and of finite type, no uniform bound; E₂=Ext_A(colim H*(Y_n),𝔽_p) converging strongly to π_*(Y_p^∧) | supports the statement as written |
| 2.4 | agm85 lines 68–90 (Prop. 1.2, Thm. 1.3, p.436); lines 236–306 (Lemmas 2.1–2.2, pp.439–441); lnr12 lines 717–745 (Def. 3.2, Prop. 3.3, Thm. 3.4, Cor. 3.5, pp.876–877) | ε is a Tor-equivalence for every A-module M; Ext comparison for N bounded below and finite-dimensional in each degree ("boundedness essential"); AGM's ε′ has degree +1 | supports the statement as written; the README's suspension remark matches |
| 2.5 | lnr12 lines 1148–1151 (Def. 4.3, p.885), 1181 (Lemma 4.4, p.886), 1255–1266 (Lemma 4.6, p.887), 1935–1945 (Prop. 5.7, p.902) | (B^∧p)^tC_p[1−(p−1)n]≃Σ^(1+n)D_(C_p)(Σ^(−n)B), compatible with (p−1)-fold composites; stages bounded below, finite type | supports the statement; the index matches |
| 2.7 | lnr12 lines 2109–2128, Thm. 5.13, pp.905–906 | B bounded below and of finite type: ε_B is a p-adic equivalence | supports the statement; the replacement of ε_B by Δ_p is §2.6's argument |
| 3.2 | ns18 lines 3313–3330, proof of Thm. III.1.7, p.289 | T_p^(n) defined after truncation; T_p≃lim T_p^(n) by Lemma I.2.6 with no boundedness; T_p^(n) commutes with infinite direct sums; π_iT_p^(n)(H𝔽_p) finite | supports the statement |
| 4.1 | ns18 lines 4868–4917, Lemma IV.1.3, Cor. IV.1.4–1.5, Rem. IV.1.6, pp.325–326 | unique lax monoidal F_p^× refinement; Σ^∞_+Y factorization through hΣ_p; p−1 invertible on R^tC_p | supports the statement |
| 4.2 | ns18 lines 4920–4928, Lemma IV.1.7, p.327 | Ω^∞ factorization through ((Ω^∞X)^×p)^hΣ_p | supports the statement |
| 4.3 | ns18 lines 4929–4952, Cor. IV.1.8, p.327 | X bounded below and p-complete; split for i≥1 (the extraction renders ≥ as >, as in Thm. IV.1.15's "i > 0", which includes Sq⁰); short exact sequence on π₀ | supports the statement |
| 4.6 | ns18 lines 4966–4985, Cor. IV.1.10, Rem. IV.1.11, p.328 | P_p followed by can; transfer-ideal factorization | supports the statement; NS's transfer ideal is mis-stated (Source issues), and §4.5's Young-subgroup ideal is the right one |
| 4.7 | ns18 lines 4843–4865, Ex. IV.1.2(i)–(ii), pp.324–325 | A→A/p, a↦a^p; constant-to-Tate equivalence for "compact" p-complete R; SW(F_(p^n)) | supports the statement; the README's class (p-completions of finite spectra and retracts of finite cell S_p^∧-modules) correctly replaces "compact" (Source issues) |
| 5.2 | ns18 lines 5256–5259, Lemma IV.1.19, p.336 | R^(nϱ)(X×BΣ_p)≅[Σ^∞_+X,(Σ^(nϱ)R)^hΣ_p] | supports the statement |
| 5.4 | ns18 lines 5194–5205, Lemma IV.1.17, pp.334–335 | Σ^n(R^tC_p)^hF≃((Σ^(nϱ)R)^tC_p)^hF for every n∈ℤ, by exactness of T̃_p on Mod_R | supports the statement |
| 6.3 | ns18 lines 5132–5148 (Thm. IV.1.15), 5155–5170 (Prop. IV.1.16), 5412–5435 (proof); bmms86 line 4481 (VIII Prop. 2.4(vi)), lines 4501–4508 (χ=m!u^m, βb=u, ω=m!bu^(m−1)) | NS gives unsigned components; BMMS gives (−1)^(mi+mn(n−1)/2) and (−1)^n | the README's signed form follows from BMMS; NS errs (Source issues) |
| 7.2 | ns18 lines 640–666 (Ex. I.2.3(iii), p.220), 4990–4997 (eq. (11), p.329) | π_*KU^tC_p and π_*KU^tC_(p²) with ℚ_p(ζ_p)⊕ℚ_p(ζ_(p²)); KU_p^∧[1/p]≃(KU^tC_p)^hF | supports the statement; the p-series misprint is in Source issues |
| 8.2 | ns18 lines 5988–6007, proof of Thm. IV.3.7, p.355 | the fibres become highly connective, so the limit commutes with homotopy orbits, hence with Tate | supports the statement; §8.2 states the general tower form |

No locator is flagged as unverified in the README.

Also read, outside the sample:

- Malkiewich Prop. 2.22 (malkiewich17 lines 609–622): simply connected, no finiteness, with Kuhn 6.6 for finite X. This supports §8.1.
- lnr12 Cor. 4.11 (line 1411), for §1.2.
- Stacks Lemma 10.153.7, Tag 04GK (stacks-algebra line 19502): an equivalence for a henselian local ring. This supports §4.8's bullet at R=ℤ_p.
- The A(n) chain in agm85 lines 217–220. Its ideal I(n) matches the declared gap at odd p.

**Adversarial table.** Every row's values were recomputed this round.

| Statement | Instances | Values on each side / model excluded | Result | Change |
|---|---|---|---|---|
| 1.1 normalization | t=u⁻¹, e=bu⁻¹; (−t,−e); b↦2b at p=3 | β(e)=u·u⁻¹=1, β(−e)=−1; u′=2u, t′=(2u)⁻¹=2t, e′=e, t′²=4t²=t² | Pass | none |
| 1.1 weights (p=3, a=−1) | t, t², e, t⁻¹e | weights −1, +1, 1, a⁻¹; invariant even period −4, integral period 4 | Pass | none |
| 1.2 duality | X=S, p=5, a=2 | t∈Ĥ⁻² has weight 2; the dual in Ĥ_(−2)=Ĥ¹ has weight 2⁻¹=3 in 𝔽₅ (Tate duality Ĥⁿ↔Ĥ^(−n−1)) | Pass | none |
| 2.2 (sample) | zero tower; constant H𝔽_p; Singer S-tower at p=2 | 0=0; Ext^(0,0)_A(A,𝔽_p)=𝔽_p=π₀; bottom degrees of U_n(S)=Σ(ℝP^∞)^(−nλ) are 1,0,−1, so no uniform bound, as the source allows | Pass | none |
| 2.3 (input to 2.4) | Sq¹(x⁻¹⊗1); β(xy⁻¹⊗1); ε at r=0 | binom(−1,1)=−1≡1 gives 1; y⁰⊗1=1; Sq⁰1=1 and (−1)⁰P⁰1=1 | Pass | none |
| 2.4 (sample) | M=0; M=N=𝔽_p | 0=0; Hom_A(𝔽_p,𝔽_p) and Hom_A(R_+𝔽_p,𝔽_p) both of dimension 1, via ε (Cor. 3.5) | Pass | none |
| 2.5 (sample) | U_n(S); U₀(ΣS) against ΣU₀(S); U_n(ΣB) | Σ^(1+n)(S^(−nρ))_hC_p=Σ(BC_p)^(−nρ̄); bottom cells p+1 (3 at p=2) against 2; Σ^(1+n)D(Σ^(−(n−1))B)=ΣU_(n−1)(B) | Pass | none |
| 2.6 (headline) | unit class at p=2 and odd p | Σx⁻¹ has degree 0 (x⁻¹ alone −1); Σxy⁻¹ has degree 1+1−2=0 (y⁻¹ alone −2) | Pass | none |
| 2.7 (sample, headline) | S; H𝔽_p; Hℚ; KU (excluded) | π₀=ℤ_p and π_(<0)=0; π₀Δ=id_𝔽_p; Hℚ_p^∧=0=T_p(Hℚ) since p is invertible (RefinedTraceMethods §2.3(ii)); KU₂^∧/2 has 𝔽₂ in even degrees but T₂(KU)/2=0 | Pass | R02 (citation only) |
| 3.1 | {a,b}←{a}←⋯; S_n=∅; {0,1}ⁿ | stable image 1=|L|; all sizes 0 with no nonemptiness hypothesis; |L|=2^ℵ₀ is outside the hypothesis, and 0^∞ and 0ⁿ10^∞ agree at stage n | Pass | none |
| 3.2 (sample) | 𝔽_p⊕𝔽_p at p=2; n<0; no bounded-below hypothesis | words (1,2),(2,1) form one free C₂-orbit, so Tate is 0; τ_(≤n)(H𝔽_p^⊗p)=0; fib((τ_(>n)Y)_hG) is (n+1)-connective, so lim T_p^(n)=T_p for all X, as in NS | Pass | none |
| 3.3/3.4 (headline) | uncountable J; Σ⁻¹H𝔽_p; KU | π₀=𝔽_p^(J) of dimension κ against the product of dimension 2^κ; 𝔽_p in degree −1 on both sides; KU fails, as the Check says | Pass | none |
| 4.1 (sample) | p=2,3; S[ℕ] | |W|=1 and 2, with 2 invertible in ℤ₃; z↦z², exponent 2≠1 | Pass | none |
| 4.2 (sample) | Hℤ, p=2, x=1+1 | lift 2u+Nm(1); restriction 1+1+2=4; can gives 2; candidates 2u (restriction 2) and 4u (Tate value 4) excluded | Pass | none |
| 4.3 (sample) | H𝔽₂ | 0→𝔽₂→π₀→𝔽₂→0; s(0)=s(1+1)=2s(1)+tr(1), so 2s(1)=tr(1)≠0 and the middle group is ℤ/4 | Pass | none |
| 4.4/4.5 | KU, p=2; Hℤ, p=5 | P₂(2)=2+(1+σ)=3+σ, character 2 at the transposition against 4 for 2²; binom(5,i)=5,10,10,5 with gcd 5; 2⁵−2=30≡0 mod 5 but 30≢0 mod 120 | Pass | none |
| 4.6 (sample) | Hℤ, X=*, p=2; H(𝔽₃[z]); X=∅ | 2↦4≡0 on both routes; z↦z³ with z³−z≠0; Σ^∞_+∅=0 | Pass | none |
| 4.7 (sample) | ℤ at p=3; ℚ; 𝔽₄; S_p^∧ | 2↦8≡2; ℚ/3=0; a²=a+1≠a; p-inversion colimit is 0 in p-complete spectra but ℚ_p on π₀ maps from S_p^∧, so not compact | Pass | none |
| 4.8 (headline) | k=𝔽₄; 𝔽₂, 𝔽₃; ℤ₃[ζ₃] | End_(ℤ₂)(ℤ₂[ζ₃])={x, −1−x}, 2=|Gal(𝔽₄/𝔽₂)|; (2x+1)²=4f−3, a unit; [a]↦[a+1], second iterate fixes [a]; 1=1; 2 lifts against 3 endomorphisms ε↦cε of 𝔽₃[ε]/ε² | Pass | none |
| 5.1 | Möbius λ on S¹; rank −1 at a point | H¹(S¹;ℤ_sign)=ℤ/(1−(−1))=ℤ/2 against ℤ; [S¹,R]=π₁R | Pass | none |
| 5.2 (sample) | X=*, n=−1, p=2; R=ΣHℤ, Σ²Hℤ | π₂ΣHℤ=0 against π₁=ℤ for a rank −1 reading; π₂Σ²Hℤ=ℤ against 0 | Pass | none |
| 5.4 (sample) | Hℤ, p=2, n=1; S | π_iΣ(Hℤ^tC₂) is ℤ/2 for i odd, against even i for a trivial S²; the reflection acts by +1 on π₁(S^ρ)^tC₂=ℤ₂ | Pass | none |
| 5.6 (headline) | p=2, n=1, u∈H¹(ℝP^∞) | u+u²s, of degrees 1 and 2−1 on both routes | Pass | none |
| 6.2 signs | v∈H²(ℂP^∞;𝔽₃); general p; Wilson | v(v+u)(v+2u)=v³+3uv²+2u²v≡v³−vu², so v−v³t²; Π(v+ku)=v^p−vu^(p−1); (m!)² is 1, 4≡−1, 36≡1 at p=3,5,7, equal to (−1)^(m+1); leading coefficient (−1)^m(m!)²u^(p−1)=−u^(p−1) | Pass | none |
| 6.2 multiplicativity | x,z∈H¹(BC₃×BC₃) | (x−ye)(z−we)=xz+(yz−xw)e=φ(xz); unsigned xz+(xw−yz)e≠xz+(yz−xw)e; t^(p−1)=u^(−(p−1)) for every choice of t, so the P^i sign is intrinsic | Pass | none |
| 6.3 (sample, headline) | p=3: v, x, xz; stability | −P¹v=2v³, θ₁v=−β(v³)=0; θ₀x=−y; θ₀(xz)=yz−xw; (−1)^(n+1)β(ι×x)=ι×(−1)ⁿβx | Pass | none |
| 7.1/7.3 (headline) | P₂(−1); H=1+β on S² | P₂(0)=1+P₂(−1)−(1+σ) gives σ, with character −1=ψ²(−1); H^p=1+pβ; β⁻¹↦β⁻¹/p, product 1 | Pass | none |
| 7.2 (sample) | p=2, 3; series at x=0 | dimensions 1 and 1+2=3; ℚ₃(ζ₃) of degree 2 with W-fixed field ℚ₃; (1+x)^p−1 is 0 at x=0, while NS's (x−1)³−1 gives −2 | Pass | none |
| 7.4 | p=2, 3 | 3 against 1; (3−1)+(9−3)=8 against 2 | Pass | none |
| 7.5 | KU, p=2; X=S control | KU₂^∧/2 has π₀=𝔽₂ against rational /2=0; BordismFormalGroups F6.5 item 5 gives (L₁S)^tC₂ E(0)-local; π₀T₂(S)=ℤ₂, not rational | Pass | none |
| 8.1/8.2 (sample, headlines) | S²; S¹; wedge of κ copies of S² | Ω^nΣ^∞S^(2n) has bottom degree n and Ω^nΣ^∞S^(2n+2) has n+2: (1,3),(2,4); S¹ gives n−n=0; the wedge bounds do not depend on κ | Pass | none |
| 8.3 (headline) | Y=* | π₀ of the genuine fixed points is A(C_p)=ℤ², π₀S^hC_p=ℤ⊕ℤ_p; both are ℤ_p² after p-completion | Pass | none |
| gap `steenrod-finite-hopf-chain` | n=−1,0,1 at p=2 and p=3 | dimensions 1, 2, 8 and 1, 2, 4p=12; E(Q₀,Q₁) has dimension 4; agm85 line 217 gives the same I(n) | Pass | none |
| Tau Ceti rigidity contract | both pins | `Module.Finite K M` present at 358314d, absent at 2fd255d; the only use is M=L | Pass at main's pin | none |
| Manifest | 12 entries | 11 complete; `stacks-algebra` has 3 missing fields | Fail | R01 |
| Scope against HermitianKTheoryOfPoincareCategories §5.1a | p=2 sphere case | stated at line 374 and used in six Checks and Examples; owner (position 62) not cited | Fail | R02 |

**Cross-roadmap citations resolved this round.** Every one was read at the current head, or on main. Read through `roadmaps show` or the checkouts the brief gives.

| Roadmap (copy read) | Citations | Result |
|---|---|---|
| StableHomotopyKTheory (#1227 at 5f92355) | Layer 5; §§7.9, 7.14–7.19, 7.21–7.26 | all present with the cited content (Milnor tower 7.9, completeness 7.14–7.18, rational 7.19, Boardman 7.26) |
| GeneralizedCohomology (main) | G2.8, G3.8, G3.9, G4.2, G5.3, G5.4 | extended powers as wedge summands (G2.8); holim and Milnor sequence (G3.8); completion holim E/p^r with F^R(S[1/p],E)≃0 and the Moore-dual function-spectrum identification (G3.9); Thom objects; ku and KU with Bott inverted (G5.4) |
| TangentialBordism (#942 at be5e94d, newer than the head the previous review read) | §B4 items 1, 2, 7, 8 | B4.1 squares; B4.2 mod-2 algebra, dual ξ_i and Adams tower with strong convergence; B4.7 (§4.4) Milnor conventions and "For every odd prime p construct the HF_p Adams tower"; B4.8 (§6.4) freeness over the infinite exterior algebra; line 52 leaves sub-Hopf algebras beyond A(1) to BordismFormalGroups |
| BordismFormalGroups (main) | §F3, §§F6.1, F6.3, F6.4, F6.5 | F3 builds E(n) by v_n-localization of BP⟨n⟩ with ku_(2)≃BP⟨1⟩; F6.3 owns E(Q_i), T_t and the Margolis criteria; F6.5 item 5 proves (L_nS)^tG E(n−1)-local |
| KTheoryFiniteLocalFields (#1281 at 3c5b201) | §§4.0, 4.4, 4.5 | genuine models; norm and restriction with Γ and Γ̂; Tate spectral sequence E²_(s,t)=Ĥ^(−s)(G,π_tT), conditional convergence, pairings, Greenlees comparison, odd-order ring |
| AInfCohomology (#1044 at 91b0719) | §AI.7.2 "Spectral Tate diagonal"; "Circle actions, homotopy fixed points and Tate constructions" | the unit-normalized lax monoidal diagonal and its exactness; the Tate orbit lemma |
| RefinedTraceMethods (#1493 at b0ad346) | §§2.1, 2.3–2.6, 2.8, 2.10–2.13, 2.16, 5.1, 5.3, 6.1 | §2.3(i)–(iii) as consumed; §2.8 E∞ Frobenius with augmentation; §2.10 THH(S[M]); §2.13 representation spheres; §2.16 restriction pullback; §5.1 Snaith ψ^k on KU[1/k]; §5.3 ku and KU orientation; §6.1 étale lifting |
| PadicHodgeRegulators (#1498 at aada6bb) | the two "Supplier:" sections | lines 341 (O_L=W(k), rank dim k, φ_L=W(Frob)[1/p]) and 219 (φ_L unique reduction lift, `TauCeti.frobeniusAlgEquiv`) |
| EnhancedDerivedSheaves, AlgebraicTopology, TopologicalKTheory (main) | E3, E5:abstract; Stage 6; T1–T5, T2.5, T4 | headings and content present |

LocalFieldsRamification is no longer named anywhere in the README.

**Ownership and overlaps.**

- `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.
- `roadmaps grep` over main and the open heads finds the Singer construction, Theorem III.1.7 and Proposition IV.1.12 only here.
- Consumers cite §§2.7 and 7.2 (ChromaticHomotopyTheory at position 332) and §§4.4–4.5 (GeneralAlgebraicKTheoryPartII at 331), consistently with this README.
- RefinedTraceMethods §6.1 now also owns spherical lifts of perfect δ-rings, with the universal property and a Check that S_W(𝔽₄) is free of rank 2. Its last bullet identifies S_B with the étale lift for finite étale B. §4.8 here defines SW(k) as that étale lift, uses no perfect-δ lift (lines 7 and 1087), and derives rank-d freeness and Frobenius uniqueness through the étale equivalence. So no object has two owners.
- RefinedTraceMethods §5.3 computes p-adic ku^tC_p, not the uncompleted KU^tC_(p^r) of §7.2.
- The only uncited earlier owner I found is HermitianKTheoryOfPoincareCategories §5.1a (R02).

**Declared gap `steenrod-finite-hopf-chain`.**

- It is precise: every prime, n≥−1, both ideals, and two-sided freeness.
- It is consistent with ownership: TangentialBordism line 52 owns only A(1) at p=2 and leaves the rest to BordismFormalGroups.
- No pin has the Steenrod algebra.
- It is declared in `design/plan.json` with the same slug and in the package README's "What BordismFormalGroups must provide (gap:…)" line. The ported README states the same sentence at line 112 under the BordismFormalGroups contract.

## Not verifiable

- KTheoryFiniteLocalFields §4.5's boundary normalization ∂(ut⁻¹)=−1 cites HM03 Addendum 4.2.2, which is not in the cache. §1.1 here fixes its own basis (βe=1) and does not use the supplier's generators.
- bmms86 is a two-column scan with garbled extraction. I read Prop. 2.4(vi) at line 4481 and the χ, ω normalization at lines 4501–4508, but not the full proof of the Adem relations.
- The Tau Ceti instance plumbing for the abstract field L=W(k)[1/p] (`IsNonarchimedeanLocalField`, `ValuativeExtension ℚ_p L`) was not elaborated.
- HermitianKTheoryOfPoincareCategories, StableHomotopyKTheory, KTheoryFiniteLocalFields and AInfCohomology have no checkout path in the brief. I read them through `roadmaps show` at their heads.

## Source issues

- **Error** in ns18 at Proposition IV.1.16, printed p.333: the source says Frobenius sends x∈Hⁿ to ΣPⁱ(x)t^((p−1)i)+ΣβPⁱ(x)t^((p−1)i)e, with no signs; it should be Σ(−1)ⁱPⁱ(x)t^((p−1)i)+(−1)ⁿΣ(−1)ⁱβPⁱ(x)t^((p−1)i)e, as the Euler class v^p−vu^(p−1) forces; affects a stated result.
- **Error** in ns18 at Remark IV.1.11, printed p.328: the source says the transfer ideal is the image of the transfer R⁰(X)→R⁰(X×BΣ_p) from the trivial subgroup; it should be generated by transfers from Σ_i×Σ_(p−i), 0<i<p, since for Hℤ at p=5, 2⁵−2=30∉(120); affects a stated result.
- **Misprint** in ns18 at the displays before Theorem IV.1.15 and in its statement, printed pp.332–333: the source says the invariant summands and the Pⁱ, βPⁱ targets are shifted by n(p−1), n(p−1)+1 and i(p−1), i(p−1)+1; it should be 2n(p−1), 2n(p−1)+1 and 2i(p−1), 2i(p−1)+1; affects nothing.
- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 lines 649 and 660): the source says the p- and p²-series are (x−1)^p−1 and (x−1)^(p²)−1; it should be (1+x)^p−1 and (1+x)^(p²)−1, which vanish at x=0, as on p.329; affects nothing.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 line 4852): the source says the comparison holds for R compact in p-complete spectra and gives S_p^∧ as an instance; S_p^∧ is not compact there, since the p-inversion colimit completes to 0; it should say p-completions of finite spectra (dualizable objects); affects nothing.
