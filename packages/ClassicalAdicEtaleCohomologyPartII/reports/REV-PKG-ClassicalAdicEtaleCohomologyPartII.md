<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/971#issuecomment-6373830609 -->
Review (claude) of c41f55e

Verdict: needs changes

1. **F01** (P2) Layer 6 re-plans the proof of a supplier-owned theorem, and no target consumes it

   **Location.** `packages/ClassicalAdicEtaleCohomologyPartII/README.md` lines 1096–1222 (Layer 6). Line 11: "Layer 6 supplies the distinct module estimates and continuity criterion of the relative almost argument." Line 135: "Layer 7 uses the supplied proper smooth local systems and the relative estimates".

   **Claim.** Layer 6 says it owns module estimates that are separate from the supplied local-system theorem, and that Layer 7 consumes them.

   **Witness.** HodgeTateAndCanonicalSubgroups §7.6 (open head, README lines 2722, 2731) owns SW Theorem 10.5.1 "and proof, … pp. 82–88". Sections 6.1–6.7 are that proof's lemmas. No *Needs:* line outside Layer 6 cites any §6.x.

   **Repair.** The supporting facts first. Layer 6 restates SW Prop. 10.5.2, Lemmas 10.5.3, 10.5.6, 10.5.8–10.5.9 and Prop. 10.5.10. The only §6 references are at lines 1150–1214, inside Layer 6. §7.4 consumes HodgeTateAndCanonicalSubgroups §7.6 directly (line 1284). That roadmap precedes this one (ORDER line 232, against 282), so it cannot use Layer 6. The repair: delete Layer 6 (§§6.1–6.7 with their Examples and Dependencies). In `## Scope and ownership`, record one deferral: "Scholze–Weinstein Theorem 10.5.1, with the §10.5 module estimates of its proof, is owned by HodgeTateAndCanonicalSubgroups §7.6." Remove the Layer 6 sentences from the Summary (line 3), line 11, line 122, How to read (line 135), Layer 7 Dependencies ("Layer 6's module comparisons", line 1351) and Downstream consumers. Remove the `Suggested.lean` bullet "Relative almost finite presentation … (§§6.3–6.7)" (line 23) and the SW entry in `## References`, unless SW is still cited elsewhere. Drop `gap:valuation-properness`, which is used only in §6.4, and the "reduced power-bounded base-change theorem used in SW Lemma 10.5.9" clause of `gap:valuation-models`, which is used only in §6.3. Remove them from the README contracts and from the plan's `gaps` list if the intake allows removal. Tested: after the deletion, every *Needs:* line in §§7.1–7.7 still resolves, because none cites §6.x. If the author keeps Layer 6 instead, it must name an actual consumer. Its `gap:valuation-properness` must then state the missing results with hypotheses, for example: "a flat finite-type algebra over a valuation ring is finitely presented; an affine finitely presented scheme over a valuation ring satisfying the valuative criterion is finite". The present wording describes the gap by its use (line 78).

2. **F02** (P2) The scheme `Z` is printed as `ℤ` in the §7.2 and §7.7 statements

   **Location.** README line 1250: "analytification induces a fully faithful t-exact functor D_cᵇ(ℤ,ℤ/n)→D_zcᵇ(Z_an,ℤ/n)", and "for F∈D_cᵇ(ℤ,ℤ/n)". Line 1331: "is canonically the constant sheaf associated to Hᵐ_ét(ℤ,ℤ/n)", and "Hᵐ(ℤ,ℤ/n)". Line 1333: "the constant module Hᵐ(ℤ,ℤ/n)".

   **Claim.** The §7.2 functor and the §7.7 headline, as printed.

   **Witness.** For Z two points and m=0, the printed §7.7 gives the constant sheaf H⁰_ét(Spec ℤ,ℤ/n)=ℤ/n. Its own second Check gives Λ². The printed §7.2 source category consists of sheaves on Spec ℤ.

   **Repair.** In those five code spans, replace `ℤ` by `Z` in the space argument only: `D_cᵇ(Z,ℤ/n)` twice on line 1250, `Hᵐ_ét(Z,ℤ/n)` and `Hᵐ(Z,ℤ/n)` on line 1331, and `Hᵐ(Z,ℤ/n)` on line 1333. Tested: for Z two points and m=0 the corrected text gives (ℤ/n)², which matches the Check.

3. **F03** (P2) `gap:proper-generic-smoothness` asks for one open set that works for every proper map

   **Location.** README line 64, with the same text in the plan's `gaps`: "yielding a dense Zariski open U of a reduced target Y over which every proper map X→Y with smooth source in characteristic zero is smooth."

   **Claim.** As quoted: a single U for all proper maps with smooth source.

   **Witness.** Let Y be the closed unit disc over C. Each inclusion {a}→Y is proper with smooth source, and is smooth over U only if a∉U. Dense Zariski opens omit finitely many points; BH Theorem 2.29 (line 567) is per map.

   **Repair.** Restate the needs (README line 64 and `plan.json`): "For a proper map f:X→Y of rigid spaces over a characteristic-zero field, with X smooth and Y reduced, the maximal open subset of Y over which f is smooth is a dense Zariski open (BH Theorem 2.29, pp. 13–14), with the weakly Shilov generic-flatness inputs of BH Theorems 2.21–2.27." Tested on the disc: for each a, S_f=Y∖{a} is a dense Zariski open. §7.4 intersects finitely many such opens (line 1284), which is still dense. Note for the intake: the AdicSpacesPartIIPartII design lists BH generic smoothness and generic flatness among its non-goals (design README line 13).

