<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6390114596 -->
Review (claude) of 6280fea

Verdict: needs changes

1. **F01** (P1) The relative p-divisible comparison has no viable owner: §5.5 re-exports a gap whose supplier comes before the owners of its objects

   - **Location.** `README.md` line 62, `gap:relative-bt-comparison-and-constants`: "prove the natural p-divisible comparison T_pH⊗A_cris(R)→Hom(D(H)(A_cris(R)),A_cris(R)) becomes an isomorphism after t-inversion and that the φ-fixed Fil⁰ constants in A_cris(R)[1/t] are ℚ_p". §5.5 (line 1188) states the same comparison, and its proof is "Apply the relative-comparison supplier contract".
   - **Claim.** CrystallineCohomology §CR.7.1 supplies the comparison for p-divisible groups H; §5.5 is a target here.
   - **Witness.** ORDER.txt: CrystallineCohomology 22; AbelianSchemesAndArithmeticModuli 47 (owns BT groups, A4.5, and D(H), A4.CR.7.2); Part I 54 (T_pH, §R07.1.8). The supplier would have to consume two later roadmaps; §5.5 merely restates the contract.
   - **Repair.** Own the comparison here. §5.5 stays a target with a real route: build the map from T_pH = Hom(ℚ_p/ℤ_p, H) and D(ℚ_p/ℤ_p)(A_cris(R)) = A_cris(R), and get the inverse up to t from the Cartier-dual map (Kisin17 lines 455–462). Its *Needs:* line becomes AbelianSchemesAndArithmeticModuli §A4.CR.7.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.8 and §5.2. Shrink the gap to the ring statement (Fil⁰ A_cris(R)[1/t])^{φ=1} = ℚ_p for the normal geometric-cover rings of Kisin17 §1.1.15, with supplier PadicPeriodRings §4.3 (its fundamental identity for O_C, position 20) or CrystallineCohomology §CR.7.1. Then update line 17 of the scope and the §5.13 *Needs:* line. Test on the refuting case: for μ_{p∞} the generator of T_p goes to t times a unit, so the map is an isomorphism only after inverting t; for ℚ_p/ℤ_p the map is an isomorphism integrally. Both cases can be stated by owners at positions ≤ 54.

2. **F02** (P1) Constructions are said to be imported from ReductiveGroupsPartII §RG2.3.5, which does not state them

   - **Location.** Line 84: "paired trace/different lattices, and the type-A and Dᴴ scalar-enlargement constructions". Also the "Import …" sentences of §§3.15 and 3.16 (the paired chain; the duality (M^Γ)∨=(δ⁻¹M∨)^Γ), §3.17's proof, and line 86 (`gap:full-fixer-cutting-tensors`).
   - **Claim.** The supplier provides these objects; this roadmap only adds very-goodness.
   - **Witness.** ReductiveGroupsPartII §RG2.3.5 (at its open head) states GL/GSp chain stabilizers, fixer immersions, tame hyperspecial realization, and GO⁺ and quaternionic hyperspecial lattices. Its README has no scalar enlargement, no D^opp module and no different-twisted duality, and no other roadmap states them.
   - **Repair.** State them here as Layer 3 targets with KPZ26 locators:
     - (a) the type-A group G₁ = (G×G)∩GSp(W,ψ) on W = V⊕V̄ with ξ = (a,−a), and its self-dual indexed chain Λ_i⊕Λ_{−i}^♯ (KPZ26 §6.3.4, line 3115);
     - (b) the Dᴴ group G₁′ (KPZ26 §6.2.8, line 3040);
     - (c) the duality (M^Γ)^∨ = (δ⁻¹M^∨)^Γ, as a step inside §3.16's proof (KPZ26 line 2913).

     Alternatively, declare each as a gap on ReductiveGroupsPartII §RG2.3.5 with its own `needs`. Repoint §3.11's O_D-chain import to ReductiveGroupsPartII §RG2.2.4 (*division-algebra-building*). Remove "of §RG2.3.5" from `gap:full-fixer-cutting-tensors`, or move the enlargements into that gap. Test on the refuting case: in a segment with two lattices Λ₀ ⊊ Λ₁, the lattices Λ₀⊕Λ₀^♯ and Λ₁⊕Λ₁^♯ are incomparable, whereas Λ_i⊕Λ_{−i}^♯ is a chain whose ψ-dual has index −i.

3. **F03** (P2) PadicPeriodRings §3 is cited for Frobenius and filtrations it does not state; Frobenius on the relative A_cris(R) has no owner

   - **Location.** Line 68: "PadicPeriodRings §3 supplies its period-ring, Frobenius and filtration interfaces". §5.2's API also asserts compatibility "with θ, φ and divided powers".
   - **Claim.** These interfaces come from PadicPeriodRings §3.
   - **Witness.** PadicPeriodRings §3 builds the envelope, θ_cris and log[ε] for O_C only. Witt Frobenius and the B_cris filtration are §4.1, which is why CrystallineCohomology's README (line 9143) cites "§§3, 4.1". §PD.7 defines no Frobenius.
   - **Repair.** For O_C, cite "PadicPeriodRings §§3 and 4.1". In §5.2, construct φ on A_cris(R) with DerivedDeRhamCohomology §PD.7 `Crystalline.fontaineEnvelope_initial`, applied to W(R♭) →φ W(R♭) → A_cris(R). Since φ(x) = xᵖ + py and xᵖ = p!·γ_p(x), φ sends ker θ into the PD ideal. Define Fil^r as the closures of the PD powers of ker θ. Add both to §5.2's API and *Needs:*. Test: for R = W(k), whose cover gives O_C, the construction must agree with PadicPeriodRings §4.1's Frobenius through `Crystalline.fontaineEnvelope_periodPDEnvelope`.

