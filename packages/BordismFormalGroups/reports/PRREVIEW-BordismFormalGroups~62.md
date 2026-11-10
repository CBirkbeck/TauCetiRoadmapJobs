# Review of BordismFormalGroups (pull request #1807 at 7fa7fe9)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/BordismFormalGroups/README.md` (3483 lines) and `Suggested.lean` at `7fa7fe9`. The README changed by 662 lines since `d796110`; `Suggested.lean` did not change.

- **Gate.** The worker's gate passes every check, the targeted build included. My rerun differs only in `outside-folder=26`: the README and `Suggested.lean` of the 13 sibling folders the brief names as this pull request's own. Not a finding. `git diff --stat origin/main...HEAD` shows no change outside the 14 folders.
- **Dependency check.** `depcheck: 234 roadmaps, 2279 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- **Lean.** `lake env lean` on `Suggested.lean` gives three `sorry` warnings and nothing else.
- **Findings.** One blocking finding (R01: a supplier cited for statements it does not make, with idempotent splitting unowned where BP is built) and four P3 findings (build order of F1.5, one *Needs:* attribution, missing locators in sampled sections, References).

## Previous findings (review of d796110)

| Id | Status | Evidence at 7fa7fe9 |
|---|---|---|
| R01, second owners (TangentialBordism, HomotopySpheres) | repaired | The description now says: "TangentialBordism (#942) and HomotopySpheres (#1287) still name themselves as owners … they cite it once this pull request merges: TangentialBordism B4.1, B4.2 and B4.7 → F2.2, and B4.4 → F2.4; HomotopySpheres 3B → F6.2's James construction, and 3C.3 → F4.1." README lines 66–79 carry the TangentialBordism mapping. BordismFormalGroups is on main, so it is the owner. |
| R02, build order | partly repaired | The Ω-spectrum section is now F4.6 (line 1378), after F4.4's Atiyah–Hirzebruch spectral sequence; F2.4/F2.5 are swapped (lines 827, 884); the Massey/Toda comparison is F4.5 (line 1318), after F4.3–F4.4; F5.1 opens with the primitive computation (lines 1436–1440) and the Lazard-ring classification sits in F5.3 (lines 1545–1584). One forward edge remains, which that review did not list: F1.5 needs F3 (R02 below). |
| R03, AlgebraicTopology Stage 8.7 | repaired | Lines 3219–3221: "Obtain the finite CW models of C and D from AlgebraicTopology Stage 8.7 (the compact case …)"; contract lines 209–210, *Needs:* 3360–3361, Dependencies 3432. No GeometricTopology citation remains. |
| R04, *Needs:* of F6.3–F6.5; Johnson–Wilson credit | repaired | F6.3 has four *Needs:* lines (2290, 2372, 2491, 2626) naming AlgebraicTopology Stage 8.8 and F4.1; F6.4's (2929–2938) names F3.2, F5.5 and F4.3; F6.5's (3187–3199) names F6.3, F4.1 and G5.1. Scope line 43 reads "the Bousfield classes of the Johnson–Wilson theories". |

## R01 (P2) — G2.4 is cited for localization of spectra, idempotent splitting and telescopes, none of which it states; idempotent splitting has no owner where BP is built

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- lines 1029–1030 (F3.1 *Needs:*): "GeneralizedCohomology G2.4 (localization and splitting of idempotents of spectra)";
- lines 1112–1113 (F3.3 *Needs:*) and 1144 (F3 Dependencies): "G2.4 (cofibers and localization of spectra)";
- line 2299 (F6.3 *Needs:*): "G2.4 (cofibers, telescopes, idempotent splitting and the cellular filtration of finite spectra …)".

**Claim.** F3.1 splits the p-typicalization idempotent of MU_(p) to obtain BP, and F3.3 inverts v_n; both are presented as consuming G2.4. G2.4 states neither, so the splitting is an unowned prerequisite at F3.1, and the other two items point at the wrong section.

**Witness.** `TauCetiRoadmap/GeneralizedCohomology/README.md` at this head, G2.4 (lines 824–880): its only localization is "the native categorical localization at stable equivalences"; the word "idempotent" does not occur in it (one hit in the file, line 2650, G3.9's "smashing and idempotent"), and no telescope is built there. p-localization is G3.9 (line 2606), sequential homotopy colimits with their Milnor sequence are G3.6 (line 2416), and inverting a class of a commutative ring spectrum is G2.8 (lines 1128–1132). F6.3 itself (lines 2221–2222) splits idempotents "by its mapping telescope", which is the construction F3.1 needs two layers earlier.

**Repair.**
- In F3.1, state the splitting as a target: an idempotent e of an object X of G2.4's stable homotopy category splits, the mapping telescope of X→X→⋯ along e (G3.6's sequential homotopy colimit) being a summand eX with X≃eX∨(1−e)X; give it a locator.
- F3.1 *Needs:*: G3.9 (MU_(p)), G2.4 (the stable category and its cofiber triangles), G3.6 (sequential homotopy colimits).
- F3.3 *Needs:* and F3 Dependencies: replace "localization of spectra" by G3.9 for p-localization and G3.6 for the v_n-telescopes that F3.3 builds; cite G2.8 only where a commutative ring localization is used.
- F6.3 *Needs:*: cite F3.1 for idempotent splitting and G3.6 for telescopes; keep G2.4 for cofibers and the finite-subcomplex filtration (its line 835).
- Check on the instance: after the change, a grep of GeneralizedCohomology for each parenthesised item finds it in the cited section.

## R02 (P3) — F1.5's route needs F3, and the Honda law needs BP: the algebraic p-typical theory sits behind Quillen's theorem

**Location.**
- Lines 553–555 (F1.5 *Needs:*): "for Ravenel's route also F3's p-typical coordinates and Hazewinkel generators, which are a route input, not an input of the statement"; lines 589–591 repeat it in the F1 Dependencies.
- Line 1068 (F3.2 *Needs:*): "F3.1's BP_* with its classifying property for p-typical laws".
- The description: "Its layers are ordered so that every section needs only earlier ones."

**Claim.** The only route the README gives for F1's one target passes through F3.1, whose *Needs:* (lines 1028–1029) is F2.3, Quillen's theorem, and so the whole spectral stack of GeneralizedCohomology. F3.2 in turn needs F1.5 (line 1069), so the layers F1 and F3 need each other. What the route uses is pure algebra.

**Witness.** `ravenel-green` lines 20790–20822 (Theorem A2.2.12 and its proof, p. 367): the proof uses Cartier's theorem A2.1.18, the ring V of A2.1.24–A2.1.25, formula (A2.2.4) and the right unit of Theorem A2.2.6, all statements about formal group laws; no spectrum occurs. The pinned Tau Ceti has no p-typical declaration (a grep of `TauCeti/RingTheory/FormalGroup` for `pTypical`, `IsPTypical` finds nothing), so the target is not at the pin either.

**Repair.**
- Add to F1.5, before the classification paragraph (no renumbering), the algebraic p-typical theory as targets with their locators: p-typical laws and Cartier's theorem (Ravenel, Theorem A2.1.18), the ring V=ℤ_(p)[v₁,v₂,…] classifying them (A2.1.24, Theorem A2.1.25), Hazewinkel's and Araki's generators and their congruence modulo p ((A2.2.1), (A2.2.2), Theorem A2.2.3, p. 364), the p-series formula (A2.2.4) and the right-unit formula (Theorem A2.2.6). *Needs:* the pinned Lazard ring, `mvPolynomialEquiv` and the logarithm over L⊗ℚ.
- F1.5's *Needs:* then names that paragraph; F3.2 defines H_n by V→𝔽_p and needs it instead of F3.1's BP_*; F3.1 identifies (BP_*, BP_*BP) with (V, VT) (Ravenel, Theorem 4.1.19, p. 113).
- Check on the instance: after the change no *Needs:* line of F1 names F3, F3.2 needs only F1, and the description's sentence is true.

## R03 (P3) — F6.2's *Needs:* credits F2.2 with homology operations it does not construct

**Location.** Lines 2054–2056: "F2.2's mod-p homology operations at odd p and their prime-2 modifications constructed here".

**Claim.** F2.2 constructs the cohomological Steenrod operations and the dual Steenrod algebra. The operations item 3 of F6.2 uses are homology operations on Ω²S^(2m+1) and on the extended powers D_(2,j).

**Witness.** F2.2 (lines 643–726) names Sq^i, P^i, β, A_p, A_* and the Adams towers and no operation on the homology of a loop space. F6.2 itself, lines 2029–2037, makes them targets of F6.2: "Construct its filtration, products, naturality and mod-p homology operations … not an assumed consequence of F2's cohomological Steenrod operations".

**Repair.** In the *Needs:* line write "F2.2's mod-p Steenrod operations and dual Steenrod algebra; the mod-p homology operations of Ω²S^(2m+1), at odd primes and at 2, are constructed here".

## R04 (P3) — Sampled sections with no locator at their claims

**Location and claim.** Each of these sections states theorems with no source locator in the section body.
- F3.3 (lines 1084–1131): BP⟨n⟩, E(n), K(n) and the Adams splitting have no citation at all.
- F4.4 (lines 1283–1316): convergence of the BP-based tower and the Atiyah–Hirzebruch spectral sequence have none.
- F5.2 (lines 1469–1514): the Landweber filtration theorem has none.
- F3.1 (lines 1021–1032): the existence of BP, BP_*=ℤ_(p)[v_i] and BP_*BP have none; the only locator is in a Check (line 1044).
- Outside the sample, the same holds for F2.1, F2.6, F4.6 ("Wilson's range theorems as cited source", no theorem number), F6.1 ("Bousfield 1979 is the cited source") and, in F6.3, the thick-subcategory and periodicity theorems.

**Witness.** A grep of lines 1084–1131, 1283–1316 and 1469–1514 for "Ravenel", "Theorem", "p. " finds no citation outside the Checks.

**Repair.** Add the locators at the claims. Those I read at the text:
- F3.1: Ravenel, Theorem 4.1.12, p. 110 (BP as a retract of MU_(p), `ravenel-green` line 6245), Theorem 4.1.19, p. 113 (line 6396), and Theorem A2.1.27 for the structure maps.
- F3.3: Ravenel, Section 4.2, p. 116, for BP⟨n⟩ with π_*=ℤ_(p)[v₁,…,v_n], the cofibration by v_n and E(n) as its v_n-telescope (lines 6523–6541); p. 118 for E(1) as a summand of p-local K-theory (line 6682); add a primary locator for the Adams splitting of ku_(p) and ko_(p).
- F4.4: Ravenel, Theorem 4.4.1, p. 132 (line 7556): the E₂-term and convergence for connective p-local X.
- F5.2: Ravenel, Section 4.2, p. 118 (lines 6640–6656), with the primary source of R05.
- For the others, the theorem numbers of the works already in the References.

## R05 (P3) — References omit three cited works; the exact functor theorem is cited through a survey only

**Location.**
- Lines 1609–1610 (F5.4): "Landweber's criterion, as surveyed in Ravenel, Section 4.2, p. 118".
- Lines 1209 and 1233–1234 (F4.2): Carrick–Davies–van Nigtevecht, Definitions 3.3 and 3.7; Bauer, Lemma 8.6 and Corollary 8.7.
- `## References` (lines 3453–3483) lists none of Landweber 1976, Carrick–Davies–van Nigtevecht or Bauer.