4. **F04** (P2) Two declared gaps are compound, and one requests compactifications that an earlier roadmap owns

   **Location.** README line 56 (`gap:valuation-models`: "finite formal quotients …, the reduced quotient and polystable rig-isomorphism zigzag of Z Theorem 4.4.1 and U Theorem 1.4"). Line 76 (`gap:valuation-coherent-duality`: "with finite-presentation compactification, proper adjunction, flat base change, amplitude [−d,0] …, flat canonical bottom sheaf and canonical-sheaf reflexivity").

   **Claim.** Each gap is one contract with one supplier section.

   **Witness.** `valuation-models` bundles five independent theorems, including U Theorem 1.4's uniformization. AdicCoefficientsAndComparisons (ORDER line 121) already proves that finitely presented compactifications exist and are strictly cofiltered (L2/fp-strict-cofiltered, README line 1114; Z Corollary 2.1.5).

   **Repair.** Split `valuation-models` into one slug per theorem, each with its own hypotheses: reduced cofinal models over a complete rank-one valuation ring (Z Theorem 2.7.1); refined algebraization; finite formal quotients with quasi-projective residue fibre; the uniformization zigzag (Z Theorem 4.4.1 from U Theorem 1.4); and, only if Layer 6 survives R01, reduced power-bounded base change. Split `valuation-coherent-duality` into (i) upper shriek over O_K/pⁿ with proper adjunction and flat base change, (ii) the amplitude [−d,0] for flat maps with fibres of dimension at most d, and (iii) canonical-sheaf reflexivity for geometrically reduced residue fibre. For compactifications, cite AdicCoefficientsAndComparisons L2 (`fpCompactificationLimit`, strict cofilteredness) in the SchemeAndStackFoundations contract paragraph and in the §0.3 and §1.1 *Needs:* lines. Use the same new slugs in README and `plan.json`.

5. **F05** (P2) `gap:proper-hyperdescent` asks an abstract supplier for geometric descent that earlier roadmaps already supply

   **Location.** README line 90: "(gap:proper-hyperdescent): Supply the enhanced realization and finite-degree truncation of proper cohomological hyperdescent for torsion étale complexes on rigid spaces". Line 92: "The geometric input is the proper-surjective descent used in BH Theorem 3.10".

   **Claim.** EnhancedDerivedSheaves §§0.3–0.4 is to supply proper hyperdescent on rigid spaces.

   **Witness.** DiamondEtaleCohomology (ORDER line 93) supplies the rigid–diamond étale comparison (C0.1, line 320), the embedding of D⁺ étale into v-sheaves (C0.23, line 607) and v-hyperdescent for every Λ (C2.10, line 890). Proper surjections are v-covers.

   **Repair.** In §7.4 *Needs:* (line 1294) and in the EnhancedDerivedSheaves contract paragraph, cite DiamondEtaleCohomology §§C0.1, C0.23 and C2.10 for residue characteristic p with p dividing n. Cite ClassicalAdicEtaleCohomology §8.4 for n invertible in O⁺, which covers every n when K has residue characteristic zero, since the plus rings contain O_K. Reduce the gap to the residual statement, "Hⁱ of the totalization of a cosimplicial object in D^{≥0} depends only on its restriction to Δ_{≤i+1}". Drop the gap entirely if a supplier already states that. Tested on the use in BH line 780: for fixed i only the levels X_{≤i+1} enter.

6. **F06** (P2) The §7.5 route and `gap:integral-toric-field-extension` apply a toric argument to singular affinoids

   **Location.** README line 1300: "The local toric covering and singular comparison beyond the smooth case are part of the nearby-cycle and scalar-extension contracts." Line 104: "with the finite Koszul cochain comparison for arbitrary affinoid charts."

   **Claim.** After the reduction to 𝔽_p on a proper finite cover, a local toric Koszul comparison is said to be available, and the contracts are said to cover the singular case.

   **Witness.** The finite cover from BH Proposition 3.6 can be singular, for example a proper nodal curve. Singular affinoids have no étale toric chart, hence no Koszul-computed perfectoid ℤ_p^d-torsor. Neither contract (lines 102, 104) covers field extension over singular affinoids.

   **Repair.** In §7.5, after reducing to 𝔽_p on a proper Y, choose a proper hypercover Y_•→Y by smooth proper spaces (AdicSpacesPartIIPartII RZ.5). Use proper hyperdescent (the citations of R05) and the i+1 truncation, and apply the toric comparison only to smooth affinoids. Restate the contract as: "for a smooth affinoid with an étale map to a torus and its pulled-back perfectoid toric tower, A_∞°⊗̂_{O_C}O_{C′}→(A_∞⊗̂_C C′)° is an almost isomorphism, compatible with the finite Koszul cochains". Delete the line-1300 sentence, and add RZ.5 and the hyperdescent citations to §7.5 *Needs:* (line 1310). Tested on the nodal proper curve: the hypercover terms are its normalization, which is smooth, and points. Each has toric charts.

