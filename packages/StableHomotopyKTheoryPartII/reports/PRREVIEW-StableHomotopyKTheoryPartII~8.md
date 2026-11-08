# Review of StableHomotopyKTheoryPartII (pull request #1733 at e8c1239)

**Verdict:** needs changes

The head is the one the previous review read: the folder has 0 changed lines and nothing outside it changed. This is a full review of the whole folder. Neither previous finding is repaired. There are four findings:

- one new P2: a TangentialBordism item number that the supplier's own head has since moved;
- one new P3: a proof route that recomputes Tate cohomology the pinned Tau Ceti already has;
- the two carried P3s.

## R01 (P2) — The odd-primary Adams tower is cited to TangentialBordism item 8, which no longer contains it

**Location.** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md`, five places:

- line 12: “Its items 2 and 8 own the mod-p Adams tower, cohomological Ext page and bounded-below finite-type convergence.”
- line 88: “Consume §B4 items 2 and 8 for the tower I^(⊗s)⊗B …”
- line 266 (*Needs:* of §2.2), line 374 (*Needs:* of §2.7) and line 384 (Layer 2 Dependencies): “TangentialBordism §B4 items 2 and 8”.

**Claim.** At TangentialBordism's head, the HF_p Adams tower at odd primes, its Ext_(A_p) E₂ page and its strong convergence belong to item 7 (B4.7). Item 8 (B4.8) is the odd-primary MSO/MSpin computation, and it consumes item 7's tower. Item 2 (B4.2) builds only the mod-2 tower.

So §2.2 (inverse-limit Adams spectral sequence) and §2.7 (finite-type Segal) cite, at every odd prime, a section that does not state their convergence input. The content moved within TangentialBordism (commit 2c82879d) the day before this README's citation was last written. The overlaps tool does not detect content that moves under an unchanged number.

**Witness.** `TauCetiRoadmap/TangentialBordism/README.md` at head 059ac6a:

- line 1745: “### 6.4 Odd-primary SO and Spin comparison (B4.8)”;
- line 1747: “Using item7's HF_p Adams tower”;
- lines 1160–1167, in B4.7: “For every odd prime p construct the HF_p Adams tower … prove item2's convergence statement at p”.

**Exact repair.** Replace “items 2 and 8” with “items 2 and 7” at lines 12, 88, 266, 374 and 384. Keep line 78 as it is: its “TangentialBordism §B4 item 8, whose freeness is over the infinite exterior algebra of Milnor primitives” matches B4.8, which proves A_p free as a right E(Q₀,Q₁,…)-module.

**Tested** at p=3:

- B4.7 (TangentialBordism line 1160) supplies E₂=Ext_(A₃)(H*B,𝔽₃) and strong convergence to the derived 3-completion, as §2.2 and §2.7 need.
- B4.2 supplies the same at p=2.
- TangentialBordism is at merge-order line 15, before this roadmap (line 331), so the edge stays downward.

## R02 (P3) — The Tau Ceti contract leaves out `Module.Finite K M` from `TauCeti.IsUnramified.residueFieldHomEquiv`

This is the previous report's R01, carried unchanged because the head has not changed.

**Location.** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:45`: “for every nonarchimedean local field M with `Algebra K M` and `ValuativeExtension K M`, reduction is a bijection from the K-algebra maps L→M to …”.

**Claim.** The pinned equivalence also requires `[Module.Finite K M]`. The bullet lists every other instance hypothesis.

**Witness.** `TauCeti/NumberTheory/LocalField/Unramified/Rigidity.lean:67–70` has a variable block ending `[ValuativeExtension K M] [Module.Finite K M] [IsUnramified K L]`, and line 142 has `def IsUnramified.residueFieldHomEquiv`. My scratch `#check @TauCeti.IsUnramified.residueFieldHomEquiv` elaborates with both `Module.Finite K L` and `Module.Finite K M`.

**Exact repair.** Replace “with `Algebra K M` and `ValuativeExtension K M`” by “with `Algebra K M`, `ValuativeExtension K M` and `Module.Finite K M`”.

**Tested** at M=L, the only use (§4.8 lines 631 and 638): the new hypothesis becomes `Module.Finite K L`, which the bullet already lists.

## R03 (P3) — §1.1 and §6.1 recompute Tate cohomology of C_p that Mathlib and Tau Ceti have at the pins

**Location.**

