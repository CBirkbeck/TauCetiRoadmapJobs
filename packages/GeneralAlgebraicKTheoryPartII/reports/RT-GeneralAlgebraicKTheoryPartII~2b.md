<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1197#issuecomment-6483502487 -->
Red team round 2 pass b (claude) of c410d39

Verdict: needs_changes

1. **F01** (P3) §4.11 builds the odd-prime height-one Bousfield–Kuhn functor that KTheoryFiniteLocalFields §0.4 already owns, without citing it

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:849` ("For each n≥1 construct Φ_n:Spaces_*→Sp_(T(n)) with … Φ_nΩ∞X≃L_(T(n))X") and its `*Needs:*` line at `README.md:869`.

   Claim: §4.11 is the first owner of Φ_n for every n≥1, including n=1.

   Witness: KTheoryFiniteLocalFields at its open head (#1281, merge-order line 82, earlier than this roadmap at line 220), `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md`, §0.4 "Height-one localization and realization": for p odd it constructs `heightOneFromZeroSpace`, a functor Φ_p from pointed spaces to KU/p-local spectra with Φ_p(Ω∞₀X)≃`heightOneLocalize X` natural in spectra X, with identity/composition, fibre-square preservation and connected-cover comparison. At n=1 and p odd this is the same object as §4.11's Φ₁ (T(1)=K(1) by §4.20, so Sp_(T(1)) is the KU/p-local category): two owners for one object. The README cites KTheoryFiniteLocalFields only for §§1.1–1.6 and 6.5a; "0.4" does not occur in it.

   Repair: in §4.11 add after the first sentence: "For n=1 and p odd, KTheoryFiniteLocalFields §0.4's `heightOneFromZeroSpace` is this functor on the homotopy category, with Φ_p(Ω∞₀X)≃L_(K(1))X; §4.11 adds p=2, every n≥2, the coherent finite-source formula F(V,Φ_nY)≃Φ_vY and the uniqueness statement, and its n=1 odd-p value is identified with the supplied functor by that uniqueness." Add "KTheoryFiniteLocalFields §0.4 (Height-one localization and realization)" to the §4.11 `*Needs:*` line and to the "From TauCetiRoadmap.KTheoryFiniteLocalFields" contract paragraph at `README.md:268`.

2. **F02** (P3) §9.1 cites §4.19 for a height-one comparison that §4.19 does not state; §6.7 omits §4.4

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:2129` (§9.1 `*Needs:* … §4.19 (Telescopes on chromatically local spectra)`) and `README.md:1772` (§6.7 `*Needs:*`).

   Claim: §4.19 supplies the passage between T(1)- and K(1)-statements used in §9.1 for an arbitrary E₁-ring A, and §6.7's listed inputs cover its route.

   Witness: §4.19 (`README.md:987`) compares L_(T(n)) and L_(K(n)) only on L_n-local X and explicitly "do[es] not prove equality of the two localization functors on all spectra"; K(A) in §9.1 is an arbitrary spectrum. What §9.1 uses is §4.4 (A K(1)-acyclic ⇒ T(1)-acyclic, A a ring) together with ⟨K(1)⟩≤⟨T(1)⟩ (BordismFormalGroups F6.3), or the all-spectra identification of §4.20, which §9.1's own text names ("the known height-one comparison"). §6.7's route (`README.md:1765`) invokes "the ring-spectrum comparison of vanishing at T(n) and K(n) for n≥1", which is §4.4, absent from its `*Needs:*`. Instance: A=Hℤ at p=2 is K(1)-acyclic but not L₁-local (L₁Hℤ=Hℚ), so §4.19's hypothesis fails while §9.1's conclusion L_(K(1))K(ℤ)≃L_(K(1))K(ℤ[1/2]) is the intended one.

   Repair: in §9.1's `*Needs:*` replace "§4.19 (Telescopes on chromatically local spectra)" by "§4.4 (Ring-spectrum acyclicity comparison); §4.20 (Separation above height one); BordismFormalGroups F6.3 (⟨K(1)⟩≤⟨T(1)⟩)". In §6.7's `*Needs:*` add "§4.4 (Ring-spectrum acyclicity comparison)". Update the Layer 9 and Layer 6 Dependencies lines accordingly.