**Claim.** F5.2 and F5.4 prove Landweber's filtration and exact functor theorems; the only citation is a survey passage, which contains no proof. Two works cited by number in F4.2 and F4.5 have no References entry.

**Witness.** `ravenel-green` lines 6647–6673: the passage attributes both theorems to "[Lan76]" and proves neither. The cited statements of the other two exist: `cdvn-toda` lines 1190 and 1244 (Definitions 3.3, 3.7), `bauer-tmf` lines 921 and 929.

**Repair.** Add to the References, and cite at F5.2 and F5.4 with its theorem numbers, Landweber, *Homological properties of comodules over MU_*(MU) and BP_*(BP)*, Amer. J. Math. 98 (1976) (the manifest's settled key `landweber-1976`); add entries for Carrick–Davies–van Nigtevecht, *The descent spectral sequence for topological modular forms*, §3, and Bauer, *Computation of the homotopy of the spectrum tmf*, §8.

## Verified sound

**Headline theorems** (Summary and Scope). Stated in `Suggested.lean`: Lazard's height classification (F1.5), the invariant prime ideals of L (F5.3), the Lubin–Tate universal deformation (F5.5), with the one definition `IsStarIso` (real body). Named in the module docstring as not statable, each with its missing carrier: Quillen's theorem, π_*MO, Bousfield localization, the Conner–Floyd and graded Eilenberg–MacLane comparisons, the exact functor theorem, nilpotence, thick subcategories and periodicity, smashing, fracture, the K(n)-local completion formula, Tate vanishing, F6.6, F6.7. The carrier claims hold at the pin: `TauCeti/RingTheory/FormalGroup` has no comodules over the Lazard Hopf algebroid and no p-typical declarations, and no headline is proved there (a grep for `IsSepClosed`, `IsPrime` with `heightIdeal`, and Lubin–Tate finds only `Rigidity.lean` and module docstrings).

**Lean form.** `module`, `public import Mathlib` and four existing `TauCeti.*` modules; no `set_option`, no sorry'd data, no `variable` block, `theorem` only. The four elaborated signatures (the worker's `#check @name` output) agree binder by binder with README lines 520–525, 1545–1553, 1654–1657 and 1694–1704. One-tactic probe on a scratch copy with each `sorry` replaced by `simp`: "simp made no progress" on the first two theorems and unsolved goals on the third; none is padding. The file is unchanged since the previous review's `aesop` and `infer_instance` probes.