4. **F04** (P2) Two SchemeAndStackFoundations contracts are stated in terms of this roadmap's Zink ring and of "… used here"

   - **Location.** Line 74, `gap:normal-base-integral-section-detection`: "…arising as a completed local ring of the finite-type local models here … deduce the corresponding coordinatewise p-divisibility criterion in Ŵ(R)". Line 76, `gap:tensor-isomorphism-flatness-descent`: "…for the tensor-isomorphism scheme over Ŵ(R_G) used here".
   - **Claim.** These are precise supplier contracts.
   - **Witness.** Ŵ(R) is this roadmap's §0.1 (line 7 owns "the Zink coefficient construction"). SchemeAndStackFoundations, on main at position 2, cannot state a contract about a later roadmap's ring or about "the local models here".
   - **Repair.** Restate both as self-contained foundations and keep the applications here:
     - (i) For a Noetherian normal complete local domain R, flat over a complete mixed-characteristic DVR with perfect residue field, an element s ∈ R[1/p] lies in R iff ξ(s) ∈ O_K for every continuous map ξ: R → O_K with K finite over the base. This is the statement KP18 uses (line 2176–2178, citing its reference [19], Prop. 7.3.6). Move the coordinatewise Ŵ(R) deduction (KP18 lines 2179–2184) into §2.6 as a proof step.
     - (ii) State, with its exact hypotheses, the flatness criterion KP18 uses in the proof of Corollary 3.2.11 (line 2185–2187, citing its reference [65], Thm. 4.1.2), for an affine finite-presentation scheme over a ring with a separating family of ring maps. Keep its application to Ŵ(R_G) in §2.6.

5. **F05** (P2) Four gap contracts are compound or do not state what is missing

   - **Location.** Lines 78, 88, 98, 112.
   - **Witness.** `formal-dvr-point-detection` names "the … statements used in Hoff Lemma 2.35 and Theorem 2.36" without stating them, and the lift in Hoff's Lemma 2.35 uses flatness and formal reducedness of the local model (Hoff23 line 1342). `scheme-local-model-geometry` lists seven outputs; `parahoric-disc-purity-and-components` four tasks.
   - **Repair.**
     - `formal-dvr-point-detection`: state that, for a reduced p-torsion-free complete Noetherian local O_Ĕ-algebra with residue field k, the maps to O_K (K/Ĕ finite) are jointly injective (Hoff23 lines 1371–1372). Add the T-adic separatedness used in §4.11. Move the local-model lifting step into §4.13, where it rests on the scheme-local-model contract.
     - `scheme-local-model-geometry`: split into one gap per KPZ26 theorem (3.2.15, 3.3.25, 4.1.6, 4.4.3), each with that theorem's hypotheses.
     - `parahoric-disc-purity-and-components`: split purity (exactly Anschuetz22 Prop. 10.3, line 1388: every torsor of a parahoric over O_E[[z]] minus the closed point extends) from the component reduction (KP18 (3.2.7)–(3.2.8)) and from the patching step.
     - `integral-hodge-realization-extension`: name the integral models (for example, the normalization of the closure in the Siegel model) and the exact tensors with their hypotheses. Such models consume this roadmap's §4.12 ("Downstream consumers"), so check that the contract is not circular.

6. **F06** (P3) Suggested.lean declares nothing: the acceptance test is empty (policy question for the maintainer)

   - **Location.** `Suggested.lean` lines 59–61.
   - **Claim.** No headline theorem is statable at the pins.
   - **Witness.** Each of the 21 headlines needs a carrier absent at the pins: p-divisible groups, Zink frames or displays, parahoric local models, Breuil–Kisin modules, crystalline representations, κ_G or G-isocrystal invariants (table below). Part I makes the same call.
   - **Repair.** Nothing in the package. The maintainer decides whether an empty acceptance test is acceptable, or whether this roadmap waits for Part I's carriers to reach Tau Ceti.

7. **F07** (P3) Docstring wording

   - **Location.** `Suggested.lean` line 6, "The roadmap is README.md; this file is not the roadmap."; line 56, "There are consequently no substitute scalar statements or admitted data definitions here."; lines 33, 35, 44, "Breuil--Kisin".
   - **Witness.** Line 6 is prescribed by the brief's form rule, so it is not a package defect; it is flagged because the no-process-narrative rule reads it as process wording. Line 56 describes the file's compliance, not mathematics.
   - **Repair.** Delete the sentence on line 56 and write "Breuil–Kisin". Keep line 6 unless the maintainer changes the form rule.

8. **F08** (P3) Line and section locators that point elsewhere

   - **Witness.** Each line number below was opened in the cached extraction; the cited item sits at the corrected line.
   - **Location and correction:**
     - §0.12: "KPZ26 line 2060" for §5.1.19 should be line 2282; "Hoff23 line 614" for §1.1 should be line 368.
     - §1.4: "KPZ26 line 2060" for §7.3.1(2) should be line 3790.
     - §1.5: "Hoff23 line 614" for Remark 2.37 should be line 1378.
     - §2.3: "KZ25 §3.2.3, p.23; KZ25 line 998": §3.2.3 is line 990 on p.22; the orbit-closure local model is §3.2.2, lines 984–989.
     - §3.10: "KPZ26 line 2356" should be lines 2412 (Lemma 5.3.7(b)) and 2439 (Remark 5.3.8).
     - §4.6: "KP18 line 2107" for §3.2.12 should be line 2189.
     - §4.7: "KPZ26 line 248" (the introduction) should be line 2347 (Definition 5.2.5).
     - §4.12: "KPZ26 line 2060" should be line 3191 (Theorem 7.1.3).
     - §5.9: "KZ25 line 998" for §3.4.1 should be lines 1115–1140.
     - §3.11: the O_D-chain stabilizers are at ReductiveGroupsPartII §RG2.2.4.
     - References line 1524: the citation resolver reports the backticked `sources.toml` as an unknown Lean name.
   - **Repair.** Replace the line numbers above and remove the backticks around `sources.toml`.

9. **F09** (P3) *Needs:* hygiene, unnumbered targets, an unused contract

   - **Witness.** Each item below was read in the README's *Needs:* lines and in the pinned Tau Ceti file.
   - **Location:**
     - `gap:full-fixer-cutting-tensors` appears in no *Needs:* line, although §2.1 (hypothesis), §§3.14, 3.15, 3.17 and §6.1 use it.
     - `gap:formal-dvr-point-detection` is missing from the *Needs:* of §§4.11 and 4.13, whose proofs use it.
     - `gap:integral-hodge-realization-extension` is missing from §5.15's *Needs:*.
     - Duplicated items: §1.7 (A4.CR.7.2 twice), §2.13 (RG2.3.5 twice), §5.5 (CR.7.1 twice), §6.2 (RG2.3.3 twice).
     - The J_b construction (line 520) and the ordinary normalization theorem (line 1405) have no numbered subsections, and other targets cite them only as "of Layer 2" and "in Layer 6".
     - The Tau Ceti contract (line 46) is consumed by no target, and it omits that `TauCeti.WittVector.continuous_frobenius` already needs `[CharP R p]` (`TauCeti/RingTheory/WittVector/Frobenius.lean` lines 60–65).
   - **Repair.** Name the gap slugs in those *Needs:* lines, remove the duplicates, give the two preamble targets numbered subsections (§2.0 and §6.0), and either cite the Tau Ceti declarations from §§0.2/0.5 with the `CharP` hypothesis or delete the contract.