3. **F03** (P3) a §4.26 Check restates the supplier interface

   Location: `packages/GeneralAlgebraicKTheoryPartII/README.md:1119` ("P(1)=1 and P(xy)=P(x)P(y).").

   Claim: this bullet tests the imported operation.

   Witness: it repeats the contract at `README.md:49` ("the natural multiplicative unital operation P_p:π₀R→R⁰(BΣ_p)") and holds for the wrong models too (the identity operation, x↦x^p composed with the constant map). The remaining four bullets of the block already give the discriminating values (res P(2)=4 at p=2 and 8 at p=3 against res(P(1)+P(1))=2; the quotient formed only after reducing by I_(k+1); g₂ with constant term u₂).

   Repair: delete the bullet, or replace it by "P(0)=0 and res P(−1)=(−1)^p, so at p=2 res P(−1)=1=res P(1) although −1≠1 in π₀E: basepoint restriction is not injective and the quotient operation is tested on classes, not on their restrictions."

Round 2. The twelve round-1 findings (pass a F01–F07, pass b F01–F05) were re-verified one by one at this head (ledger below): all twelve are repaired, and no repair introduced an error. The full pass was then run again on every line of `packages/GeneralAlgebraicKTheoryPartII/README.md` (2434 lines, 104 numbered targets including the new §6.1a, 32 declared gaps) and `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean` (52 lines, no declaration). Three new findings, all P3.

## Round-1 findings re-verified at c410d39