- `README.md:170` (§1.1 route): “Use the alternating maps g−1 and N in the complete cyclic resolution; cup products give the Laurent generator and, at odd p, the exterior generator.”
- `README.md:818` (§6.1 route): “For HZ Tate, use the periodic resolution to exhibit the two-term pieces with differential p”.
- The Tau Ceti contract (line 42) names only §4.8 as a consumer, and neither it nor the Mathlib contract (line 38) lists a Tate-cohomology declaration.

**Claim.** The algebraic inputs of both routes are pinned:

- Tate cohomology of a finite group in every integer degree;
- its two-periodicity and two-term models for cyclic groups;
- its cup product in all integer bidegrees, with the Koszul sign.

The roadmap re-derives them instead of citing them.

**Witness.** All of these elaborated in my scratch file:

- Mathlib `tateCohomology` (`…/TateCohomology/Basic.lean:145`);
- Tau Ceti `Rep.FiniteCyclicGroup.periodicIso` (`…/TateCohomology/Periodic.lean:346`);
- `tateCohomologyIsoEven`/`tateCohomologyIsoOdd` (lines 167 and 200: homology of M –N→ M –(g−1)→ M);
- `TauCeti.TateCohomology.cup` (`Cup/Product.lean:131`) and `cup_gradedComm` (`Cup/GradedComm.lean:168`).

**Exact repair.**

1. Add `tateCohomology` to the Mathlib contract.
2. Add a Tau Ceti bullet naming the four declarations with their files, and extend the sentence on line 42 to say that §1.1 and §6.1 also consume them.
3. In §1.1, replace the quoted route sentence by one that reads the groups from `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`/`tateCohomologyIsoOdd` and the products from `TauCeti.TateCohomology.cup`, with b²=0 at odd p from `cup_gradedComm`. At odd p also cite KTheoryFiniteLocalFields §4.5's Ĥ*(C_r,k)=Λ_k(u)⊗k[t,t⁻¹].
4. Add these to the §1.1 and §6.1 *Needs:* lines and to the Layer 1 and Layer 6 Dependencies.

The normalization of t and e, the Weyl action and the Bockstein normalization βe=1 stay as this roadmap's targets.

**Tested** at G=C₃, M=𝔽₃ trivial:

- N=3=0 and g−1=0, so every even and every odd degree is 𝔽₃/0=𝔽₃, the dimension 1 per degree that §1.1's 𝔽₃[t^(±1)]⊗Λ(e) has.
- `cup_gradedComm` at p=q=1 gives b∪b=−b∪b, hence b²=0, the exterior relation.
- At M=ℤ trivial, the two-term model gives ℤ/3 in even degrees and 0 in odd degrees, as §6.1 uses.

## R04 (P3) — The `stacks-algebra` manifest entry is still orphaned

This is the previous report's R02 (originally R03), carried.

**Location.** `packages/StableHomotopyKTheoryPartII/sources.toml:186–197`, the `[[source]]` with `id = "stacks-algebra"`, `locator = "04GK"`, `cited_for = ["4.8"]`.

**Claim.**

- The README cites no Stacks tag, so the entry records a work the roadmap does not cite.
- Its `cited_for` points at §4.8, which does not use it.
- It has no `authors`, `title` or `year`.

The file is in the board package, not in the pull request's folder. No repair report marks it as not actionable.

**Witness.**

- A case-insensitive search of the README for “Stacks” and “04GK” finds 0 hits.
- The References (lines 1083–1095) list eleven works, exactly the other eleven manifest ids.
- The file was last changed by ec4e09f5.

**Exact repair.** Delete lines 186–197 of `packages/StableHomotopyKTheoryPartII/sources.toml`, including the `[[source]]` header. Nothing in the README changes.

**Tested:** after deletion, the manifest has 11 entries and all 11 are cited in the README.

## Previous findings

- **R01 of the previous report — not repaired.** Line 45 still reads “for every nonarchimedean local field M with `Algebra K M` and `ValuativeExtension K M`”. Carried as R02.
- **R02 of the previous report — not repaired.** `sources.toml:187` still has `id = "stacks-algebra"` … `cited_for = ["4.8"]`, and the README cites Stacks 0 times. Carried as R04.

## Verified sound