7. **F07** (P3) Three locators point to the wrong item

   **Location.** Line 1284: "for ℓ≠p use ClassicalAdicEtaleCohomology §9.5's smooth proper prime-to-p local constancy". Line 971: "imported from ClassicalAdicEtaleCohomology §§8.4, 9.5". Line 179: "Lemmas 5.5.6–5.5.7".

   **Witness.** Parent §10.5 states the finite locally constant direct images for smooth proper maps; §9.5 is the trace. The field-fibre t_X is the first paragraph of parent §9.7. AC 5.5.7 is a Theorem (AC line 5569).

   **Repair.** Change these to "ClassicalAdicEtaleCohomology §10.5", "ClassicalAdicEtaleCohomology §§9.5, 9.7" and "AC Lemma 5.5.6 and Theorem 5.5.7".

8. **F08** (P3) Garbled contract substitutions, and contracts cited under the wrong names in proof routes

   **Location.** Lines 313, 351 (twice), 909, 1140, 1268 (twice), 1270 and 1300. Examples: "Use local altered uniformization the valuation-model contract:", and line 909 ends "the valuation-model contract is supplied by the valuation-model contract." Line 1156 cites "the valuation-properness and generic-smoothness contracts" for a valuation-ring criterion. Line 1284 cites "the valuation-properness and generic-smoothness contracts" for generic smoothness.

   **Witness.** In each case a cross-reference was replaced by "the … contract", which leaves the sentence ungrammatical or names a contract that the step does not use.

   **Repair.** Rewrite each phrase as "(… contract)". For example: "Use local altered uniformization (the valuation-model contract): …". Delete the last sentence of line 909. Line 1156 should end "is the valuation-properness contract". Line 1284 should read "Use proper generic smoothness (the generic-smoothness contract)".

9. **F09** (P3) *Needs:* lines repeat items and import blanket blocks

   **Location.** Lines 191, 269 and 345 list "SchemeAndStackFoundations §§2.18–2.21 and the valuation-duality contract" and then repeat it inside "§§0.6, 2.18–2.21 and the valuation-duality contract". Line 983 lists parent §9.5 twice, line 1294 lists the generic-smoothness contract twice, and line 1310 lists PadicHodgeTheory §2.7 twice. §§5.4, 5.5, 5.6, 7.4 and 7.6 import "ClassicalAdicEtaleCohomology §§7.1, 8.4, 9.5, 9.7 and 10.5" as one block.

   **Witness.** §5.6's statement and route use only the trace (parent §§9.5, 9.7) and the amplitude (§8.4), not §10.5 constructibility or the §7.1 field-pair comparison.

   **Repair.** Remove the duplicates. On each line, list only the parent sections that the statement or route uses.

10. **F10** (P3) Two-term complexes are written with their image as the target

   **Location.** Line 668: "`[O_C→(ζ_{pᵐ}−1)O_C]`; H⁰=0 and `H¹=O_C/(ζ_{pᵐ}−1)`". Line 1067: "The complex [ℤ_p→pℤ_p] has H¹=ℤ_p/p". Line 1090 is the same.

   **Witness.** Read literally, the map O_C→(ζ−1)O_C, or ℤ_p→pℤ_p, is multiplication onto the displayed submodule. It is surjective, so H¹=0, not the stated quotient.

   **Repair.** Write the differential, as line 667 does with `[O_C→⁰O_C]`: `[O_C →(ζ_{pᵐ}−1) O_C]` and `[ℤ_p →p ℤ_p]`.

11. **F11** (P3) `Suggested.lean` names the wrong missing carrier for §§3.1–3.7

   **Location.** `packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean` line 14: "it lacks completed product-polystable root stages and their natural module structures and projection traces."

   **Witness.** The pinned `AdicCompletion` has a ring structure (Mathlib/RingTheory/AdicCompletion/Algebra.lean line 97) and a module structure over the completed base (line 324). AInfCohomology AI.6.1 builds chart rings this way. Only tr_m⁺ needs the character decomposition.

   **Repair.** Replace the clause with: "it needs the integral projection trace tr_m⁺, which is defined through the character decomposition (a theorem), and the derived Hom duality is stated through that trace."

12. **F12** (P3) §5.7 does not say how its integral trace relates to the parent's

   **Location.** Line 1036: "compatible finite torsion traces define `t_{X,ℤ_p}:H²ᵈ(X_C,ℤ_p(d))→ℤ_p` by inverse limit".

   **Witness.** ClassicalAdicEtaleCohomology §9.7 constructs `IntegralSmoothProperTrace` from the same Z Definition 5.5.3, for smooth proper formal models. The finite-level compatibility with coefficient reduction is in the parent's §9.5.

   **Repair.** Add one clause to §5.7: "when X has a smooth proper formal model, t_{X,ℤ_p} is the parent's §9.7 integral trace on the geometric fibre; the variant here needs no model." Add ClassicalAdicEtaleCohomology §§9.5, 9.7 to §5.7 *Needs:* (line 1054).

13. **F13** (P3) §7.1 changes how BH's stratification is quantified

   **Location.** Line 1228: "Zariski-constructible when on every affinoid open it is finite locally constant on each stratum of some finite stratification by Zariski-locally closed rigid subspaces."

   **Witness.** BH Definition 3.1(3) (BH line 600) asks for one locally finite stratification of X. Affinoid strata need not have global Zariski closures (BH line 611). The two definitions agree only by BH Theorem 3.5 (§7.3).

   **Repair.** Use BH's global locally finite stratification in §7.1. In §7.3, add that the condition is equivalent to the affinoid-local one, by locality.