10. **F10** (P3) "Corrected" used in object names, and a source "correction" that corrects nothing

   - **Location.** The §5.11 heading "Corrected equality of the horizontal and adapted loci"; "the corrected setup" (§§4.10, 4.11); "the corrected c" (§4.12); "corrected versal theorem" and "corrected very-good infinitesimal compatibility" (§6.6); §5.14: "the printed covariant Tate-module tensor notation is corrected to the linear dual".
   - **Witness.** Kisin17 (1.1.3) (lines 284–287) defines M^⊗ to include duals, so T_pG̃^⊗ = (T_pG̃^∨)^⊗ and GL(T_pG̃) = GL(T_pG̃^∨). There is no printed error to correct; plan.json E08 makes the same claim.
   - **Repair.** Name objects by their content: "Equality of the horizontal Fil⁰ locus and the adapted locus", "under (A)–(C)", "the canonical relative-frame c of §1.3". In §5.14, state the linear-dual convention plainly, and keep erratum history only next to the locators.

11. **F11** (P3) Ownership not stated against PELModuli §M2.15

   - **Location.** Scope and ownership (line 7).
   - **Witness.** PELModuli (open, position 131) §M2.15 defines `Display`, Zink's displays over W(R), and Zink's BT functor over complete Noetherian local rings with perfect residue field.
   - **Repair.** Add one scope sentence. PELModuli §M2.15 owns displays over W(R) and Zink's equivalence for them. This roadmap owns the Ŵ(R)-frame displays of §0.11 and the anti-equivalence of §0.13 for all p-divisible groups, and uses no comparison along Ŵ(R) → W(R).

12. **F12** (P3) §0.5 is narrower than its argument and than §0.2

   - **Location.** Line 203: "Over a perfect F̄_p-algebra R, …".
   - **Witness.** §0.2 covers every perfect F_p-algebra (Lau14 Lemma 2.4, p.2216). The V-from-F argument only uses that W(R) is p-torsion-free and that σ is bijective.
   - **Repair.** State §0.5 over perfect F_p-algebras and keep vanHoften24/Zhu17 as the F̄_p instances, or say why F̄_p is needed. Test: for R = F_p and M = ℤ_p with F = pσ = p, the construction gives V = 1.

13. **F13** (P3) Hypothesis precision in §§3.5 and 2.4

   - **Location.** §3.5: "both induced embeddings have the supplied good local-model properties" and "μ factors through G°". §2.4: "H¹(Spec𝔖\{(p,u)},𝒢)=1" as "the older KP18 setup".
   - **Witness.** KPZ26 Prop. 5.3.20 (lines 2667–2672) assumes only that the 𝒢⁰ embedding is good, and μ factors through G° automatically (lines 2663–2664). KP18 (3.2.3) (line 2073) assumes the vanishing for the neutral component G°.
   - **Repair.** In §3.5, drop the extra hypothesis; this is an unused-hypothesis note. In §2.4, write 𝒢° together with the component step (3.2.7)–(3.2.8).

Files reviewed: `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` (all 1537 lines), `Suggested.lean`, `metadata.toml`, `sources.toml`, with `design/plan.json` for the declared gaps and source issues. The mathematics of the README survived the adversarial pass: no false identity, sign or convention was found, and the 15 sampled locators support their statements. The blocking findings are about supply. One declared gap is assigned to a supplier that sits before the owners of its objects, and target §5.5 restates that gap (R01). Several constructions are said to be imported from ReductiveGroupsPartII §RG2.3.5, which does not state them (R02). One period-ring citation names the wrong section (R03), and five gap contracts are not self-contained or are compound (R04, R05). `Suggested.lean`'s claim that no headline is statable at the pins is correct, checked headline by headline below.

## Verified sound

### Elaboration and Lean checks

- `lake env lean` on `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean`, run from the content checkout at the pins (Mathlib `6b7abb3`, TauCeti `a91d3aa`): exit 0, no messages. There are no declarations, so there is no `sorry` warning and no `#check @name` comparison to make. The form is otherwise right: single `import Mathlib`, no `set_option`, namespace `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII`, title "…: target signatures".
- A scratch `#check` file (`import Mathlib`) elaborated all ten cited Mathlib declarations with the hypotheses the README states:
  - `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean` 52), `WittVector.frobenius` (`…/Frobenius.lean` 218);
  - `WittVector.frobeniusEquiv` (`…/Frobenius.lean` 283, with `[CharP R p] [PerfectRing R p]`);
  - `WittVector.verschiebung` (`…/Verschiebung.lean` 109, additive), `verschiebung_coeff_succ` (150), `verschiebung_injective` (154);
  - `WittVector.Isocrystal` (`…/Isocrystal.lean` 113; no finiteness, as the README says);
  - `DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean` 77) and `dpow_mul` (86, with x ∈ I);
  - `Module.Grassmannian`.
- Tau Ceti declarations, read at the pin (their object files are not built, so they were not elaborated): `TauCeti.WittVector.continuous_frobenius` (`TauCeti/RingTheory/WittVector/Frobenius.lean` 65), `continuous_frobeniusEquiv_symm` (79, perfect), `completeSpace_and_t2Space_adicTopology_span_p_teichmuller` (`…/Complete.lean` 215, perfect, ϖ-adically complete). All three match the README; R09 notes the `CharP` omission.

### Dependency check

```
depcheck: 34 roadmaps, 322 edges, 0 problem(s)
```

There are no UPWARD or CYCLE lines. The gaps are prose contracts, which the tool does not read; R01 and R04 are ordering defects hidden inside them.