**Gate, dependency direction, elaboration.** I ran all of these on this head.

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
```

- The worker's gate on this head, which includes the targeted build, reports `build=0`.
- The dependency check prints no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD` outside the folder is empty, and the worktree is clean.
- `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exits 0 with no output.
- The pins are Mathlib f6090c70 and Tau Ceti 358314d4. The README names no pin hash.

**Lean signatures.** `Suggested.lean` declares nothing: a module docstring, `import Mathlib` and an empty namespace. So the signature inventory and the one-tactic padding probe have zero entries.

I elaborated one scratch file with 35 `#check`s:

- the 31 backticked library names of the README;
- the four Tate declarations of R03, after `lake build` of `TauCeti.RepresentationTheory.Homological.TateCohomology.Cup.GradedComm`.

All 35 resolve. Their hypotheses match the README in every case but R02. Some examples:

| Declaration | Elaborated hypotheses |
|---|---|
| `FiniteField.natCard_algHom_of_finrank_dvd` | `[Finite L]` and `finrank F K ∣ finrank F L` |
| `IsGalois.of_card_aut_eq_finrank` | `[FiniteDimensional F E]` |
| `WittVector.coeff_frobenius_charP` | `[CharP R p]` |
| `CategoryTheory.Functor.eventually_injective` | cofiltered, nonempty and finite stages, surjective transitions, `[Finite F.sections]` |
| `TauCeti.eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one` | `FiniteDimensional`, `IsGalois` |
| `Padic.integerRingEquiv` | `𝒪[ℚ_[p]] ≃+* ℤ_[p]` |

**Headline theorems and padding.** The README's headline theorems are:

- the Singer Tor-equivalence (§2.4);
- the inverse-limit Adams theorem (§2.2);
- the Singer cohomology comparison (§2.6);
- finite-type Segal (§2.7);
- bounded-below Segal (§3.4);
- the Weyl refinement (§4.1);
- the all-degree Frobenius comparison (§5.6);
- the spherical Witt Frobenius (§4.8);
- the total Steenrod form (§6.3);
- the KU Adams form (§7.3);
- the counterexamples (§§7.4–7.5);
- the free-loop totalization, Tate commutation and free-loop Segal (§§8.1–8.3).

The docstring names all of them, in 14 items, as not statable. I confirmed that the pins have no carrier for them:

- a search of both pinned libraries for spectrum, prespectrum, Steenrod-square or Thom-spectrum carriers finds none;
- Tau Ceti's `AlgebraicTopology/EilenbergMacLane` holds K(G,1) spaces, not spectra.

§2.4 is algebraic, but the Steenrod algebra is not at the pins, and the Singer module structure would be sorry'd data. The finite-tower lemma (§3.1) and the integral Witt statements of §4.8 are statable, but they are supporting results, as the docstring says. So the empty file is correct, and there is no padding.

**Shape.**

- 8 layers, each with Examples and Dependencies.
- 38 subsections, each with at least 3 Checks (counts 3–6) and one *Needs:* line.
- No LaTeX, process words or forbidden suppliers (the 15 names of the brief and LocalFieldsRamification occur 0 times).
- References equal the manifest minus R04's entry.

**Seeded sample.** Every locator was read in the cached text.