The package has 61 owned targets in eight layers, nine declared supplier gaps and a `Suggested.lean` with no declarations. The mathematics of the targets survives the computed pass below. The `Suggested.lean` decision is sound: no headline is statable at the pins (justified headline by headline under "Headlines and statability"). The blocking problems are ownership and contracts. Layer 6 re-plans the proof of a theorem that HodgeTateAndCanonicalSubgroups §7.6 owns, and nothing in this roadmap consumes it. Two target statements print the scheme `Z` as `ℤ`. Four declared gaps are misquantified, compound, already supplied, or ill-posed. Thirteen findings: six P2, seven P3. No P1.

## Verified sound

### Elaboration and the Lean form

- `lake env lean` on `packages/ClassicalAdicEtaleCohomologyPartII/Suggested.lean`, run from the content checkout at a4a8652e: exit 0 and no messages (7 s).
- The file has zero declarations. The `#check @` binder audit and the one-tactic padding probe are therefore vacuous: no declaration exists to lose a binder or to be padding.
- The form is correct: a single `import Mathlib`, no `set_option`, the title "…: target signatures", "The roadmap is README.md; this file is not the roadmap", 17 headline bullets each naming its missing carrier (R11 corrects one), and `namespace TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII`.

### Headlines and statability (each headline, with why it is not statable)

The pinned Tau Ceti has `TauCeti.AdicSpace` (TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean line 243) but no étale or pro-étale site of adic spaces, no formal schemes, no perfectoid spaces and no almost modules. A search of both pinned trees for these objects found none. Mathlib's `Scheme.smallEtaleTopology` (Mathlib/AlgebraicGeometry/Sites/Etale.lean line 50) applies to schemes only.

- §1.4 formal Hartogs and §1.7 coherent traces: no admissible formal schemes over O_K.
- §2.6 integral Faltings trace: no completed pro-étale O⁺.
- §3.10 polystable local duality: no ringed pro-étale sites or almost categories.
- §4.7 local almost Poincaré duality, §5.2 global almost duality: no almost categories and no pro-étale site.
- §§5.4, 5.5, 5.6, 5.8, 5.9: no rigid étale cohomology.
- §6.6: no strictly totally disconnected perfectoid spaces.
- §§7.2–7.7: no rigid étale sites.
- §3.7 root-algebra duality: the carriers are partly available (`MvPolynomial` quotients, `AdicCompletion`, `PadicComplexInt` at Mathlib/NumberTheory/Padics/Complex.lean line 251). Z Proposition 4.3.6 is a statement about the map induced by tr_m⁺, however, and defining tr_m⁺ requires the character decomposition. An abstract isomorphism R_m⁺≅RHom(R_m⁺,R⁺) would be a weakened substitute. The characteristic-p case (Z Theorem 4.3.2, Z line 2834) is the source's preliminary computation for the integral case, not an end theorem. So no statable headline is omitted, and nothing is forced through a stand-in.

### Dependency check (output)

```
depcheck: 27 roadmaps, 248 edges, 0 problem(s)
```

The merge order places this roadmap at line 282, after every supplier it cites. No UPWARD or CYCLE line.

### Sources: the seeded sample, read at the locators (15 of 15)

- 0.3 (AC line 5504, pp. 129–131): Definition 5.5.2, Theorem 5.5.5 (adjunction) and Lemma 5.5.6 (D⁻ against D⁺, on the target) support the statement; 5.5.7 is a Theorem (R07).
- 1.3 (Z line 964, p. 22): Definition 2.5.1 and Warning 2.5.2 are the kernel and its intersection caveat.
- 3.3 (Z lines 2536 and 2560, pp. 53–54): the decomposition and cosets are correct. The README rightly corrects the source's multiplication claim (Source issues).
- 3.4 (Z line 2629, pp. 52–57): Lemmas 4.2.13 and 4.2.23(1–4), Remark 4.2.24 and Corollaries 4.2.25–4.2.26 hold as stated. The README says almost finitely presented where the source proves finitely presented; that is weaker and therefore safe.
- 3.6 (Z lines 2827 and 2903, pp. 59–60): Definitions 4.3.1 and 4.3.3; tr_m(1)=1.
- 3.7 (Z lines 2834–2999, pp. 59–62): Theorem 4.3.2, Lemmas 4.3.4–4.3.5, Proposition 4.3.6 and Corollary 4.3.7. The README's bound on π corrects a source misprint.
- 4.2 (Z line 3227, p. 67): Lemma 4.4.3, rig-isomorphism of nice d-models.
- 4.3 (Z line 3219, p. 67): Definition 4.4.2. The README adds niceness, which Lemma 4.4.23 uses.
- 4.4 and 4.5 (Z lines 3251–3354, pp. 67–69): Definitions 4.4.4, 4.4.10, 4.4.12, 4.4.14; Remarks 4.4.5–4.4.9 and 4.4.13 (O_C central); Lemmas 4.4.11 and 4.4.15. No invertibility of |G| is used.
- 4.7 (Z lines 2318, 3188 and 3587, pp. 49, 66, 74): the README states the nice hypothesis that Theorem 4.4.24 omits.
- 5.3 (Z lines 3805–3830, pp. 78–79): Theorem 5.4.2 (geometrically connected) and Lemma 5.4.3.
- 5.5 (Z line 3877, p. 80): Theorem 5.4.5. The trace method uses a prime-to-p degree cover.
- 6.5 (SW line 3476, printed pp. 86–88): Lemma 10.5.6 has indices 0,…,(N+1)3^{N+1}, a page-r hypothesis and k≤N. Remark 10.5.7 distinguishes factorization from image.
- 7.2 (BH line 672, pp. 15–16): Proposition 3.7(1)–(3) in characteristic 0. Han Theorems 1.8 and 1.10(ii) (Han lines 196 and 226) and Han Proposition 4.2 (Han line 801) match.