### Headline theorems and statability (Suggested.lean docstring)

The docstring's claim is correct for every headline. No faithful statement exists from Mathlib/Tau Ceti carriers plus a few simple definitions, so there is no Lean statement to give. Evidence from greps over both pins:

- Absent from Mathlib and Tau Ceti: "p-divisible" / "BarsottiTate" (0 hits in each), "Breuil" (0), "Kottwitz" (0), "parahoric" / "Bruhat–Tits" / "Iwahori" (0 in Mathlib; the Tau Ceti hits are knot theory), weak admissibility (0 relevant), Zink ring or displays (0 relevant), affine Grassmannian or loop group (0).
- Present but insufficient:
  - Mathlib `WittVector`, `WittVector.Isocrystal`, `DividedPowers`, `Module.Grassmannian` (a functor, with no local models) and `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean` 75).
  - Tau Ceti `FiniteTypeCommHopfAlgCat` with `reductiveCommHopfAlgPropertyOver` (`TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean` 38) and `FiniteLocallyFreeCommAffineGroupSchemeCat` (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`).
  - Tau Ceti cocharacters exist only for diagonalizable groups (`TauCeti/Algebra/AlgebraicGroup/Cocharacter.lean`), and stabilizers only over fields.

A p-divisible-group carrier built on the finite locally free group schemes would re-plan Part I §§R07.1.5–R07.1.6, so it cannot be one of "a few simple definitions" here.

| # | Docstring headline | README | Carriers a faithful statement needs | At the pins | Verdict |
|---|---|---|---|---|---|
| 1 | Perfect-ring Dieudonné anti-equivalence | 0.2 | p-divisible groups over Spec R; finite projective W(R)-Dieudonné modules | Dieudonné side definable from `WittVector.frobeniusEquiv`; no BT carrier | not statable |
| 2 | Complete-local display anti-equivalence | 0.13 | Zink ring Ŵ(R) (needs the canonical W(k) section), frames, displays, p-divisible groups over R | none | not statable |
| 3 | Universal marked displays | 1.8 | displays over Ŵ(R_GL); marked deformation functor | none | not statable |
| 4 | Integral filtration and tilde tensor torsors | 2.4, 2.6 | integral fixers cut out by tensors, local models in Gr(d,Λ)_{O_E}, the tilde functor, tensor-isomorphism torsors | group schemes over rings and fppf torsors exist; no local models or tilde functor | not statable |
| 5 | Formal- and arithmetic-curve criteria | 3.7, 3.9 | good embeddings, completed local rings of M^loc, relative-frame c | none | not statable |
| 6 | Nonexceptional very-good chains | 3.13, 3.16 | Bruhat–Tits stabilizers, periodic chains, local models | none | not statable |
| 7 | Dᴴ PEL and central enlargement | 3.14, 3.17 | integral GO⁺/GU⁺ fixers, chains, very-goodness | GO over fields only | not statable |
| 8 | Wild type A and symplectic enlargement | 3.11, 3.15 | O_D-chains of Res GL_m(D), local models | none | not statable |
| 9 | Integral crystalline comparison and étale recognition | 4.4, 4.14, 5.14 | crystalline lattices, T_p and D(H) over Ŵ(O_K) | only B_dR⁺ (no A_cris/B_cris) | not statable |
| 10 | Versal adapted deformation | 4.11, 4.12 | marked p-divisible deformations, adaptedness, R_G | none | not statable |
| 11 | Universal parahoric displays | 4.13 | (𝒢,μ)-displays, parahorics, local model | none | not statable |
| 12 | Hyperspecial BK tensor frames | 5.1 | Kisin's functor 𝔐, crystalline lattices | reductive group schemes exist; no 𝔐 | not statable |
| 13 | Explicit hyperspecial lifts | 5.7 | height-one BK modules, BT realization, cocharacters of reductive W-groups | none | not statable |
| 14 | Frobenius-pullback integrality | 5.8 | p-divisible groups over smooth F̄_p-algebras, crystals with connection | none | not statable |
| 15 | Toral weak admissibility | 5.3 | G-isocrystals, J_δ as a ℚ_p-group, ν_δ, filtered isocrystals, weak admissibility | rational `Isocrystal` only, no filtration or slopes | not statable |
| 16 | Horizontal = adapted loci; smooth quotient | 5.10–5.12 | universal deformation ring, Gauss–Manin connection, Fil⁰ locus | none | not statable |
| 17 | Lattice specialization and Kottwitz equality | 5.16, 5.18 | κ_G, X_υ(b), BK lattices, isogenous BT groups | none | not statable |
| 18 | Admissible filtration to isogenous lift | 5.17 | admissibility, BT realization | none | not statable |
| 19 | Ordinary σ-conjugacy normalization | Layer 6 preamble | parahorics, Iwahori–Weyl group with length and σ, Adm(μ), B(G) | `CoxeterSystem` length only | not statable; a GL_n matrix version would be a stand-in |
| 20 | Central ordinary lift with J_b(ℚ_p) action | 6.4, 6.5 | BT groups over O_K, quasi-isogenies, J_b | none | not statable |
| 21 | Lift with specified Levi filtration | 6.6 | as row 10, plus Levi local models | none | not statable |

README targets not in the list (§§4.2, 5.13, 5.15, 5.19) are lemmas or interfaces and are not headlines; each would need crystalline representations or κ_G anyway. The only statable fact I found is the first sentence of §0.5 (F determines V on finite projective W(R)-modules over a perfect R). It is an interface lemma, not a headline, and adding it would be padding. No padding was found: the file has no declarations.

### Source sample (all 15 seeded targets; no locator was flagged unverified)

| Target | README locator | Read at | Verdict |
|---|---|---|---|
| 0.5 | vanHoften24 Ex. 2.2.10 p.14; Zhu17 proof of Prop. 3.11 | vanHoften24 lines 614–620; Zhu17 lines 2415–2432 (p.463: V := pF⁻¹ is regular, FV = VF = p, Gabber) | supported; both work over F̄_p (R12) |
| 2.5 | KP18 Lemma 3.2.9, (3.2.10) pp.172–173; Hoff23 Lemma 2.7 p.18 | KP18 lines 2139–2169; Hoff23 lines 876–892 (divided Frobenius of the Eisenstein value is a unit) | supported |
| 2.8 | Hoff23 Defs. 2.3, 2.11, Prop. 2.6, Rem. 2.9 pp.17–20 | Hoff23 lines 765–779 (weights (0,−1), scalars), 796–801, 814–850, 908–923, 939–950 | supported |
| 2.11 | KPZ26 Lemma 5.2.3 p.54 | lines 2341–2344 | supported |
| 2.13 | KPZ26 §5.2.4 p.54; §6.1.1 p.62 | lines 2351–2357, 2728–2732 | supported |
| 3.1 | KPZ26 Lemma 5.3.13 pp.57–58 | lines 2503–2543 | supported |
| 3.3 | KPZ26 proof of Prop. 5.3.11, (5.3.12)–(5.3.14) | lines 2461–2501, 2596–2610 | supported |
| 3.6 | KPZ26 Lemma 5.3.7(a) p.55 | lines 2407–2423 | supported |
| 3.9 | KPZ26 §5.3.17, Prop. 5.3.18 pp.60–61 | lines 2636–2656 | supported |
| 4.11 | KP18 Prop. 3.2.17 pp.175–177; KZ25 Prop. 3.2.7 | KP18 lines 2279–2341; KZ25 lines 1044–1071 | supported, including regularity of R_G[1/p], p-torsion-freeness and separatedness |
| 5.4 | Kisin17 §1.1.5–1.1.9 pp.7–9 | lines 303–385 | supported |
| 5.8 | Kisin17 §1.4.5, Lemma 1.4.6 pp.24–25 | lines 1068–1101 | supported |
| 5.9 | Zhu17 §3.2 pp.460–461; KZ25 §3.4.1 | Zhu17 lines 2314–2346; KZ25 lines 1137–1140 | supported; the README rightly refuses Zhu's simultaneous framing (Source issues); KZ25 line locator wrong (R08) |
| 5.10 | Kisin17 Errata E.1–E.3 p.96 | lines 4253–4274 | supported |
| 5.14 | Kisin17 Prop. 1.1.13, (1.1.14) pp.9–10 | lines 410–446 | supported; the "corrected" remark is unfounded (R10) |

I also checked every other line locator in the README against the extractions. All resolve to the cited item except those listed in R08. Lau14 Lemma 2.4 (p.2216, line 644) and Corollary 5.5 (p.2244, line 1741) also check.

### Supplier citations resolved

Roadmaps on main were checked on main; the others at their open heads.

- **Part I** (open, `34f4657`): §§R07.1.6–1.8, 1.22, R07.2.10–2.12, 2.27, R07.3.2–3.3, R07.4.1, 4.13, 4.16–4.21 and 4.25 all exist. R07.4.20 is stated for finite K/ℚ_p, so the perfect-residue gap is a real extension. R07.4.25 is "Kisin's for perfect k".
- **AbelianSchemesAndArithmeticModuli** §A4.CR.7.2 (line 2060). Every claim on README line 56 holds: contravariance; F = σ / pσ; D(G∨) ≅ D(G)∨(−1); a Hodge submodule of rank dim; Grothendieck–Messing with locally nilpotent divided powers.
- **CrystallineCohomology** §CR.7.1 (line 11178) and Layer CR.1 (line 602).
- **DerivedDeRhamCohomology** §PD.7 (line 2736); `Crystalline.fontaineEnvelope_periodPDEnvelope` is constructed at line 2849 (README only). PD.7 applies to any p-adically complete R in which p is not a unit, so it covers R̂̄.
- **PadicPeriodRings** §3 (line 334) exists; see R03.
- **SchemeAndStackFoundations** (main): §0.6 (678), §1.15 (2502), §2.3 (3330), §§4.1–4.4 (5066–5194), §§4.7–4.8 (5339, 5383), §4.12 (5613).
- **ModularCurves** (main): §0G (427), the relative Grassmannian of a finite locally free module.
- **ReductiveGroupsPartII** (open): §RG2.1.5 (2447), §RG2.3.3 (4152; Fix ∩ ker κ_G at 4342), §RG2.3.5 (4665), §RG2.3.7 (5202), §RG2.4.3 (5993), §RG2.2.4 (3616). Missing items: R02.
- **GeometricSatakeAndFusion** GS0: "Witt affine flags and components" (825), "Bounded admissible affine flag loci" (947).
- **VectorBundlesAndIsocrystals**: VB0 "Finite isocrystals…" (229); VB4 "Integral group torsors and Frobenius" (2294), which contains the torsor ↔ exact tensor functor equivalence for smooth G with connected fibres.
- **PadicHodgeTheory** §5.5 (1076): tensorIsomTorsor, B(G), ν_b, κ, perfect-residue admissibility, and the period-torsor class for weakly admissible (b,μ).
- **ShimuraVarieties** §7.0i (1869).
- **LubinTateFormalModulesAndQuasiCanonicalLifts**: LT.0–LT.6 (board design, accepted).

### Declared gaps

| Slug | Supplier (order) | Precise / minimal / declared in plan.json | Verdict |
|---|---|---|---|
| perfect-residue-bt-realization | Part I R07.4.20 (54) | yes / yes / yes | sound |
| relative-bt-comparison-and-constants | CrystallineCohomology (22) | supplier cannot state it; duplicated by §5.5 / – / yes | R01 |
| normal-base-integral-section-detection | SchemeAndStackFoundations §0.6 (main) | uses Ŵ(R) and "here" / – / yes | R04 |
| tensor-isomorphism-flatness-descent | SchemeAndStackFoundations §4.12 | "used here", Ŵ(R_G) / – / yes | R04 |
| formal-dvr-point-detection | SchemeAndStackFoundations §§4.7–4.8 | states nothing / – / yes | R05 |
| full-fixer-cutting-tensors | ReductiveGroupsPartII §RG2.3.5 (24) | cites enlargements §RG2.3.5 lacks; in no *Needs:* line / – / yes | R02, R09 |
| parahoric-disc-purity-and-components | ReductiveGroupsPartII §RG2.3.3 | compound / yes / yes | R05 |
| ordinary-levi-full-fixer | ReductiveGroupsPartII §RG2.3.3 | yes (KZ25 lines 1155–1165) / yes / yes | sound |
| scheme-local-model-geometry | GeometricSatakeAndFusion (149) | compound / yes / yes | R05 |
| integral-hodge-realization-extension | ShimuraVarieties §7.0i (118) | "specified integral models" vague / – / yes | R05 |

### Ownership against open work

Checked by object with `roadmaps grep` over main and the 338 open roadmap pull requests (index 2026-10-24T21:31Z) and over the board's packages:

- No other roadmap owns the Zink frame Ŵ(R), Dieudonné displays, very-good embeddings, adaptedness or the KPZ26 scalar enlargements, so this roadmap is their owner.
- PELModuli §M2.15 owns displays over W(R) (R11).
- BunGAndNewtonStrata (position 240) uses J_b later, so owning J_b here is right.
- LubinTate LT.3 deforms formal O-modules, a different object.
- No roadmap cites this one yet.

### Shape

Headings follow upstream order. Every layer ends with Examples and Dependencies. Every definition and construction has an API list and at least three Checks (counted for 0.1, 0.3, 0.4, 0.6–0.8, 0.10–0.12, 1.1–1.5, 2.1–2.3, 2.7–2.10, 2.13, 4.6, 4.9, 5.2, 5.4, 5.7, 5.9, 5.10, 5.13, 5.16, 5.17, 6.1, 6.3, the J_b preamble and the normalization). There are no LaTeX delimiters and no pull-request numbers. All 12 cited works are in `sources.toml`: 11 certified, plus RZ96, which is settled as uncertified.

### Adversarial table (every convention and target; values computed here)

| Statement | Instance | Computed values (README / independent) | Result | Change |
|---|---|---|---|---|
| D(H) normalisation | ℚ_p/ℤ_p; μ_{p∞} | F=σ, Fil¹=0; F=pσ, Fil¹=D / A4.CR.7.2 Checks give the same; rank Fil¹ = dim H = 0, 1 | agree | – |
| Tate twist, D(H*)=D(H)∨(−1) | H=ℚ_p/ℤ_p | D(H)∨ has F=σ; twist (−1) gives pσ and moves the jump 0→1, which is D(μ_{p∞}) | agree | – |
| L=Hom(T_pH,ℤ_p)=T_p(H*)(−1) | μ_{p∞} | ℤ_p(1)∨=ℤ_p(−1); T_p(ℚ_p/ℤ_p)(−1)=ℤ_p(−1) | agree | – |
| μ₀, υ₀ | GL₂, F=diag(p,1)σ | ker(F mod p)=ke₁; μ₀=diag(z⁻¹,1); p^{υ₀}=diag(p,1)=b | agree | – |
| first-order quotients | O_E, p=aπ_E² | O_E/(π_E²) with π_E≠0; O_E/(π_E)=k with π_E=0 | agree | – |
| right action | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | gh=[[2,1],[1,1]], hg=[[1,1],[1,2]]; D(q_h∘q_g)=gh; T_p gives hᵗgᵗ=(gh)ᵗ | agree | – |
| Kottwitz sign | G_m, g=p on L | pL, Tate lattice p⁻¹T_pH, crystal pW: κ=1 at both ends; a G(W)-valued g₀ would give 0 | agree | – |
| mixed tensors | rank 2, c=1+εE₂₁ | c·id·c⁻¹=id; E₁₁ ↦ E₁₁+εE₂₁ | agree | – |
| p>2 | p=2 | Zink log coordinates need p>2 (KPZ26 lines 2081, 3804) | consistent | – |
| J_b | G_m, b=p; GL₂, b=diag(p,1); rank 0 | σ(g)=g gives ℚ_p^× ⊋ ℤ_p^×; pσ(x)=x forces v(x)=v(x)+1, so x=0, and likewise y=0; trivial group | agree (KZ25 line 1183) | – |
| normalization | GL₂, μ=(1,0) | ℓ(t_μ)=1, ℓ(t_{2μ})=2: σ-straight; ν_ord=(1,0) ≠ (½,½); torus ℓ≡0 | agree | – |
| 0.1 | k; k[ε]; W(k) | Ŵ(k)=W(k), Î=pW(k); (ε,ε,…) excluded since m²=0 makes null sequences eventually 0; W(k) has no section k→W(k) | agree (KPZ26 lines 2063–2068) | – |
| 0.2 | k×k, ranks (2,1) | locally constant rank; FV=p on each component | agree (Lau14 line 641) | – |
| 0.3 | W(k)[[u]], I=(p) | φ₁(pu)=uᵖ; φ(pu)=puᵖ=pφ₁(pu); (p) ⊂ Jac=(p,u) | agree | – |
| 0.4 | b=0; k[ε]→k | Î_{B/R}=Î_B; φ₁([ε])=0, φ([ε])=0 | agree (KPZ26 line 2096) | – |
| 0.5 | F̄_p, rank 1, F=pσ, σ, p²σ | V=σ⁻¹; V=pσ⁻¹; p²σ fails pM⊂F(σ*M), giving V=p⁻¹σ⁻¹ | agree | R12 |
| 0.6 | d=0, d=h; M₁=Se₁⊕Ie₂ | M₁=IM; M₁=M; e₁↦e₂ leaves M₁ iff 1∉I | agree | – |
| 0.7 | B=R; k[ε]→k | absolute frame; φ₁ kills [ε] | agree | – |
| 0.8 | j∘f̃=φ*(f)∘j, j=diag(1,p) | a=φ(A), b=pφ(B), c=φ₁(C), d=φ(D); Vx ↦ x vs φ(Vx)=px | agree ((5.1.3), line 2124) | – |
| 0.9 | S→S′→S″ strict | blocks agree via α∘φ₁=φ₁′∘α | agree | – |
| 0.10 | d=0; d=h; W(k) rank 1 | j=p; j=1; ⊗k gives the zero map; φ₁(p)=1 since p=V(1) | agree | – |
| 0.11 | ℚ_p/ℤ_p; μ_{p∞} | M₁=pM, Φ₁(px)=σx, Φ=σ; M₁=M, Φ=pσ; ranks 0, 1 | agree | – |
| 0.12 | R→R/m³→R/m² | strict composite; cocycle of (5.1.4) | agree | R08 |
| 0.13 | ℚ_p/ℤ_p, μ_{p∞} | (W,pW,σ) and (W,W,pσ); a map H→H′ gives D(H′)→D(H) | agree | – |
| 1.1 | h=1; h=2,d=1 | d(h−d)=0 gives O_F; =1 gives O_F[[t]] | agree | – |
| 1.2 | I=I′; I⊂I′⊂I″ | identity; transitivity | agree | – |
| 1.3 | Z=Vε | lower-left ε; c⁻¹=1−εE₂₁ since (εE₂₁)²=0 | agree | – |
| 1.4 | A=O_K | pⁿŴ(A) proper with zero intersection; Ŵ(A)[1/p] p-adically complete and separated (KPZ26 lines 3799–3801) | agree | R08 |
| 1.5 | c=1+εE₂₁ | Ψ=Ψ₀(1−εE₂₁) gives Ψc=Ψ₀ | agree | – |
| 1.6 | KP18 Lemma 3.2.13 | the convergent correction sum fixes Frobenius-invariant t | agree | – |
| 1.7 | (2)⊂ℤ/4 | canonical PD not nilpotent, so excluded | agree | – |
| 1.8 | h=2, d=1 | tangent dim 1 = rel. dim R_GL | agree | – |
| 2.1 | ∅; E₁₁; id∈Λ⊗Λ∨ | fixer GL; diagonal torus; all of GL; reading Λ∨ as Λ gives O₂ | agree | – |
| 2.2 | Fil¹=0, full, split | E·D_𝔖; D_𝔖; 𝔖e₁⊕E𝔖e₂ | agree | – |
| 2.3 | GL | R_G=R_E | agree | – |
| 2.4 | G_m | F=E^d𝔖, torsor trivial | agree | R13 |
| 2.5 | E=u−p, π=p | w₀(E([p]))=0; reduction −p=−V(1) so φ₁=−1 is a unit; φ(E([π]))=p·unit, not a unit | agree (Hoff23 line 882) | – |
| 2.6 | GL, ∅ | T trivial since M̃₁ is free | agree | – |
| 2.7 | E₁₁, c=1+εE₂₁ | E₁₁+εE₂₁ ≠ E₁₁; id fixed | agree | – |
| 2.8 | GL_h | ordinary (h,d) displays (Hoff23 Rem. 2.12) | agree | – |
| 2.9 | ∅; μ_{p∞} | any lift of type (h,d); Fil¹ full; a frame lifting identity is equivalent after a G(W) correction (KP18 lines 2293–2294) | agree | – |
| 2.10 | GL ∅; torus by E₁₁ | very good everywhere; very good by Cor. 5.3.3 | agree | – |
| 2.11 | torus by E₁₁, t=E₂₂ | t is G-fixed, hence horizontal | agree | – |
| 2.12 | O=W(F_{p²}) | φ acts on O, so φ*(s⊗1) ≠ s⊗1 in general | agree | – |
| 2.13 | one lattice; r=2 paired | tot=Λ₀; dual of Λ_i⊕Λ_{−i}^⊥ has index −i | agree | – |
| 3.1 | GL, Fil=0 | M_{S,1}=pM_S, free | agree | – |
| 3.2 | E₁₁, T⊂GL₂ | local model a point; ke₁ preserved | agree | – |
| 3.3 | frame (W[ε],(p,ε)) | φ(ε)=φ₁(ε)=0 (KPZ26 lines 2479–2482) | agree | – |
| 3.4 | G₁×G₂ | tensors plus projectors cut out the product | agree | – |
| 3.5 | GO ⊃ GO⁺ | closure of GO⁺ in GO is GO⁺; μ lies in G° automatically | agree | R13 |
| 3.6 | Λ₂=0 | trivial; in general c=c₁⊕c₂ | agree | – |
| 3.7 | node xy=0 | axes span the 2-dim T_x; no curve has derivative e₁+e₂ | agree (KPZ26 Def. 4.1.4) | – |
| 3.8 | T=GL₂∩C(E₁₁) | 1+εE₂₁ fails the equation by εE₂₁ | agree | – |
| 3.9 | Grassmannian | smooth, hence spanned | agree | – |
| 3.10 | Λ₁≅Λ₂ | reflection h×h⁻¹ cuts out the diagonal; unrelated pairs not covered (Rem. 5.3.8) | agree | R08 |
| 3.11 | D=K | usual chain; endomorphisms O_K | agree | R02 |
| 3.12 | {Λ₀,Λ₁} vs {Λ₁,p⁻¹Λ₀} | isomorphic by p-scaling | agree | – |
| 3.13 | GL_n tame | single lattice, empty family | agree | – |
| 3.14 | quaternions over ℚ₃, i²=−1, j²=3 | (−1,3)₃=−1, so a division algebra; i⊗1 and 1⊗i give Trd(i²)=−2 twice; reversed arguments give +2, −2; split case 1, −1 | agree | – |
| 3.15 | ξ=(a,−a); r=2 | τξ=−ξ; Λ₀⊕Λ₀^♯ and Λ₁⊕Λ₁^♯ incomparable | README right | R02 |
| 3.16 | F_i=ℚ_p | δ=1, ψ=ψ_i | agree | R02 |
| 3.17 | balanced weights | equal weight dimensions | agree | R02 |
| 4.1 | rank 1 | 𝔐(ℤ_p)=𝔖, exact on U | agree | – |
| 4.2 | G_m, χ_cyc | image ℤ_p^× ⊂ ker v_p; p not in the image | agree | – |
| 4.3 | GL | frame exists | agree | – |
| 4.4 | μ_{p∞} | L=ℤ_p(−1), D=W with pσ; identity tensor in Fil⁰ | agree | – |
| 4.5 | GL₂ ordinary | μ_y=diag(z,1) over K₀ | agree (KZ25 lines 1088–1093) | – |
| 4.6 | ∅ | the GL rigid lift | agree | R08 |
| 4.7 | GL | Assumption 2.28 automatic | agree | R08 |
| 4.8 | GL, h=2 | lifts form an O_K-module of rank 1 | agree | – |
| 4.9 | O_K×_kO_K | a+bT ↦ (a, a+bπ) covers all x≡y mod π; (0,1) excluded | agree | – |
| 4.10 | ordinary ht 2 + projector | rank 1 → 0 = dim G/(G∩P); ε ↦ pⁿε injective on O_K[ε], zero on k[ε] | agree (KP18 lines 2259–2277) | – |
| 4.11 | GL | R_G=R_E | agree | – |
| 4.12 | GL | (C) vacuous | agree | R08 |
| 4.13 | GL | Hoff23 Thm. 1.28 | agree | – |
| 4.14 | KZ25 Prop. 3.3.4 | the fixed integral type is needed (Source issues) | README hypothesis correct | – |
| 5.1 | disconnected 𝒢 over F_q | H¹(F_q, ℤ/2)=ℤ/2≠0, so "connected" is needed | agree | – |
| 5.2 | R=W(k) | cover completes to O_C, so A_cris(O_C) ≠ W(k) | agree | R03 |
| 5.3 | G_m, δ=p | ν_δ=1, μ_T=z⁻¹ averages to −1=ν_δ⁻¹; the inverse gives jump 1, so t_H=t_N=1 | agree | – |
| 5.4 | μ_{p∞} | T_pH∨=ℤ_p(−1) | agree | – |
| 5.5 | ℚ_p/ℤ_p; μ_{p∞} | isomorphism integrally; isomorphism only after inverting t | true | R01 |
| 5.6 | b=diag(p,1), b′=diag(1,p) | h=1; b′ has filtration ke₂ and υ₀′=diag(1,p) | agree | – |
| 5.7 | E=u−p | μ_{p∞}: c=p/E(0)=−1, Frobenius −E(u), value p at 0; ℚ_p/ℤ_p: 1; μ₀(p) instead gives −p at 0 | agree (Kisin17 lines 433–446) | – |
| 5.8 | G_m | g⁻¹dg=dlog g becomes integral after σⁿ | agree | – |
| 5.9 | b=1, p, diag(1,p), μ=diag(z,1) | 0; full; ke₂ ≠ ke₁; integral automorphisms are diagonal and preserve ke₂ | README right | – |
| 5.10 | no tensors | A′_G=A | agree | – |
| 5.11 | GL | trivial | agree | R10 |
| 5.12 | GL | R_G=R, dim d(h−d)=dim G/P | agree | – |
| 5.13 | disconnected base | types differ per component | agree | – |
| 5.14 | G_m | – | agree | R10 |
| 5.15 | polarization tensor | interface only | – | R05 |
| 5.16 | G_m, g=p; gh | g₀=p, valuation 1; same coset | agree | – |
| 5.17 | reference filtration | identity quasi-isogeny | agree | – |
| 5.18 | G_m, g=p | κ(g₀)=1=κ(g); p ∈ G(W)p^{υ₀}G(W) | agree | – |
| 5.19 | det: GL₂→G_m | f(g)=f(g₀) | agree | – |
| 6.1 | GL₂ | M=T, slopes 0 and 1; supersingular is not ordinary | agree | – |
| 6.2 | GL₂ | λ̃=diag(z,1) central in T, defined over K₀ | agree | – |
| 6.3 | E(0)=ap | c_E=E(u)/a with c_E(0)=p; E(u) alone gives ap | agree (Zhou20 line 613) | – |
| 6.4 | μ⊕ℚ_p/ℤ_p over W | the canonical lift | agree | – |
| 6.5 | p ∈ J_b(ℚ_p) | degree p², height 2; p⁻¹ not integral | agree | – |
| 6.6 | M=G | M-adapted = G-adapted | agree | – |

The Worked examples (lines 1512–1520) recompute to the same values as the rows for 1.3, 2.7, 5.7, 5.18, 6.3 and 6.5.

## Not verifiable

- RZ96, Proposition 1.21: uncertified, cited by locator only, a settled entry. Its use in §5.3 was checked through Kisin17 line 1455.
- The three Tau Ceti Witt-vector declarations were read at the pin but not elaborated: their object files are not built, and `Suggested.lean` does not import them.
- Anschuetz22 was read at §10 and Proposition 10.3 only (lines 1345–1391). Wintenberger97 Proposition 4.5.3 and KPZ26 §§3–4 were checked only at the cited lines; none of these is in the sample.

## Source issues

- **Gap** in KPZ26 at proof of Corollary 6.3.5, p.71: the source chooses each Λ_i⊕Λ̄_i self-dual and calls the result a lattice chain; it should pair Λ_i with the ψ-dual of Λ_{−i}, since self-dual members of a segment with two or more lattices are incomparable; affects the proof.
- **Gap** in Zhu17 at §3.2, p.461: the source fixes any b in the double coset G(W)p^μG(W) and frames D(X₀) with Hodge line equal to the μ-weight-one part; it should take b in the one-sided coset G(W)·σ(μ)(p) or adjust the frame, as b=diag(1,p) with μ=diag(z,1) shows; affects a stated result.
- **Misprint** in Kisin17 at proof of Lemma 1.2.18, p.16: the source places g₀ in G(O_L) and the comparison g̃ in G(S); it should be G(L) and G(S[1/p]), the output being the coset g₀G(O_L); affects the proof.
- **Gap** in KZ25 at Proposition 3.3.4, p.25: the source deduces adaptedness from Proposition 3.3.2, whose stabilizer hypotheses (reductive generic fibre, Bruhat–Tits stabilizer) are not assumed for G′; it should also assume the étale tensors have the fixed integral type; affects a stated result.
- **Error** in KP18 at proof of Lemma 3.1.9, p.166: the source takes the first-order comparison c to be determined by a Frobenius-compatibility square; it should construct c by relative-frame factorization, since the square loses information after p-torsion base change; affects the proof; corrected in print at KPZ26 Lemma 5.1.15 and Remark 5.1.17, pp.51–52.
- **Gap** in KP18 at proof of Lemma 3.1.17, p.169: the source proves convergence in a topology for which Ŵ(A)[1/p] is not complete; it should use the p-adic topology and Zink's logarithmic coordinates; affects the proof; corrected in print at KPZ26 §7.3.1(2), p.86.
- **Gap** in KP18 at §3.2.12, p.173: the source chooses a tensor-preserving Ψ constant modulo a_E without any compatibility of c with the tensors; it should assume the very-good condition; affects a stated result; corrected in print at KPZ26 Definition 5.2.5 and §7.1.4, and KZ25 §3.2.5 (C).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6280fea", "job": "REV-PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII", "model": "opus", "worker": "fable-rev71"} -->