**Pinned declarations opened (41), Tau Ceti `RingTheory/FormalGroup/`.**
- `Logarithm/Basic.lean`: `invariantDifferential` (178, `invOfUnit F.derivZeroX 1`, that is F_X(0,T)⁻¹), `constantCoeff_invariantDifferential` (183), `map_invariantDifferential` (218), `subst_invariantDifferential_mul_pderiv` (236), `…_pderiv_one` (256, `[F.IsComm]`), `invariantDifferential_𝔾ₐ` (278), `_𝔾ₘ` (287), `coeff_log` (338; at n=0 the value is 0 by `0⁻¹=0`, as the docstring says), `coeff_one_log` (350), `derivative_log` (355), `subst_toPowerSeries_log` (386), `subst_toPowerSeries_eq_add_iff` (404, `∃ c, g = c • F.log`), `subst_exp_log` (464), `subst_log_exp` (469), `map_log` (489), `map_exp` (498), `toPowerSeries_eq_subst_exp` (527), `logIso` (560), `eq_logIso` (601), `log_𝔾ₐ`, `exp_𝔾ₐ`, `log_𝔾ₘ`, `exp_𝔾ₘ` (611–629).
- `Logarithm/Naturality.lean`: `subst_log` (62), `coeffOneEquiv` (117), `log_smul` (149), `exp_smul` (158). `Logarithm/Rescale.lean` exists.
- `Height/Ideal.lean`: `heightIdeal` (74), `heightIdeal_le_iff` (81), `heightIdeal_zero` (104), `heightIdeal_one` (190), `heightIdeal_eq_span` (195). `Height/Basic.lean`: `height` (200), `height_eq_top_iff` (203), `height_eq_natCast_iff` (211).
- `CoordinateChange/Lazard.lean`: `rightUnit` (130), `map_rightUnit` (136). `CoordinateChange/HopfAlgebroid.lean`: `map_rightUnit_heightIdeal` (390).
- `Rigidity.lean`: `FormalGroupIso.eq_of_map_residue_eq` (229; `IsLocalRing`, `IsHausdorff`, `CharP (ResidueField A) p`, both laws commutative, finite height of the source's reduction), matching README lines 190–194 and 1667–1675.
- `Logarithm/InfiniteHeight.lean`: `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (278).

**Cross-roadmap citations resolved (34).**
- GeneralizedCohomology at this head: G2.3 (791), G2.4 (824; see R01), G2.5 (882), G2.6 (1011), G2.7 (1043; HA for every abelian group A, so HF_p is its instance), G2.9 (1156), G2.11 (1275), G3.1 (2188), G3.3 (2284), G3.8 (2486), G3.9 (2606), G4.3 (3081), G4.5 (3147, with both quaternionic Euler classes at 3172–3194), G5.1 (3552), G5.3 (3624), G5.4 (3670; MO, MU, KU, KO, ku, ko), G5.5 (3824; MU→Hℤ at 4366), G5.7 (4466).
- AlgebraicTopology at this head: Stage 5 item 5 (1456), Stage 8 items 3 (2563), 7 (2760), 8 (2784), 10 (3072).
- TopologicalKTheory at this head: Conventions (236; β=[L]−1 with L the tautological O(−1), lines 15–17), T2 item 5 (943) with ψᵏ(β_n)=kⁿβ_n (989). CharacteristicClasses at this head: C3.4 (1733; `H*(BO(n);F2)=F2[w₁,…,w_n]`, line 1740), Conventions (64; c₁(O(−1))=−h, line 143).
- On main: RepresentationTheory/SchurWeyl Layers 0, 2, 5 (309, 340, 522); RepresentationTheory/CompactGroups Layers 1–2 (226, 248); DGAInfinity Layer 8 (520; matric and higher Massey products, 534); SymplecticGeometry/ConvexityToric T2 (73); EllipticCohomology E2, E4.A, E5 (486, 996, 1527); ProfiniteCohomology (closed subgroups and cohomological dimension, lines 9–10); ModularCurves, EllipticCurves and EnhancedDerivedSheaves exist. StringOrientation and TangentialBordism are not on main and are named only as consumers.

**Overlap and ownership.**
- The dropped anchor `#f65-local-group-actions-and-completion-comparisons` is cited only by GeneralizedCohomology line 46, through a link pinned to commit `d525554`, which does not move; this pull request rewrites that file and its head has no such link; #1187 is ordered after this pull request in the description. The section keeps its id "(F6.5)" in the heading, and lines 94–122 map its former sub-headings to G2.11. No change needed.
- #1808 and #1854 change this folder; the description's shared-folder block gives the order "this pull request → #1808 → #1854".
- `roadmaps grep` for the Lubin–Tate deformation theorem, thick subcategories, the exact functor theorem, invariant prime ideals, the nilpotence theorem, Brown–Peterson theory, the Steenrod algebra, the James construction and Toda brackets: ChromaticHomotopyTheory (#1643), StableHomotopyKTheoryPartII (#1733, citing §F6.3) and GeneralAlgebraicKTheoryPartII (#1742) consume; the only other claimants are #942 and #1287, settled in the description; #284 is an older HomotopySpheres head.

**Sources read at the text (seeded sample and others).**
- `ravenel-green`: Theorem 1.3.16 (1338–1347); Theorems 2.1.1 (2627), 2.2.3 (3146), 2.3.3 (3398), Definition 2.2.1 (3107); Theorem 3.1.1 (3673), Lemmas 3.1.3–3.1.9, Theorem 3.1.5, Corollary 3.1.10 (3718–3819); Theorem 4.1.6 (6062); Section 4.2, pp. 116–118 (6523–6680); Theorem 4.3.2 with proof, pp. 120–121 (6801–6830); Theorem 4.4.1 (7556); Theorem 6.2.10(ii), p. 204 (11048); Theorem A2.1.6 (19937), Lemma A2.1.9 (19984), Theorem A2.1.27(iv) (20395), Theorem A2.2.3 and (A2.2.4), p. 364 (20556–20571), Lemma A2.2.7, Definition A2.2.8, Example A2.2.10(ii) (20711–20762), Definition A2.2.11 and Theorem A2.2.12, p. 367 (20786–20822). All support the README as written.
- `hatcher-at`: Theorems 4L.12 (21777), 4L.13 (21864), 4L.16 (22197); the unnumbered theorem on p. 500 (21565); Theorem 4J.1 (20284); Proposition 3C.8 (12578).
- `guillou-weibel`: Definition 6.1, Theorem 6.2 (Borel), Proposition 6.4, Theorem 6.5 (Kudo) (lines 749–790). The README's restriction of Theorem 6.5 to the point site is accurate.
- `miller-cobordism`: Proposition 10.4 (1023), Theorem 11.2 (1142, p=2 only; Ravenel's 3.1.1 covers odd p), Theorems 12.1–12.4 (1226–1261), Chapter 2 Theorem 3.5 (1809) and Proposition 8.3 (2973).
- `quillen-fgl-bulletin`: Theorems 2 and 3 (72, 110).
- `ravenel-orange`: the operations P_t^s for t>s≥0, p. 63 (2471); Definition 6.2.3, p. 64 (2509); Theorem 6.2.4 and the type remark, p. 65 (2524–2530); Definition 6.2.5 and Lemma 6.2.6; Theorem 7.5.6, p. 87 (3284); Chapter 8, §§8.1–8.5 (contents, lines 61–69); Theorem C.2.2 (7506).
- `lubin-tate-1966`: ⋆-isomorphisms, p. 49; Proposition 1.1, p. 50; Proposition 2.4, p. 52; Proposition 2.6, p. 54; Theorem 3.1, p. 56; §§3.2–3.5, pp. 57–58.
- `cdvn-toda`: Definitions 3.3, 3.7, Lemma 3.9, Propositions 3.14–3.15, Theorem 3.16; signs only up to units (Definition 3.2), as the README says. `bauer-tmf`: 8.6, 8.7.
- `nikolaus-scholze` §I.3 (Theorem I.3.1, Lemma I.3.8) and Appendix A; `clausen-mathew` §2 (Proposition 2.3, Corollary 2.7); `kuhn-tate` Theorem 1.5; `hovey-sadofsky` Theorem 1.1.

**Adversarial pass.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1. `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ, 𝔾ₘ over 𝔽̄_p | heights ⊤ and 1; an iso preserves height | both sides false | — |
| 2. same, `IsSepClosed` dropped | 𝔾ₘ and a twist over 𝔽_p | heights 1=1; Frobenius is p and pu, u≠1, in End=ℤ_p | converse fails; hypothesis present | — |
| 3. `isPrime_and_invariant_iff_eq_heightIdeal` | I=⊥ | `heightIdeal p 0`=⊥ (pinned); L a domain; ⊥ invariant | both true | — |
| 4. same | I=⊤ | not prime; every height ideal lies in (p)+L_(>0), so ≠⊤ | both false | — |
| 5. same | (a₁₁) | η_R(a₁₁)=a₁₁+2b₁, 2b₁∉(a₁₁)L[b] | not invariant, not listed | — |
| 6. same, homogeneity dropped | (2,a₁₁−1) | quotient 𝔽₂[x₂,…]; η_R(a₁₁−1)=a₁₁−1+2b₁ | invariant prime outside the list: `hI` needed | — |
| 7. same, route, I∩ℤ=0 | log over L⊗ℚ | η_L↦inclusion, η_R↦augmentation ε; I·(L⊗ℚ)=ε(I)(L⊗ℚ)=0 | I=0 | — |
| 8. same, route, I⊇I_(p,∞) | L/I_(p,∞) | [p]=0; ε(I)=(p)↦0, so I·(L/I_∞)=0 | I=I_(p,∞) | — |
| 9. `IsStarIso` | [1+p] on 𝔾ₘ over ℤ_p | reduction x+x^p+x^(p+1)≠x | not ⋆ | — |
| 10. `lubinTate_universal_deformation` | h=1 | `Fin 0`: θ=algebraMap is the only map; x↦u⁻¹x: G(u⁻¹x,u⁻¹y)=u⁻¹(x+y+xy) | holds | — |
| 11. same | A=k | 𝔪=0, θ(t_i)=0 forced, Γ.map θ=F₀, e=X | holds | — |
| 12. same | `ker π = 𝔪` | π onto a field ⇒ ker π maximal ⇒ =𝔪 in a local ring | implied by the other hypotheses; harmless; the source's 𝔪⊇J·o | — |
| 13. same, vs source | Theorem 3.1 | residue field isomorphic to k (same sign as "R/J≅k" in Proposition 1.1; §2 has k=o/𝔪); R any ring with R/J≅k | matches | — |
| 14. same | θ among all R-algebra maps | θ(f)≡Σ_(|α|<N)c_αθ(t)^α mod 𝔪^N; A Hausdorff | θ fixed by θ(t_i); `∃!` well posed | — |
| 15. same, F₀=𝔾ₐ | 𝔽_p[ε] | laws X+Y+εC_(p^j): infinitely many classes vs p^(h−1) maps | `hF₀` needed | — |
| 16. F1.3 invariant differential | 𝔾ₘ | P(F)·F_X=(1+Y)/((1+X)(1+Y))=(1+X)⁻¹; with 1+T: (1+X)(1+Y)²≠1+X | inverse convention pinned | — |
| 17. F1.3 additive series | X² | (X+Y)²−X²−Y²=2XY | additive iff 2=0 | — |
| 18. F2.2 splitting | p=2 | ∏(1+t^d)/(1−t^(2d))=∏(1−t^d)⁻¹, d=2^i−1; |Q₁|=3, at p=3 |Q₁|=5 | holds | — |
| 19. F2.2 Kudo | |y|=2k | source total degree 2k(p−1)+2k+1=2kp+1; target |βP^kτy|=2kp+2 | degrees consistent; Guillou–Weibel 6.5(3) | — |
| 20. F2.2 differentials | d₂ at (1,2) | (3,3); stem 1→0 | holds | — |
| 21. F2.3 Hurewicz | i=1,…,6 | i+1=2,3,4,5,6,7: 2b₁,3b₂,2b₃,5b₄,b₅,7b₆ | matches 3.1.5(ii) | — |
| 22. F2.3 operations | s_(1)(x²) | coefficient of t₁ in (x+t₁x²)² is 2x³ | holds | — |
| 23. F3.1 generators | n=1 | ℓ₁=v₁/p and v₁/(p−p^p); ratio 1−p^(p−1); η_R(ℓ₁)=ℓ₁+t₁ from A2.1.27(iv) | holds | — |
| 24. F3.2 Honda law | n=1; v_n↦u | x^p=(1+x)^p−1 over 𝔽_p; u·x^(p^n) still height n | normalization pinned | R02 |
| 25. F3.3 Adams splitting | p=3 | ku: ℤ_(3)[v₁] in degrees 0,4,8,… and 2,6,…; ko: (p−3)/2=0, one summand, degrees ≡0 mod 4 | holds | R04 |
| 26. F3.3 | E(0) | ℤ_(p)[1/p]=ℚ in degree 0 | holds | — |
| 27. F4.1 | ⟨2,η,2⟩; ⟨η,η,2⟩ | η², indeterminacy 2π₂ˢ+π₂ˢ·2=0; η·η≠0 so empty | holds | — |
| 28. F4.2 | r=3, 4 | degree Σ|a_i|+1 and +2; ⟨2,η,2,η⟩: inner {η²}∌0 | holds | R05 |
| 29. F4.4 | fibre F of S_(p)→BP; S/p | π₀F=0 since π₁BP=0 and π₀ iso; Tor(ℤ/p,BP_*)=0 gives BP_*/p | holds | R04 |
| 30. F5.1 | η_R(v₂) | source formula at n=1, j=1: v₂+v₁t₁^p−v₁^p t₁ mod p | matches | — |
| 31. F5.2 | (p,v₁²); (p²) | factors Σ^(2p−2)A/I₂, A/I₂; A/I₁ twice | holds | R04 |
| 32. F5.4 | ℤ (additive); ℤ[u^±]; ℚ | v₁=0 on ℤ/p≠0; [p]≡u^(p−1)x^p; M/p=0 | fails / holds / holds | R05 |
| 33. F6.3 strong type | S/p odd; S/2 | (0,1): P¹=0 so Margolis homology =H≠0; at 2 the pairs t>s≥0, s+t≤2, ≠(0,2) are {(0,1)}, Sq¹ iso | not strong / strong | — |
| 34. F6.3 | staircase; Adams maps | Σ_i(a+1−i)(p−1)=(p−1)a(a+1)/2; 8=2·4·(2−1) | holds | — |
| 35. F6.3 coproduct side | n=2 | Δt₂ has t₁⊗t₁^p, Δζ₂ has ζ₁⊗ζ₁^p, Δξ₂ has ξ₁^p⊗ξ₁ | t_i↦ζ_i is the coalgebra map | — |
| 36. F6.2 slopes | p=2 | 2r·2^k−1=r·2^(k+1)−1 | equal, as stated | R03 |
| 37. F6.4 fracture | X=S_(p), n=1, p odd | ℚ×_(ℚ_p)ℤ_p=ℤ_(p) | holds | — |
| 38. F6.4 stabilizer | (p−1)∤m | H^i(S(m))=0 for i>m² (6.2.10(ii)) | d=m² | — |
| 39. F6.5 | trivial group; K(n), C_p; Hℤ | norm is the identity; x^(p^n)=0 in K(n)^*[[x]]/(v_n x^(p^n)); Ĥ^(2k)(C_p;ℤ)=ℤ/p | consistent | — |
| 40. F3.1 *Needs:* | G2.4 at head | "idempotent": 0 hits in lines 824–880; p-localization at 2606 | cited statement absent | R01 |
| 41. F1.5 *Needs:* | route | A2.2.12's proof uses A2.1.18, A2.1.25, A2.2.6; F3.1 needs F2.3 | forward edge F1→F3 | R02 |

## Not verifiable

- **Settled as uncertified, cited by locator only, not read:** Toda 1962, Chapter I (F4.1); Bousfield 1979, Theorem 6.6 (F2.2); Johnson–Wilson, Proposition 4.14, and Würgler, Theorem 2.16 and Remark 6.19 (F6.3); Symonds, §5 and §7 (F6.4); Hovey–Strickland, Proposition 7.10(e), and Greenlees–Sadofsky (F6.5); Devinatz–Hopkins–Smith and Hopkins–Smith (F6.2, F6.3); Thom 1954; James 1955; Wilson; Adams; Landweber–Ravenel–Stong; Quillen 1971; Landweber 1976.
- **Cached, not opened:** Lurie HTT and HA (the section lists of the References, consumed through G2.11) and Hovey's MString paper.
- **Ownership against open pull requests** was checked with `roadmaps grep` on the objects listed above, not exhaustively over all 448 heads.

## Source issues

- **Misprint** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source says the invariant primes of L are the I_n for 0<n≤∞; it should be 0≤n≤∞, the zero ideal being invariant and prime, as in Theorem 4.3.2(iv); affects nothing.
- **Gap** in ravenel-green at Theorems 1.3.16(iv), p. 17, and 4.3.2(iv), p. 121: the source says these are the only invariant prime ideals; it should restrict to homogeneous ideals, since (p,v₁−1) is invariant and prime, and the proof's lowest-degree step assumes homogeneity; affects a stated result.
- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says a_i in Ext^(1,2p^i−1) is represented by the i-th ξ at p=2; it should be the (i+1)-st, whose degree is 2^(i+1)−1; affects nothing.
- **Misprint** in ravenel-green at Definition A2.2.11, p. 367: the source says "for a natural number h" and then defines F_n by θ(v_n)=1; it should quantify over n; affects nothing.