No locator in the package was flagged as unverified; the author's report lists none.

### Library declarations opened at the pins

- `LinearMap.IsPerfPair`, Mathlib/LinearAlgebra/PerfectPairing/Basic.lean line 39: both maps bijective, no finiteness assumed.
- `Representation.invariants`, Mathlib/RepresentationTheory/Invariants.lean line 73: no finiteness assumed of G.
- `Scheme.smallEtaleTopology`, line 50 (above).
- `Representation.exists_common_fixed_vector_of_isPGroup` and `Representation.invariants_ne_bot_of_isPGroup`, TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean lines 151 and 158. Their binders are `[ExpChar k p] [FiniteDimensional k V]` (lines 118–119), `[Nontrivial V]` and `IsPGroup p G`; G need not be finite.
- `TauCeti.AdicSpace`, line 243 (above).
- `AdicCompletion`: ring at Algebra.lean line 97, module at line 324.

### Supplier citations resolved

Every cited section exists where it is cited. Roadmaps on main were read on main. ClassicalAdicEtaleCohomology, PadicHodgeTheory, HodgeTateAndCanonicalSubgroups, AInfCohomology, DiamondEtaleCohomology, DiamondsAndVStacks, ArithmeticGaloisDuality, DerivedDeRhamCohomology and ResolutionOfSingularitiesCharacteristicZero were read at their open heads. AdicSpacesPartIIPartII was read as its board design.

- Existence checked by heading:
  - PerfectoidSpaces P0.1–P0.13, P0.29, P3.11–P3.22, P5.9–P5.13.4, P6.5–P6.7, P6.15–P6.16
  - AdicSpacesPartIII F0.6–F0.8, R2.2–R2.8, R3.1–R3.8
  - AdicSpacesPartII R0.19–R0.20
  - SchemeAndStackFoundations 0.6, 0.8, 0.9, 0.21, 2.18–2.21
  - EnhancedDerivedSheaves 0.1–0.4, E1.1–E1.5, E2:towers.1
  - DerivedModuleAlgebra 0.2, 0.4, 0.8, 0.10–0.14, 1.T.1, 1.1–1.8, 1.E.1, S.1
  - DerivedDeRhamCohomology 1.22
  - AInfCohomology AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2
  - ArithmeticGaloisDuality D7.1–D7.3, R02.1.2–R02.2.3
  - DiamondsAndVStacks D1.1–D1.6, D1.9–D1.11
  - DiamondEtaleCohomology C1.7–C1.12
  - EtaleCohomologyFoundations G.1–G.3, F.0, F.3, 0.5–0.11
  - RigidAnalyticGeometry 1.1–1.2
  - ResolutionOfSingularitiesCharacteristicZero 7.5, 7.8
  - AdicSpacesPartIIPartII RZ.0–RZ.5
- Content read and found to support the citation:
  - parent §§1.5, 7.1, 8.4, 9.5, 9.6–9.7, 10.5, 11.1. The parent leaves p-torsion duality and residue-p base change to "another roadmap", so this Part II does not re-plan the parent.
  - PadicHodgeTheory §2.7 (including singular proper primitive comparison and integral perfectness) and §7.2
  - HodgeTateAndCanonicalSubgroups §§7.5–7.6
  - AInfCohomology AI.6.1 (one semistable block with p^q), which makes §3.1's multi-block extension a genuine variant
  - EtaleCohomologyFoundations F.3 (proper, plus field and trait only), so `gap:quasi-excellent-direct-images` is minimal
  - RigidAnalyticGeometry §1.1 (noetherian) and §1.2 (excellence)
  - ResolutionOfSingularitiesCharacteristicZero §7.8 `resolution_affinoid`
  - AdicSpacesPartIIPartII RZ.1 (no branched-cover theorem, so `gap:finite-branched-covers` is minimal) and RZ.5 (rigid resolution)
- Gaps: the nine README slugs equal the nine `plan.json` slugs.
  - `finite-branched-covers` matches Han Theorem 1.6 (Han line 134).
  - `general-nearby-coherence` matches AC Theorems 6.13.5–6.13.6 (AC line 7390). PadicHodgeTheory does not have it.
  - `quasi-excellent-direct-images` matches Han Proposition 4.2.
  - These three are precise and minimal. The other gaps are covered by R01 and R03–R06.

### Ownership and duplication

The `roadmaps grep` index covers main and 330 open heads, which include the sibling checkouts named in the brief. It was searched by object for: Zariski-constructible; Faltings trace, almost and mod-p Poincaré duality; polystable; almost coherent; almost finitely presented; formal dualizing complexes; Heuer Proposition 2.18; SW §10.5; proper base change.

- Owners found: HodgeTateAndCanonicalSubgroups §7.6 (R01) and AdicCoefficientsAndComparisons L2 (R04).
- DiamondEtaleCohomology C5.8 is restricted to quasi-pro-étale or prime-to-p coefficients, so §7.6 here is distinct.
- No other roadmap states Faltings traces, polystable duality, Zariski-constructible pushforward or base change, or Heuer's constant sheaf.
- No roadmap cites this one yet.