| Target | Locator checked | Theorem, page, hypotheses |
|---|---|---|
| 1.1 | ns18 line 5098, p.332; ns18 line 599, p.218 | Ĥ*(C_p;𝔽_p)=𝔽_p((t))⊗Λ(e) with \|t\|=−2 and \|e\|=−1. The F_p^× action on t⁻¹e is the inverse of multiplication (line 5111), as §1.1 has (weight a⁻¹). Ĥ*(C_p;ℤ)=𝔽_p[t^(±1)]. Agree. |
| 2.1 | lnr12 line 400, Definition 2.3, p.870 | Colimit over a tower of bounded-below finite-type stages. Line 411 gives the Singer tower example ΣP(x,x⁻¹). Agree. |
| 2.2 | lnr12 line 265, Proposition 2.2, p.867 | Each Y_n bounded below and of finite type, with no uniform bound; strong convergence to π_*(Y_p^∧). Agree. |
| 2.3 | lnr12 lines 641–712, Definition 3.1 and (3.1)–(3.3), pp.875–876 | All four action formulas and both ε formulas are identical to line 271. |
| 2.5 | lnr12 line 1940, Proposition 5.7, p.902 | (B^∧p)^(tC_p)[1−(p−1)n]≃Σ^(1+n)D_(C_p)(Σ^(−n)B), n≥0. Agree. |
| 2.6 | lnr12 line 1964, Theorem 5.9, pp.902–903; line 2038, Proposition 5.12, p.904; ns18 line 3236, Definition III.1.4, p.286 | Bounded below and of finite type. Agree. |
| 2.7 | lnr12 line 2109, Theorem 5.13, p.905 | Bounded below and of finite type over 𝔽_p; a p-adic equivalence. Agree. |
| 3.1 | ns18 line 3331, Lemma III.1.8, p.289 | S_∞ finite; eventual injectivity; compactness for the image. Agree. |
| 4.1 | ns18 lines 4868–4917, Lemma IV.1.3, Corollaries IV.1.4–IV.1.5, Remark IV.1.6, pp.325–326 | Unique lax symmetric monoidal factorization; Σ_p for suspension spectra; p−1 invertible. Agree. |
| 4.5 | bmms86 line 4297, scan p.130; ns18 line 4972, Remark IV.1.11, p.328 | The source defines its transfer ideal through the trivial subgroup. The README's Young-subgroup ideal is the correct one (Source issues). |
| 4.8 | ns18 line 4858, Example IV.1.2(ii), p.325 | Étale over S_p^∧ with π₀=W(𝔽_(p^n)); the Frobenius is the unique E∞ map inducing Witt Frobenius. Agree. The compactness correction is in the design's E4. |
| 5.2 | ns18 line 5256, Lemma IV.1.19, p.336 | R^(nρ)(X×BΣ_p)≅[Σ∞_+X,(Σ^(nρ)R)^(hΣ_p)], n∈ℤ. Agree. |
| 5.3 | ns18 line 5189, equation (12), p.334 | The P_p^n definition. Agree. |
| 6.2 | bmms86 line 4481, Proposition 2.4(vi), scan p.134; line 4501, scan p.135 (χ=m!u^m, βb=u, ω=m!bu^(m−1)); ns18 line 5155, Proposition IV.1.16, p.333 | BMMS gives the signed expansion. ns18 states it unsigned, and the README correctly overrides it (Source issues). |
| 7.5 | ns18 lines 3283–3287, p.288 | (KU⊗KU)^(tC₂) is rational as a module over the KU-local sphere's Tate spectrum. Agree. |

Also verified:

- agm85 lines 214–219 (p.439) define A(n) by the τ_r with r>n and the ξ_s^(p^r) with r+s≥n+1, with A(−1)=𝔽_p and A(0)=E(β), as the gap states.
- Lemma 2.1 is at line 236.
- ns18 Theorem IV.3.7 (line 5978, p.354) requires only simple connectivity, as §8.3 states.
- ns18 Example I.2.3(i) and (iii) (lines 618–666) support the sphere and KU counterexamples.

**Supplier citations resolved this round.**

| Supplier | Copy read | Result |
|---|---|---|
| StableHomotopyKTheory | head of #1227 | Layer 5; §§7.9, 7.14–7.19, 7.21–7.26 all present (7.26 is Boardman convergence). |
| KTheoryFiniteLocalFields | head of #1281 | §4.0, §4.4 (norm, homotopy orbits, modern comparison), §4.5 (Tate cochains, products, Greenlees comparison, conditional convergence). |
| AInfCohomology | head of #1044 | §AI.7.2 contains “Spectral Tate diagonal” (line 3850). The “Circle actions…” target includes `AInf.Trace.tateOrbit` for bounded-below inputs (line 3834). |
| RefinedTraceMethods | head b0ad346a | §2.3(i) gives truncation for all Y and (iii) p-completeness for bounded-below inputs. §2.3 has the fixpoint lemma, §2.8 the augmented Tate-valued Frobenius, §2.10 THH(S[M]) and the free loops, §2.13 representation spheres, §2.16, §5.1, §5.3 (KU orientation) and §6.1. |
| PadicHodgeRegulators | head aada6bbd | Both quoted targets at lines 219 and 341, with O_L=W(k), rank and φ_L=W(Frob)[1/p]. |
| TangentialBordism | head 059ac6a | B4.1, B4.2 and B4.7 as cited; B4.8 fails (R01). |
| On main | | GeneralizedCohomology G2.8 (free commutative algebra versus extended powers), G3.8, G3.9, G4.2, G5.3 and G5.4 (ku, KU). BordismFormalGroups F3 (ku_(2)≃BP⟨1⟩, E(n)), F6.1, F6.3 (E(Q_i), T_t, Margolis), F6.4 (smashing) and F6.5 (norms, transfers, item 5 E(n−1)-locality). TopologicalKTheory T1–T5 and T2.5. AlgebraicTopology Stage 6. EnhancedDerivedSheaves E3 and E5:abstract. |