| Finding | Status | Witness at this head |
|---|---|---|
| r1a F01 cover indices | repaired | `README.md:1200` "Restricting to Ω²(S³⟨4⟩), where S³⟨4⟩ is the fiber of the identity-on-π₃ map S³→K(ℤ,3)… S³⟨3⟩=S³"; `README.md:1218` "J_rS²⟨3⟩ is the fiber of J_rS²→K(ℤ,2)… J_rS²⟨2⟩=J_rS²". Recomputed: S³⟨4⟩ has π₂=π₃=0, π₄=ℤ/2; S²⟨3⟩≃S³. No other use of ⟨·⟩ outside §4.13's Checks. |
| r1a F02 rational circle Tate | repaired | `README.md:206` "the raw circle Tate spectrum is not: π_*(Hℚ^tS¹)=ℚ[t,t⁻¹] with \|t\|=−2, so π₀=ℚ". Recomputed from the norm cofiber. |
| r1a F03 = r1b F01 Witt gap | repaired | gap absent from README and from `design/plan.json` (32 gaps in both, sets equal); `README.md:248` defines χ=γ_∞⁻¹ from QWittVectors §1.4a (verified at #1351 head, lines 203–215: γ_∞(τ(a))=(1−at)⁻¹); `README.md:1312` proves −tχ′/χ=∑w_nt^n. Recomputed: coefficient of t^n in ∑_d∑_k d·a_d^k t^{dk} is ∑_{d\|n} d·a_d^{n/d}=w_n; χ=1−t² gives 2t²+2t⁴+⋯ with w₂=w₄=2. |
| r1a F04 chromatic field maps | repaired | new §6.1a (`README.md:1655–1671`) states E(A), the colocalization E(−)⊣(−)♭, nilpotence detection and the cover theorems; all eleven bsy locators verified (bsy line 809 Theorem 2.38; 2026 Definition 4.29; 2141 Corollary 4.37; 2177 Theorem 4.40; 2246 Corollary 4.44; 2416 Theorem 5.1; 2443 Theorem 5.3; 2511 Proposition 5.9; 2593 Proposition 5.15; 2633 Proposition 5.17; 1832 Definition 4.11; 816 π_*E(A); 2450 height-zero E(A)=A[u^±]). §6.2 route (`README.md:1679`) now composes R→E(A)→E(L). |
| r1a F05 lmmt 644 | repaired | no occurrence of "lmmt line 644"; `README.md:558,619,636,2259` cite lines 753, 771, 765, 765; lmmt line 753 opens the stable-envelope paragraph, 765 is Proposition 3.12, 771 its proof. |
| r1a F06 height-one primary sources | repaired | `README.md:1005` cites mah81 lines 46 (Theorem 1.1) and 633 (Theorem 6.3), mil81 line 272 (Theorem 4.11, Corollary 4.12 at 282); verified in the cached texts; both in References and `sources.toml` (32 ids = 32 References). |
| r1a F07 restating Checks | repaired | `README.md:841–843` (π₀Φ_v=[E,E]∋loc≠0, π_(−kd)≠0, v² cofinal) and `README.md:1177` (π₀(KU₂^∧)^tC₂=ℤ₂((x))/(x−2)≅ℚ₂). Recomputed: [2](x)=2x−x²=x(2−x), x a unit in ℤ₂((x)), quotient ℤ₂[1/2]=ℚ₂. |
| r1b F02 Suslin gap | repaired | `README.md:266` asks only for the ring-spectrum identification K(L)^∧p≃ku^∧p via the §1.2 Bott class and records that ℤ_p[β] follows from §6.5a (d=0) and §1.6; KTheoryFiniteLocalFields §§1.2, 1.6, 6.5a verified at #1281 head; `plan.json` text identical. |
| r1b F03 multiplicative Postnikov gap | repaired | `README.md:53` asks for the E₁ structure on τ≤kR, the k-invariant derivation whose RefinedTraceMethods §4.14 pullback is τ≤kR, and the I⊗_A J bound; §4.14 at #1493 head (line 2037) has the extension datum (A,I,δ) and pullback algebra; GeneralizedCohomology G3 item 8 (main, line 785) exists; §4.39/§4.40 `*Needs:*` (`README.md:1383,1400`) cite both and the gap. |
| r1b F04 blanket RefinedTraceMethods Needs | repaired | no occurrence of "§§2.1–2.17" or "6.1"; the per-target lists (e.g. §5.2 `README.md:1547`: §§4.9, 4.11, 4.17, 2.9; §5.4: §§2.3, 2.9, 4.19; §9.6: §2.9) match the sections used. Labels "The Dundas–Goodwillie–McCarthy theorem", "The TC assembly map for C_p", "Stable K-theory is THH", "Truncating invariants: nil-invariance and excision", "Nonconnective K-theory by the suspension construction", "Connective K-theory of small stable ∞-categories" all occur as bold target labels in the RefinedTraceMethods head (lines 2201, 2314, 2095, 2300, 1849, 1823). |
| r1b F05 Bott names | repaired | `README.md:214,218` use a (degree 4), b (degree 8), u (complex) with a²=4b, c(a)=2u², c(b)=u⁴; GeneralizedCohomology main line 1677 agrees; §8.6 (`README.md:2037`) uses b∈π₈ko. |
| r1a F03 / r1b F01 duplicate | settled once | as above. |

Settled finding F15 of the second package repair (ChromaticHomotopyTheory ownership) is not re-raised: ChromaticHomotopyTheory is merge-order line 222, after this roadmap (220), and its head (#1643, line 41) already imports "GeneralAlgebraicKTheoryPartII KII.5's chromatic purity theorem".

## Verified sound

Declarations read: 0 (`Suggested.lean` has a module docstring and an empty namespace; no `lemma`, no `set_option`, single `import Mathlib`, no sorry'd data; the docstring's thirty-one headline families each name the missing carrier, and the "Lubin–Tate covers" bullet was added for §6.1a). The `#check @name` audit is empty. Headline statability re-examined at the pins: Mathlib has no spectra, ring spectra or K-spectrum (only `SSet.Quasicategory` `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`, `CategoryTheory.Idempotents.Karoubi` `Karoubi.lean:43`, `TStructure` `TStructure/Basic.lean:54` with `bounded := plus ⊓ minus` at line 262, `WittVector` `Mathlib/RingTheory/WittVector/Defs.lean:52`); Tau Ceti has only the degree-zero `SplitK0`, `AbelianK0` (`Abelian.lean:79`), `TriangulatedK0` (`Triangulated.lean:139`), `SplitK0.finrankEquiv`, `ExactStructure` (`ExactStructure.lean:241`, with `[Preadditive C] [HasZeroObject C]` in its signature) and `finiteProjectiveModulesExactStructure`. No headline is statable; an empty file is correct and there is no padding.

Targets read: 104 of 104 (103 numbered plus §6.1a) with every `*Needs:*` line, every Checks block (349 bullets) and the six layer Dependencies lines. Policy: no pull-request number, process word or `lemma`; every target has a locator; `sources.toml` has 32 ids equal to the 32 References; no machine path in README, Lean or manifest; `metadata.toml` topic math.KT; the diff against origin/main touches only the package folder (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, four reports).

Dependency check on this head:

```text
depcheck: 186 roadmaps, 1223 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citation resolver reported nothing missing.

Locators verified: 97 of the README's 125 distinct `<id> line N` anchors opened in the cached texts (the rest were verified by both round-1 passes and are unchanged), all pointing at the cited statement, plus lmmt 437, bsy 816, 1832, 2450 and mil81 282 for context: lmmt 55 (lines 71, 101, 116, 122, 150–176, 255, 267, 316, 338, 352, 362, 367, 384, 409, 437, 491, 531, 555, 584, 586, 610, 645, 659, 694, 734, 753, 765, 771, 810, 819, 852, 858, 876, 899, 903, 919, 948, 954, 960, 973, 978, 987, 1002, 1045, 1056, 1065, 1068, 1089, 1097, 1110, 1132, 1162, 1197, 1208); bsy 13; bgt 7; lt 6; mah81 2; mil81 1; agh 1541; yuan 58, 96, 310, 326; cmnn24 101, 827; weibel 236, 469; hahn 19, 432; csy 4036; bhm 225. lmmt line 1047 confirms the connective sequence Kcn(ℤ)→Kcn(tmf)→Kcn(Tmf) of §8.9; agh line 1541–1544 confirms ko and tmf right regular noetherian; lmmt line 973 confirms z(m) K(n)-acyclic for 1≤n<m; lmmt line 437 confirms m=n+1 (via CSY Theorem E, the body's Theorem 5.4.4).

Checks tested: 81 recomputed (table below). Each definition (§§1.1, 1.2, 1.4, 2.1, 3.1, 3.2, 4.1, 4.2, 4.5, 4.10, 4.11, 4.13, 4.22, 4.26, 4.28, 4.32, 5.3, 6.1a, 7.1, 8.1, 9.3, 10.3) has at least three discriminating Checks; the single restating bullet is S03.

Sibling citations checked at the heads named in the brief or on main: RefinedTraceMethods (#1493) §§2.1–2.5, 2.7, 2.9–2.12, 2.17, 4.6, 4.9–4.11, 4.14, 4.15, 4.17–4.19 with the labels above and the §4.19 cofiber "Σ(THH(R;ℤ_p)_{hT_p})⊗C_p, C_p pointed at 1 (p−1 copies)"; QWittVectors (#1351) §§1.3, 1.4, 1.4a; EllipticCohomology (#945) E1–E6, E2 items 2–3 (h∈{1,2} only, so the all-height gap is genuine), E5 gl₁ and Thom data, E6 level spectra Tmf(Γ) with deck descent; HomotopySpheres (#1287) §3B (James filtration, quotient J_rX/J_(r−1)X≃X^∧r, no natural stable splitting statement, so that gap is genuine), §4B, §4C; GeneralizedCohomology G2, G3 item 8, G4 item 5, G5 and line 1677; TopologicalKTheory T4, T7 (item 1); BordismFormalGroups F1–F3, F6.1–F6.5; AlgebraicTopology Stages 4, 8; ModularCurves §7E; EnhancedDerivedSheaves E0.4, E0.7, E3.1, E5:abstract.1–4, E5:presentability.1–3; KTheoryFiniteLocalFields (#1281) §§1.1–1.6, 6.5a (field descent with cd_ℓ hypotheses, no spectral étale site, no ring-spectrum ku identification); SchemeKTheoryOperations (#1229) §§4.12, 5.2, 5.6, 5.7, 5.9 (no KH, Karoubi–Villamayor, derived blowup or platification content, so those eight gaps are genuine); KTheoryLowDegrees (#1248) §§1.1–1.3, 13.1 (§1.2 has no nilpotent-ideal statement, so that gap is genuine); AInfCohomology (#1044) §AI.7.2 (`tateOrbit`, `completedTateComparison`); MotivicEtaleKTheory (#1470) §7.2; StableHomotopyKTheory (#1227) §§3.18–3.21, 5.18–5.19, 6.1–6.3, 7.1–7.27; GeneralAlgebraicKTheory (#1212) §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13, 11.15–11.16, 13.6, 13.8a–13.8c; StableHomotopyKTheoryPartII PO.4 "Degree-zero power operation" and "The transfer ideal for a prime power operation" (board design, `packages/StableHomotopyKTheoryPartII/design/README.md:739,783`). Every supplier is on main or earlier in the merge order. Ownership by object: searches for Nullstellensatz, nilpotence-detecting maps and Lubin–Tate covers over main, the board packages and all open roadmap pull requests find no other owner, so §6.1a is correctly owned here; searches for Bousfield–Kuhn, Hahn acyclicity, telescopic Tate vanishing and the Tate height converse find only ChromaticHomotopyTheory (later, settled) and the KTheoryFiniteLocalFields §0.4 overlap of S01.

Declared gaps: 32 slugs identical in `plan.json` and the README, each with a named supplier and section that exists; each `needs` is a single precise sentence; none asks for what a supplier already provides (checked above against SKO, KLD, KFLF, HS, EC, RTM, EDS).

### Adversarial mathematics table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions: cofiber sign, restriction, Witt series | k→0→Σk; R→R; a=τ(1) | [Σk]=−[k]; [R²]↦2[R]; χ(τ(1))=1−t, acting on [1−εx] as [1−εx] | sound |
| Conventions: bottom detector | p=2, X=H𝔽₃ | T(0)⊗H𝔽₃=H𝔽₃≠0, Hℚ⊗H𝔽₃=0 | sound |
| §0.1 | q=id; q:D→0; A=0 | fibers 0; K(D); 0 | sound |
| §1.1 | Hk; Hk⊕ΣHk; Hℤ | π₀GL₁(Hk)=k^×; π₁GL₁=k; π₀GL₁(Hℤ)={±1} | sound |
| §1.2 | fd k-spaces; C=0; X=ΣHk,Y=Hk | π₀Kadd=ℤ, [k]=1; 0; π₋₁Hom=k, π₋₁hom=0 | sound |
| §1.3 | X=A; A⊕A; 0 | End_A(A)=A (left mult.); Hom(A,A²)=A²; 0 | sound |
| §1.4 | X=*, S¹ | S[Ω*]=S; S[ΩS¹]=S[ℤ]; aug∘unit=id | sound |
| §2.1 | F=0; R=HA; k=0 | 0→0; id; τ≤₀R=Hπ₀R | sound |
| §2.2 | identity-leg square; k[ε]/ε² | correction algebra A; I²=0; fiber 0 | sound |
| §2.3 | S[1/p]→Hℤ[1/p]; Λ=ℤ/2,ℤ/3 | mod-p fibers 0; p-adic K fiber 0 | sound |
| §2.4 | Hℤ; Hk⊕ΣHk; j=0,−1 | K₀=ℤ, K₋₁=0 both sides | sound |
| §3.1 | Σ^rHk; τ≤₀S | amplitudes [r,r]; Hℤ not finite | sound |
| §3.2 | Projω(Hk); 0; Perf(k) additive | Stab=Perf(k), K₀=ℤ; 0; ⊕_jℤ vs ℤ | sound |
| §3.3 | Perf(k) | [Σk]=−1; K_j=0, j<0 | sound |
| §3.4 | Hk[u], \|u\|=2 | cofib(Σ²R→R)=Hk; u-inversion kills Hk; zero kernel ⇒ fiber 0 | sound |
| §3.5–3.6 | C=0; Perf(k) | kernel 0; ⊕_jℤ→ℤ, e_j↦(−1)^j kills e₀+e₁ | sound |
| §4.1–4.2 | Tel(0); Tel(v²); S/q; Σ^rH𝔽_p | 0; ≃Tel(v); π₀(H𝔽_q)[1/p]=𝔽_q; positive periodic groups 0 | sound |
| §4.3–4.4 | Hℚ; H𝔽_p; H𝔽_q | (Hℚ)^∧p=0, T(0)Hℚ=Hℚ; T(n)H𝔽_p=0=K(n)H𝔽_p; T(0)H𝔽_q≠0, K(0)H𝔽_q=0 | sound |
| §4.5–4.7 | n=0; S/p; S/q; S_(p) | L₀^fS=Hℚ, L₀^(p,f)S=S[1/p]; p-finite kills S/p fixes S/q; p-local values agree | sound |
| §4.8–4.9 | m=0,n=1, X=H𝔽_q; X=H𝔽₃ at p=2 | corners H𝔽_q,0,H𝔽_q,0; L₁^(p,f)H𝔽₃=H𝔽₃ | sound |
| §4.10 | E=v⁻¹Σ∞V, X=Ω∞E | π₀Φ_v=[E,E]∋loc≠0; π_(−kd)≅π₀; v² cofinal | sound |
| §4.11–4.12 | Hℤ; T(n); Σ⁻¹Hℚ | Φ_nΩ∞Hℤ=0; L_T(n)T(n)≠0; Ω∞Σ⁻¹Hℚ=* | sound; S01 ownership |
| §4.13 | S⁰; K(ℤ,1); K(A,r) | τ≤₀S⁰=S⁰; K(ℤ,1)⟨2⟩=*; K(A,r)⟨r+1⟩=* | sound |
| §4.14 | id; ∅→*; E=0 | E→E; 0→E fails for E≠0; 0→0 | sound |
| §4.15–4.16 | n=1,2; K(ℤ/p,2) at n=1; K(ℤ,2) | m=2,3; v₀,v₁ groups of K(ℤ/p,2) vanish and Σ∞K(ℤ/p,2) is S[1/p]- and K(1)-acyclic (Ravenel–Wilson j>n); K(ℤ,2) has π₂[1/p]≠0 so excluded | sound (lmmt 437) |
| §4.17–4.18 | n=0,1; additive law | ⟨Hℤ_(p)⟩=⟨Hℚ∨H𝔽_p⟩; BP⟨1⟩⊗H𝔽_p≠0, E(1)⊗H𝔽_p=0; additive [p]=0 fails unit ideal | sound |
| §4.19 | X L_n-local | fiber of X→L_K(n)X is L_(n−1)-local hence T(n)-acyclic; L_K(n)X T(n)-local by ⟨K(n)⟩≤⟨T(n)⟩ ⇒ L_T(n)X≃L_K(n)X; Hℤ at p=2 not L₁-local | sound; S02 citation |
| §4.20 | p=2,3; V=S/p | π_*v₁⁻¹V=𝔽_p[v₁^±]⊗Λ (mil81 282); ⟨v₁⁻¹V⟩=⟨T(1)⟩, ⟨L_K(1)V⟩=⟨K(1)⟩ | sound |
| §4.21 | n=1, p=2 | cofib(v₁)=BP⟨0⟩ T(1)-acyclic; π₋₂(BP⟨1⟩⊗ℚ)=0 vs π₋₂(E(1)⊗ℚ)=ℚ | sound |
| §4.22–4.23 | G=1; Hℚ with C₂,C₃ | norm id; transfer∘section=(1/2)·2=(1/3)·3=1 | sound |
| §4.24–4.25 | KU_p^∧, C_p trivial; n=1; X=0 | raw Tate rational nonzero, T(1)-local 0; target p-inversion; 0 | sound |
| §4.26 | p=2,h=2,k=1; x=y=1 | g₂ constant u₂; res P(2)=4, res(P(1)+P(1))=2; p=3: 8 vs 2 | sound; S03 |
| §4.27–4.28 | H𝔽_p; Hℚ; H𝔽_q; 0 | heights −1,0,0,−1; K(0)Hℚ≠0, K(1)Hℚ=0 one-way | sound |
| §4.29 | KU₂^∧, C₂, i=0,1 | π₀(R^tC₂)=ℤ₂((x))/(x−2)=ℚ₂≠0 at i=0; rational at i=1 ⇒ T(j)R=0, j≥2 | sound |
| §4.30 | p=2,3 | tmf→Tmf fiber coconnective ⇒ T(n)-equiv n≥1; Δ²⁴ degree 576; T(3)=0 | sound |
| §4.31 | p=2,3 | unit 1−2=−1; S³⟨4⟩: π₂=π₃=0, π₄=ℤ/2; 3-local null twist retracts onto S_(3), π₃=ℤ/3≠π₃Hℤ_(3)=0 | sound |
| §4.32 | m=0,1,2; p=2,3,5 | y(0)=S_p^∧; π₀y(1)=𝔽_p, π₀z(1)=ℤ_(2); S²⟨3⟩≃S³; slopes 1/16<1/4 (p=3), 1/48<1/8 (p=5); i=m equal | sound (lmmt 955) |
| §4.33 | W=*; S²; mod-3 Moore at p=2 | 0; summands S^{2r}; ΣS/3≠0 after inverting 2 | sound |
| §4.34 | H𝔽₂; ℚ×ℚ in Perf(ℚ); R=0 | rational and mod-3 homology 0, mod-2 ≠0; (a,b)(c,d)=(ac,bd) vs E₁₂E₂₁≠E₂₁E₁₂; id_R=μ∘(0⊗id)=0 | sound |
| §4.35 | ℤ/4→𝔽₂; ℤ/9→𝔽₃; I=0 | K₀=ℤ→ℤ id, K₋₁=0; K₋₁(A)=coker on K₀(A[t^±]) with I[t] nilpotent | sound |
| §4.36 | 𝔽₃[ε]/ε², a=τ(1); a=(0,1); j=−1 regular | χ(a)(εx)=1−εx, inverse gives 1+εx, difference 2εx≠0; χ=1−t²: 2t²+2t⁴, w₂=w₄=2; NK₋₁(k)=0 | sound |
| §4.37 | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε²; ℤ/9→𝔽₃ | ×2 invertible; ×2=0; K₁(ℤ/9,(3))={1,4,7} order 3 | sound |
| §4.38 | id; N=m−1 | fiber 0; GL N-connective ⇒ BGL (N+1)-connective=m | sound |
| §4.39 | m=n=0; identity side | fib(comparison)=Σ²(I⊗_A J): I⊗_A B→I split by I→I⊗_A B with fiber Σ(I⊗_A J), so (m+n+2)-connective; identity side I=0 | sound |
| §4.40–4.41 | k=0,1; HA; H𝔽₂ at p=2 | τ≤₀R=Hπ₀R; τ≤₁HA=HA; L_T(i)K(𝔽₂)=0 | sound |
| §4.42–4.43 | ℤ/p^r; 𝔽₃[ε]/ε²; Perf(H𝔽_p) | K(𝔽_p)^∧p=Hℤ_p; K(A) a K(𝔽₃)-module; π₀R[1/p]=0 ⇒ p^k=0 in π₀R | sound |
| §4.44 | A=S,n=0; q≠p | compact M with M[1/p]=0 is a retract of Σ⁻¹M/p^k ∈ thick⟨A/p⟩; S/q survives | sound |
| §4.45–4.46 | i=2; i=1 control; A=0; A local | L_T(2)K(ℤ)=L_T(2)K(S[1/p])=0; K(ℤ) height-one part ≠0; id; part (ii) n≥2 only (lmmt 108) | sound |
| §5.1–5.2 | KU, n=2 | τ≥₀KU=ku; fib(K→TC) unchanged under A→Hπ₀A; K(ℤ)-modules killed at T(2) | sound |
| §5.3–5.4 | G=1; free orbit; n=2,3 | res∘ind=p on K₀; m=0 Mitchell base; m=1 uses trace at height 2; cofiber p−1 copies: 1 at p=2, 2 at p=3 | sound |
| §5.5–5.6 | A=0; H𝔽_p; ℤ/4→𝔽₂ | two-height localizations 0; L_T(1) step via P=B×_{B[1/p]}A[1/p] as lmmt 822–832 | sound |
| §6.1 | H𝔽_p; Hℚ; E_n; 0 | bounds 0,1,n+1; K(0)=0 height −1 | sound |
| §6.1a | R=0, A=0; R=E(L); Hℚ[x] | R→0 detecting ⇒ id_R nilpotent ⇒ R=0; identity cover, tilt L; R/x not nilpotent but zero over ℚ(x); product of residue fields reduced dim 0 | sound (bsy 2416, 2443, 2450) |
| §6.2 | E₁(L); Hℚ; H𝔽_q | identity; E₀(L̄); rationalization 0, no input | sound |
| §6.3–6.4 | E₁,E₂ at p=2,3; L=ℚ̄ | T(2)K(E₁)≠0, T(3)K(E₂)≠0 (yuan 58); K(L[u^±])^∧p=ku_p⊕Σku_p from [HL]=F−Σ²F=0 (bsy 3901) | sound |
| §6.5 | Hℚ; E₁; (H𝔽₂)^tC₂ at odd p | 0→1, 1→2; counterexample: 2=0 on K(R), K(R)[1/p]⊇K₀=ℤ/2[1/p]≠0, so ht_p K(R)=0=ht_p R | sound |
| §6.6 | n=1; M=HA | E₀(L) has T(1)R=0, T(1)K(R)≠0; π₁ΣHA=A matches relative units 1+A | sound |
| §6.7 | Hℚ; E₁; (H𝔽₂)^tC₂ at odd p | M_n^fX=0⇔L_T(n)X=0; height-0 case: both sides true for every n≥1 | sound; S02 |
| §7.1–7.3 | id_Hℤ; Hℤ⊕ΣHℤ→Hℤ; K(ℤ/p^r)→Hℤ | rational π₁ ℚ→0 fails 0-nice; rank map: π₀ id, rational equivalence by §4.37, T(i) both 0 | sound |
| §7.4 | m=1; i=3 | heights {0,1,2} (T(0)K(m)=0 since 𝔽_p-module); L_T(3)K(K(1))=0 | sound |
| §7.5–7.6 | r=0; n=0 | τ≤₀S=Hℤ; K(ℤ_(p))→K(ℚ) T(1)-equivalence by purity (T(0): Hℚ both; T(1): both 0) | sound |
| §7.7–7.8 | W=*; m=1,2 at p=2 | id; i-range empty at m=1; T(1)K(z(2))≃T(1)K(ℤ_(2)) via §5.6 with π₀z=ℤ_(2) (lmmt 971–975) | sound |
| §8.1–8.3 | Σ=∅; zero tower; A→A×A | T_(ε,∅)=T; length 1; transfer (1,0)↦1 | sound |
| §8.4–8.5 | H=1; \|H\|=24,48 | rank 1; d\|H\| cells, invertible rationally | sound |
| §8.6–8.9 | ko; tmf; p=2,3 | A[b⁻¹]=KO, heights ≥3 zero; tmf heights ≥4 zero, T(3) to TMF; \|GL₂(𝔽₃)\|=48, 12·2=24; Kcn(ℤ)→Kcn(tmf)→Kcn(Tmf) (lmmt 1047) | sound |
| §9.1–9.2 | Hℤ, H𝔽_p; k[ε]/ε²; ∅ | 𝔽_p[1/p]=0; nil fiber 0; K(∅)=0 | sound; S02 |
| §9.3–9.5 | S, d=0,1,2; 𝔽_p[ε]/ε² | S, S, Σ∞_+BC₂; 1+εx nonconstant unit, localized NK₁ value 0 | sound |
| §9.6–9.7 | p=2,3; r=1,2 | L_K(1)TC(ℤ)≠0, TC(ℤ[1/p])^∧p=0; L_K(1)TC(ℤ/p^r)=L_K(1)K(ℤ/p^r)⊕L_K(1)Σ⁻¹Hℤ_p=0 | sound |
| §10.1–10.2 | Perf(k); constant diagrams | e_j↦(−1)^j, fiber 0 after T(2); colim const A=A | sound |
| §10.3–10.5 | 1, C₂, ℤ, S₃, Q₈; R=KU | terminal orbit for first three; τ≥₀KU=ku middle term | sound |

## Not verifiable

- No Lean elaboration was run (read-only pass); `Suggested.lean` has no declaration, so nothing would have been compared.
- Printed page numbers (JAMS pagination of lmmt, manuscript pages of the arXiv sources, Pacific J. Math. pages of mah81, JPAA pages of mil81) were taken from the extractions' page markers where present; the line numbers were verified, the printed pages were not independently checked.
- The 32 supplier gaps are future obligations; their hypotheses, boundaries and ownership were checked, their implementations are not certified. StableHomotopyKTheoryPartII PO.4 was read as a board design, not a finished package.
- Ownership against open pull requests whose files the brief does not give was checked only through the roadmap service's grep over their README and Suggested.lean; their design folders were not inspected.
- The mil81 extraction is garbled at Corollary 4.12 (line 285); the tensor structure 𝔽_p[v₁^±]⊗E[·] is legible, the name of the exterior generator is not.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c410d3995c7b456e73d569fd2520ef469b8cfb6d", "job": "RT-GeneralAlgebraicKTheoryPartII~2b", "model": "fable", "worker": "chris-x9"} -->