### Adversarial table

The table records values computed on both sides for every target, convention, gap and worked example.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: shift | ℙ¹; Λ[−2] against Λ[2] | H²(ℙ¹,Λ(1))→Λ needs Λ[−2]: H²(Λ[−2])=Λ, while Λ[2] has H^{−2}=Λ and H²=0 | holds | none |
| Conventions: dlog and a | one-torus | Φ=Sch∘j gives jΦ⁻¹=Sch⁻¹; source scaled by a gives a⁻¹dlog T | holds | none |
| Conventions: O_C/p against O_C/𝔪 | ε with v(ε)=v(p)/2 | ε·1≠0 in O_C/p; ε·1=0 in O_C/𝔪; (O_C/𝔪)^a=0 | holds | none |
| Conventions: two-point trace | p=2 | (1,1)↦2=0, (1,0)↦1 | holds | none |
| Conventions: ℚ_p(π), π²=p | p=2,3 | O_K/p=ℤ_p[π]/(π²): π≠0, π²=0; π↦0 in 𝔽_p | holds | none |
| Conventions: 2d−i in ℤ | i=2d+1 | −1 gives the zero group; ℕ-subtraction would give H⁰=𝔽_p≠0 | holds | none |
| 0.1 D_acoh | O_C/𝔪_C; O_C; ⊕̂_ℕO_C | honest sections k≠0, almost 0; one generator; mod ε it is ⊕(O_C/ε), not finitely generated | holds | none |
| 0.2 affine RHom | F=G=O_C; G=⊕_{k≥1}O_C[k] | O_C in degree 0; RHom(O_C,G)=G is unbounded below, so the (D⁻,D⁺) order is needed | holds | none |
| 0.3 almost duality | f=id, A=B=O_C^a/p; Y=T⊔T; smooth curve | 1↦1; counit (a,b)↦a+b; f^!O=Ω¹[1] in degree −1 | holds | R07 |
| 0.4 nearby complexes | Spf O_C; 2-torus; O_C⟨ε⟩/(ε²) | A=O_C^a, K=O_C^a/p; ranks 1,2,1; O⁺=O_C+Cε, so O⁺/p=O_C/p, ε acts by 0 | holds | none |
| 0.5 generic fibre | O^a; O^a/pⁿ; lattices O_C, ϖO_C | O_X; 0; both C | holds | none |
| 1.1 ω•_𝔛 | Spf O_K; O_K⟨T₁,T₂⟩; ℤ_p[pT,T²,T³]^∧ | [0,0]; generator dT₁∧dT₂ in degree −2; pℤ_p[T]⊂R⊂ℤ_p[T] gives the unit disc, x=pT≠0 with x²=xT²=xT³=0, depth 0, not CM | holds | none |
| 1.2 étale comparison | U=2T, p odd and p=2; n=1 | det 2 is a unit only for p odd (the Check is scoped to odd p); n=1 recovers the scheme complex | holds | none |
| 1.3 Glue | 𝔘=𝔛; 𝔘=∅; Spf O_K | F; j_*F_K, sections K; kernel of K⊕O_K→K is {(a,a)}, so (1,0) is excluded | holds | none |
| 1.4 Hartogs | ∅ in Spf O_C; uv=ϖ | ∅ is not dense, and C≠O_C; a dense open meets u=0 and v=0 | holds | none |
| 1.5 bottom trace | identity; two copies; split degree p | id; (1,0)↦1; Tr(1)=p≡0 mod p | holds | none |
| 1.6 s_𝔛 | point; torus; U=T⁻¹ | 1↦1; dlog U=−dlog T | holds | none |
| 1.7 coherent trace | S=Tʳ, r=p | Tr(dlog T)=Tr(r⁻¹f^*dlog S)=dlog S; Tr(f^*dlog S)=p·dlog S | holds | none |
| 2.1 torsion-free quotient | O_C⊕O_C/p²; p=2 | gives O_C; 2x²=0 in a 2-torsion-free module, so x²=0 | holds | none |
| 2.2 Φⁿ | Spf O_C, n=1; smooth model | Ω̂¹=0; cokernel of the image killed by a | holds | none |
| 2.3 Ψ | Spf O_C; torus; d=1 | Ψ⁰=id; character↦dlog T (not a⁻¹dlog T); ranks 1,1,0 | holds | none |
| 2.4 nice | O_C⟨T⟩; uv=ϖ; t²=ϖ | nice; nice but not smooth; k[t]/t² is nonreduced, not nice, generic fibre C×C | holds | none |
| 2.5 rational normalization | torus; S=Tʳ; d=0 | jΦ⁻¹Sch(dlog T)=dlog T; r and 1 as in 1.7; 1↦1 | holds | none |
| 2.6 Faltings traces | Spf O_C; smooth curve | identity in degree 0; ω•₀(−1)[−2]=Ω¹(−1)[−1], only H¹ | holds | none |
| 2.7 pseudo-finite | identity; blow-up; positive-dimensional generic fibre | yes; generic degree 1 with exceptional ℙ¹; not rig-finite | holds | none |
| 2.8 finite traces | split degree p; degree 1; degrees r,s | Tr(1)=0 mod p, Tr(e₁)=1; id; e₁↦1 by both routes | holds | none |
| 2.9 compatibility | identity; split two-cover; degree p | 1↦1; (x,y)↦x+y; 1↦p | holds | none |
| 3.1 polystable charts | uv=ϖ; unit parameters; uv=0 | d=1 with two branches; a torus; ∂_u=v, ∂_v=u vanish at 0, so excluded | holds | none |
| 3.2 root towers | n_i=0; one-torus; p=2 node, m=1 | Γ=1; ℤ_p(1); k[x,y]/(x²,y²,xy) has length 3 against |Γ₁|=2 | holds | none |
| 3.3 characters | uv=ϖ=p; unit ϖ | V_uV_v=pV₀≠V₀; unit factors | holds (corrects the source) | none |
| 3.4 Koszul | Γ=ℤ_p trivial; order p^m; Γ=1 | H⁰=H¹=O_C; H⁰=0 and H¹=O_C/(ζ_{p^m}−1) with the multiplication differential; H⁰ only | holds | R10 |
| 3.5 décalage | trivial torus; O_C | ranks 1,1; O_C/torsion=O_C against O_C/a | holds | none |
| 3.6 tr_m | tr(1); T^{1/p^m}; T | 1 (the algebra trace would give p^m=0); 0; T | holds | none |
| 3.7 root duality | m=0; char-2 node; torus p=2 | r↦(s↦rs); A·x≅A/(v) with dual Ann(v)=(u); Gram matrix diag(1,T), det T a unit | holds | R11 |
| 3.8 tr_Γ | Γ=ℤ_p; Γ=1; swapped basis | generator↦1; id; det −1 | holds | none |
| 3.9 cochain duality | d=0; Γ=ℤ_p; χ against −χ | b↦b; degrees 0,1 into 1; the trace kills nonintegral cosets | holds | none |
| 3.10 local duality | point; curve; 2-torus | unit; ω(−1)[−1] and ω₀(−1)[−1]; pairs 0↔2 and 1↔1, swap gives −1 | holds | none |
| 4.1 β perfect | Spf O_C; d=1; 1-dimensional space | multiplication perfect; D=Ω¹/p(−1)[−1]; IsPerfPair with both adjoints 1 | holds | none |
| 4.2 rig-iso descent | id; blow-up; point | same adjoint; uses Rf_*; 1↦1 | holds | none |
| 4.3 good quotient | G=1; G×𝔛 with |G|=p; trivial C₂ action | id; trivial torsor; fibre count 1≠2, so excluded | holds | none |
| 4.4 hG, h_G | C_p on O_C/p; O[S₃]; C₃ over 𝔽₂ | H¹=O_C/p (differentials g−1=0, N=p=0); Shapiro gives M; 3=1 | holds | none |
| 4.5 pushforward | G=1; C_p; S₃ | id; H¹ persists; (gh)⁻¹=h⁻¹g⁻¹ | holds | none |
| 4.6 quotient descent | split C_p torsor M^p; S₃ | invariants are the diagonal M, coinvariants M; Tr(1,…,1)=0, Tr(e₁)=1 | holds | none |
| 4.7 local PD | point; uv=ϖ; t²=ϖ | id; nice; t²=0 with t≠0, so excluded | holds | none |
| 5.1 global trace | Spa C; two points at p=2; curve | id; (1,1)↦0; [−2] lands in H², [+2] in degree −2 | holds | none |
| 5.2 global almost PD | point; ℙ¹; two points | O_C/p; degrees 0,2 with trace 1; diag(1,1), total 2 | holds | none |
| 5.3 detection, top trace | zero map; identity; two points | kernel and cokernel O_C/p with 𝔪·1≠0; 0; kernel of dimension 1 | holds | R07 |
| 5.4 mod-p PD | d=0 two points; ℙ¹; char p ℙ¹ | diag(1,1); 1; H²(ℙ¹,𝔽_p)=coker(F−1 on H¹(O))=0 | holds | none |
| 5.5 local systems | rank 0; constant rank r; C₂ Jordan block | 0→0; identity r×r; degree-2 trace is 2=0, so odd degree is needed | holds | none |
| 5.6 ℤ/pⁿ | n=1; ℙ¹ with ℤ/p² | mod p; 0↔2 into Λ[−2]; Tor₁^{ℤ_p}(ℤ/pⁿ,𝔽_p)=𝔽_p against 0 over Λ_n | holds | R09 |
| 5.7 integral trace | Spa C; ℙ¹; ℤ_p/p | id; c₁↦1; (ℤ_p/p)[1/p]=0 | holds | R12 |
| 5.8 integral PD | ℙ¹; [ℤ_p→^pℤ_p]; point | into ℤ_p[−2]; H¹=ℤ_p/p, RHom gives ℤ_p/p from Ext¹; 1⊗1↦1 | holds | R10 |
| 5.9 rational PD | ℙ¹; ℤ_p/p; two points | (1); 0; diag(1,1) | holds | none |
| 6.1–6.7 | b dividing p; discs; T↦aU with a²=p; N=0,1,2; elementary divisors | Ann(b)=(p/b); the unit disc is not strictly contained in itself; Tᵏ↦0 for k≥2; 3, 18, 81; distance ≥1>1/2 | each holds | R01 (ownership) |
| 7.1 ZC | skyscraper; constant; ⊔ points with Λ[j] | ZC with non-qc complement; one stratum; locally but not globally bounded | holds | R13 |
| 7.2 algebraization | Spec A; skyscraper; Spec K | equivalence; algebraizes; (ℤ/n)^r in degree 0 | holds after R02 | R02 |
| 7.3 generators | point; point in a disc; Jordan block | one generator; i_*Λ; an extension of trivials | holds | none |
| 7.4 pushforward | id; point in a disc; nodal curve | same; R⁰=i_*Λ, R^{>0}=0; finitely many levels per i | holds | R05, R07 |
| 7.5 field extension | geometric point; ℙ¹; ℤ/p² | Λ→Λ; ranks 1 in degrees 0 and 2; generators kept | statement holds, route gap | R06 |
| 7.6 base change | g=id; ℙ¹ with n=p²; n=1; empty | id; H⁰=Λ, H²=Λ(−1); 0→0; 0=0 | holds | none |
| 7.7 Heuer | Z a point; two points; Y=ℙ¹ | Λ, and 0 in positive degrees; Λ² (the printed text gives ℤ/n); R²=0 against H²=Λ(−1) | holds after R02 | R02 |
| gap proper-generic-smoothness | closed disc, {a}↪Y | S_f=Y∖{a}; ∩_a S_f is not a Zariski open | literal reading false | R03 |
| gaps valuation-models, valuation-coherent-duality | count of deliverables | 5 and 7; compactifications already in AdicCoefficientsAndComparisons L2 | compound | R04 |
| gap proper-hyperdescent | residue characteristic p with p∣n; residue characteristic 0 | DiamondEtaleCohomology C0.1, C0.23, C2.10; parent §8.4 | already supplied | R05 |
| gap integral-toric-field-extension | nodal curve | no étale toric chart | ill-posed beyond smooth | R06 |
| Worked examples | elliptic curve; nodal curve | e∪f=−(f∪e), zero diagonal mod 2; ω•₀=ω₀[1]; levels ≤i+1 | holds | none |