**Open revisions of the on-main suppliers.** Checked at their heads:

- BordismFormalGroups, GeneralizedCohomology and TopologicalKTheory at #1807, #1808 and #1854 keep every cited heading and item.
- EnhancedDerivedSheaves at #1330 and #1630 keeps E3 and E5:abstract.
- AlgebraicTopology at #1663, #1797, #1807, #1808 and #1854 keeps “Stage 6”. #1652 relabels it “Layer 6” under the same title, “cohomology, products, and manifold duality”, so the quoted title resolves on every head.

**Ownership.**

- `roadmaps grep` for the Segal conjecture, the Singer construction, the Tate-valued Frobenius, spherical Witt vectors, total Steenrod and free-loop Segal finds no second owner.
- GeneralAlgebraicKTheoryPartII cites §§4.4–4.5 and §4.8 here. ChromaticHomotopyTheory cites §2.7 and §7.2. HermitianKTheoryOfPoincareCategories uses the Tate-valued Frobenius as a consumer. All the cited ids exist.
- HabiroCohomologyFoundationsPartII takes general spherical lifts from RefinedTraceMethods §6.1, which this README does not construct.
- `overlaps.md` lists no pull request changing this roadmap and no dropped or revision-only id.

**Declared gap `steenrod-finite-hopf-chain`.**

- plan.json names BordismFormalGroups F6.3.
- The `needs` sentence is restated in that supplier's subsection (README line 100, without the slug label).
- It is precise: the ideal, the chain endpoints and two-sided freeness.
- It is minimal: F6.3 on main has only E(Q_i), T_t and Margolis criteria; TangentialBordism B4.8 has freeness over the infinite exterior algebra; neither pin has a Steenrod algebra.
- The supplier is on main.
- Its Checks compute: dim A₂(1)=8, dim A₃(1)=4·3=12, and Sq¹·Sq²Sq¹=Sq³Sq¹.

**Adversarial mathematics.** These values were computed this round.