## Not verifiable

- H (Heuer), Proposition 2.18, p. 279, used by §7.7: the text is paywalled and the manifest records it as uncertified. The statement follows from §7.6 applied to Z×Y→Y, so the mathematics was checked, but the locator was not.
- U Theorems 1.3–1.4: located (U lines 143 and 169) but not read in full. The form used in §4.7 was checked against Z Theorem 4.4.1, which was read.
- Supplier sections whose content was not read, only their existence and headings (list under "Supplier citations resolved"): PerfectoidSpaces, AdicSpacesPartII and III, DerivedModuleAlgebra, DerivedDeRhamCohomology, EnhancedDerivedSheaves (apart from E2.6), ArithmeticGaloisDuality and DiamondsAndVStacks.
- Ownership against open pull requests was checked through the index of all open heads. The sibling checkouts were not opened one by one.

## Source issues

- **Error** in Z at Lemma 4.2.15, p. 54 (and the multiplication sentence after (4.6), p. 53): the source says multiplication of weight lines gives isomorphisms onto the sum weight; it should be injective with image scaled by block-parameter powers, so for uv=ϖ the product is ϖ times the trivial line; affects a stated result.
- **Misprint** in Z at proof of Lemma 4.2.23, p. 55: the source says γ_i acts through γ_j(χ) with the j-th exponent and level; it should be γ_i(χ) with the i-th exponent and level; affects nothing.
- **Misprint** in Z at proof of Proposition 4.3.6, Case 2, p. 61: the source bounds π against the p^n-th root of ϖ, where n is the number of block variables; it should be the p^m-th root, m the root level; affects the proof.
- **Misprint** in Z at Theorem 4.4.24, p. 74: the source omits the reduced special fibre (niceness) needed to define Faltings' pairing; it should include it, as Theorem 4.1.2 on p. 49 and the section opening do; affects a stated result.
- **Misprint** in Z at proof of Theorem 4.4.24, Step 3, p. 74: the source calls the map from X′_i to X′ a good quotient; it should be the map from X′_i to X_i; affects nothing.
- **Misprint** in Z at Definition 5.2.1, p. 75: the source gives the global trace a target shifted by [2d]; it should be [−2d], as in Theorem 5.1.1 and Definition 5.2.3; affects nothing.
- **Misprint** in Z at Theorems 5.5.2, 5.5.4 and 5.5.6, pp. 81–83: the source writes the derived pairings as landing in the unshifted coefficient ring; they should land in the coefficient ring shifted by [−2d]; affects a stated result.
- **Misprint** in Z at Lemma 2.2.7(2), p. 13: the source says upper shriek sends bounded coherent complexes on the source to the target; it should send those on the target to the source; affects nothing.
- **Misprint** in AC at Theorem 5.5.5, p. 129: the source writes derived pushforward as running from the target's almost category to the source's; it should run from X to Y; affects nothing.
- **Misprint** in AC at Lemma 5.5.6, p. 130: the source places the comparison isomorphism in the almost category of X; both sides live on Y, so it should be Y's category; affects nothing.
- **Misprint** in AC at Lemma 4.9.7(2), p. 113: the source takes the first argument bounded below and the second bounded above; it should be first bounded above, second bounded below, as in part (1); affects a stated result.
- **Gap** in BH at proof of Lemma 3.25, p. 25: the source proves the local almost comparison for any affinoid using a perfectoid toric torsor; such torsors exist only over smooth affinoids with étale toric charts, so a prior reduction to smooth proper spaces is needed; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c41f55e", "job": "REV-PKG-ClassicalAdicEtaleCohomologyPartII", "model": "opus", "worker": "fable-rev31"} -->