| Statement | Instances | Values on each side / model excluded | Result | Change |
|---|---|---|---|---|
| 1.1 normalization | p=3, a=−1; b→2b; (−t,−e) | deg t²=−4 with weight (−1)²=1. β(e)=u·u⁻¹−b·β(u⁻¹)=1−0=1. β(−e)=−1. 2b gives t′=2t and t′²=4t²=t². Hℤ at p=2: π₀=ℤ/2, π₁=0. | Pass | R03 (route) |
| 1.2 homological Tate spectral sequence | S, C₂; C₃ at p=2; p=5, a=2 | H^c_n=𝔽₂ for all n, against H_*(S₂^∧)=𝔽₂ in degree 0 only. Ĥ*(C₃;𝔽₂)=0, against H₀=𝔽₂. Weight of t is 2, of its dual 2⁻¹=3. | Pass | None |
| 2.1 continuous cohomology | constant tower; Σ^(−n)H𝔽_p with zero maps; Singer tower | H_c=H*B; H_c=0 against ⊕≠0; Σ𝔽₂[x^(±1)] against H*(S₂^∧) zero in negative degrees. | Pass | None |
| 2.2 inverse-limit Adams | zero tower; constant H𝔽_p; Singer tower at p=2 | 0=0; Ext=𝔽_p at (0,0)=π₀; bottom degrees 1, 0, −1. | Pass | R01 |
| 2.3 Singer module | p=2, x⁻¹; p=3, y⁻¹ and xy⁻¹ | Sq¹(x⁻¹)=binom(−1,1)x⁰=1, against 0 for the trivial action. P¹(y⁻¹)=binom(−1,1)y=−y, matching P¹(y^k)=ky^(k+2). β(xy⁻¹)=1. ε(Σx⁻¹)=Sq⁰1=1. | Pass | None |
| 2.4 Tor-equivalence | M=0; M=N=𝔽_p; N=Σ^(−1)𝔽_p | 0=0. Hom dimension 1=1 with the unit sent to 1. The shift is visible. | Pass | None |
| 2.5 approximation | U_n(S) at p=2, 3; U₀(ΣS) | Bottom degrees 1−(p−1)n: (1,0,−1) at 2 and (1,−1,−3) at 3. Bottom p+1=3 against ΣU₀(S) bottom 2. | Pass | None |
| 2.6 unit | p=2, p odd | deg Σx⁻¹=0 and deg Σxy⁻¹=1+1−2=0, against deg y⁻¹=−2. | Pass | None |
| 2.7 finite-type Segal | S; H𝔽_p; Hℚ | π₀ target ℤ_p. Identity of 𝔽_p. Hℚ_p^∧=0=(Hℚ^⊗p)^(tC_p). | Pass | R01 |
| 3.1 finite towers | constant 2-set; empty; {a,b}←{a}; {0,1}ⁿ | Images 2/2 and 0/0; stable image 1=\|L\|; \|L\|=2^ℵ₀, where 0^∞ and 0ⁿ10^∞ agree at stage n. | Pass | None |
| 3.4 bounded-below Segal (headline) | S; Σ⁻¹H𝔽_p; ⊕_κ𝔽_p; KU | π₀=ℤ_p. 𝔽_p in degree −1 on both sides. 𝔽_p^(J), not the product. KU₂^∧/2 π₀=𝔽₂ against T₂(KU)/2=0. | Pass | None |
| 4.1 Weyl refinement | p=2, 3; S[ℕ] | \|W\|=1 and 2; z↦z², exponents 1≠2. | Pass | None |
| 4.2–4.3 space diagonal, splitting | Hℤ, p=2; H𝔽₂, p=2 | 2u+Nm(1) restricts to 4 and has Tate image 2. 2D(1)=Nm(1)≠0, so π₀A^(hC₂)=ℤ/4. | Pass | None |
| 4.4 power | KU, p=2; Hℤ; H𝔽₄ | P₂(2)=3+sign, character 2 against 4. P₂(2)=4≠2. a²=a+1≠a. | Pass | None |
| 4.5 transfer ideal | Hℤ, p=5; H𝔽_p | binom(5,i)=5,10,10,5 with gcd 5. 30≡0 mod 5 but 30≢0 mod 120 (the source's trivial-subgroup ideal). I=0 mod p. | Pass | Source issue |
| 4.7 examples | ℤ at p=3; ℚ; 𝔽₄; S_p^∧ | 2³≡2 mod 3. ℚ/3ℚ=0. a²=a+1. The completed p-inversion colimit is 0, against ℚ_p. | Pass | None |
| 4.8 SW(k) (headline) | 𝔽₄; 𝔽₂, 𝔽₃; ℤ₃[ζ₃] | f′=2x+1 has N=−(2x+1)²=3, a unit of ℤ₂. x↦−1−x reduces to a+1=a². Counts 2=2 and 1=1. ℤ₃[ζ₃] gives 2 against 3. | Pass | R02 |
| 5.1–5.2 twists, Thom | Möbius λ; X=*, n=−1; ΣHℤ, Σ²Hℤ | H¹(S¹;ℤ_sign)=ℤ/2 against ℤ. π_pR. π₂(ΣHℤ)=0 against π₁=ℤ. π₂(Σ²Hℤ)=ℤ against 0. | Pass | None |
| 5.3 Rezk powers | H𝔽₂, n=1; KU, n=−2 | ub+u², both nonzero; β↦β², a unit. | Pass | None |
| 5.4 Tate suspension | Hℤ, p=2, n=1 | ℤ/2 in odd degrees, against even degrees for the trivial Σ². | Pass | None |
| 5.6 all-degree Frobenius (headline) | n=0, Hℤ; n=1, u | 2↦0; u+u²s with degrees 1, 1. | Pass | None |
| 6.2 Steenrod signs | v∈H²(ℂP∞;𝔽₃); x, z∈H¹(BC₃²); (m!)² | ∏_(k∈𝔽₃)(v+ku)=v³−vu², and dividing by −u² gives v−v³t²; the unsigned version is excluded. (x−ye)(z−we)=xz+(yz−xw)e, equal to the value on xz; the unsigned version gives xz+(xw−yz)e. (m!)²=(−1)^(m+1): 1 at p=3, 4≡−1 at p=5, 36≡1 at p=7. | Pass | Source issue |
| 6.3 total Steenrod (headline) | p=3 | Components −P¹ into Σ⁴ and θ₁ into Σ⁵. θ₀(x)=−y and θ₀(xz)=+(yz−xw). β(ι×x)=−ι×βx. | Pass | None |
| 7.2–7.4 KU Tate, Adams, orbit (headline) | p=2, 3 | Dimensions (1,3) and (2,8). (−1)³−1=−2, against 0 for 1+x. β↦pβ and β⁻¹↦β⁻¹/p, with product 1. Orbit dimensions 3 against 1 and 8 against 2. | Pass | None |
| 7.5 unbounded counterexample | KU at 2; S | 𝔽₂ against 0 mod 2; π₀T₂(S)=ℤ₂ is not rational. | Pass | None |
| 7 Examples, sphere fixpoint | trivial C_(p²) on S | (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧, with π₀=ℤ₂ and ℤ₃, not 0. | Pass | None |
| 8.1–8.3 free loop (headline) | Y=*, S², S¹ | Bottom degrees (1,3), (2,4); S¹ stays at 0. A(C_p) has rank 2 against ℤ⊕ℤ_p, both completing to ℤ_p². | Pass | None |
| Supplier item numbers | TangentialBordism B4.8 against B4.7 | B4.8 is the MSO/MSpin odd-primary computation; the HF_p tower is B4.7. | Fail | R01 |
| Tau Ceti rigidity contract | elaborated signature | `Module.Finite K L` and `Module.Finite K M` at the pin; the README lists the first only. | Fail | R02 |
| Tate inputs at the pin | C₃ on 𝔽₃; ℤ | 𝔽₃ in every degree; b²=0 from `cup_gradedComm`; ℤ/3 and 0. | Duplicated | R03 |
| Manifest | 12 entries | 11 cited; `stacks-algebra` cited 0 times. | Fail | R04 |

## Not verifiable

- KTheoryFiniteLocalFields §4.5 fixes its odd-order Tate basis by ∂(ut⁻¹)=−1, citing Hesselholt–Madsen, Addendum 4.2.2. That text is not in the cache, so I could not tell whether that ∂ is the mod-p Bockstein. If it is, KTheoryFiniteLocalFields's t would be −βb, whereas §1.1 here has βe=+1. This roadmap fixes its own basis (README line 113) and consumes only the Eilenberg–MacLane/Tate comparison from §4.5, so I raise nothing.
- The bmms86 scan's OCR at lines 4473–4481 is noisy. The sign exponents (−1)^(mi+mq(q−1)/2) and (−1)^q are legible, and I confirmed the resulting signs independently through the Euler-class computation in the table.
- The Tau Ceti instances for the abstract field L=W(k)[1/p] (`IsNonarchimedeanLocalField`, `ValuativeExtension ℚ_p L`) were not checked; this is implementer plumbing.
- For StableHomotopyKTheory, KTheoryFiniteLocalFields and AInfCohomology, the brief gives no checkout path, so I read them through `roadmaps show` at their heads. Ownership against open pull requests without files in the brief was checked only through `roadmaps grep`.

## Source issues

- **Error** in ns18 at Proposition IV.1.16, printed p.333: the source says Frobenius sends x∈H^n to ΣP^i(x)t^((p−1)i)+ΣβP^i(x)t^((p−1)i)e, with no signs; it should be Σ(−1)^iP^i(x)t^((p−1)i)+(−1)^nΣ(−1)^iβP^i(x)t^((p−1)i)e, as the Euler class v^p−vu^(p−1) forces; affects a stated result.
- **Error** in ns18 at Remark IV.1.11, printed p.328: the source says the transfer ideal is the image of the transfer R⁰(X)→R⁰(X×BΣ_p) from the trivial subgroup; it should be generated by transfers from Σ_i×Σ_(p−i), 0<i<p, since for Hℤ at p=5, 2⁵−2=30∉(120); affects a stated result.
- **Misprint** in ns18 at the displays before Theorem IV.1.15 and its statement, printed pp.332–333: the source says the invariant summands and the P^i, βP^i targets have shifts n(p−1), n(p−1)+1 and i(p−1), i(p−1)+1; it should be 2n(p−1), 2n(p−1)+1 and 2i(p−1), 2i(p−1)+1; affects nothing.
- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 lines 649 and 660): the source says the p- and p²-series are (x−1)^p−1 and (x−1)^(p²)−1; it should be (1+x)^p−1 and (1+x)^(p²)−1, vanishing at x=0; affects nothing.
