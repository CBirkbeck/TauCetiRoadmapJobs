<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6903515787 -->
Review (claude) of 0b5f6f1

Verdict: needs_changes

1. **F01** (P2) 7.1: the base change of the atlas is stated for every G, and is only the projection up to hypersheafification

   **Location.** `packages/QuasicoherentSheavesOnPrestacks/design/README.md` line 717 (7.1, second API bullet): "For every G the atlas `X → [X/G]` is an fpqc surjection. … Along such a lift `Spec R_i → X`, the base change of the atlas is the projection `G ×_S Spec R_i → Spec R_i`". Mirrored in `design/plan.json`, target 7.1, API entry `geometric_quotient`.

   **Claim.** For every group prestack G, the atlas pulled back along a lift is the prestack `G ×_S Spec R_i`.

   **Witness.** `S = X = Spec ℤ`, G the constant group prestack `Γ = ℤ/2`. `Spec ℤ ×_{[Spec ℤ/Γ]} Spec ℤ = L(Γ) = Spec(ℤ × ℤ)`, with 4 points at the test ring `ℤ × ℤ`; the prestack `Γ × Spec ℤ` has 2. The Check at line 727 computes these same two values.

   Before the last repair the bullet began with the affine hypotheses and continued "For every such G"; there the sentence is exact, since `G ×_S Spec R_i` is an affine, hence a hypercomplete fpqc sheaf. The reordering replaced "such G" by "G" and the sentence now covers prestacks for which it fails. Every later use (the affine diagonal, flatness of the atlas, the last Check) is in the affine case, so nothing downstream breaks.

   **Exact repair.**

   1. README line 717: replace the sentence "Along such a lift `Spec R_i → X`, the base change of the atlas is the projection `G ×_S Spec R_i → Spec R_i`, by the effectivity above and the left exactness of L: a base change of `G → S`, split by the unit." by: "Along such a lift `Spec R_i → X`, the base change of `L X → [X/G]` is `L(G ×_S Spec R_i) → Spec R_i`, by the effectivity above and the left exactness of L: the hypersheafification of a base change of `G → S`, split by the unit. When X and `G ×_S Spec R_i` are hypercomplete fpqc sheaves, as when S and X are affine and G is affine over S, it is the projection `G ×_S Spec R_i → Spec R_i` itself."
   2. README line 727, append to the Check: "Accordingly the base change of the atlas `Spec ℤ → [Spec ℤ/Γ]` along itself is `L Γ = Spec(ℤ × ℤ)`, with 4 points at `ℤ × ℤ`, and not the constant prestack Γ, with 2."
   3. `design/plan.json`, 7.1, `geometric_quotient`: replace "along which the base change of the atlas is G x_S Spec R_i -> Spec R_i, a base change of G -> S split by the unit" by "along which the base change of L X -> [X/G] is L(G x_S Spec R_i) -> Spec R_i, the hypersheafification of a base change of G -> S split by the unit; it is G x_S Spec R_i itself when X and G x_S Spec R_i are hypercomplete fpqc sheaves (S, X affine, G affine over S)".

   **Tested.** `Γ = ℤ/2`: `L X ×_{[X/G]} Spec ℤ = L(X ×_{BΓ} Spec ℤ) = L(Γ) = Spec(ℤ × ℤ)`, 4 points at `ℤ × ℤ`, as the repaired sentence says. `G = G_m`, `X = S = Spec ℤ`: `G_m × Spec R_i = Spec R_i[t, t⁻¹]` is affine, so `L` fixes it and the base change is the projection, as the last Check of 7.1 uses. `G = 1`, `X = ∅`: `L X = Spec 0 = [∅/1]`, a point exists only for `R = 0`, the lift is along the empty cover, and the statement is empty. The non-flat `O(G) = ℤ × 𝔽_ℓ`: affine, the base change is `G → S` itself, not flat, as line 728 says.

2. **F02** (P3) 7.4: the route uses that affines are sheaves (3.2), which is not on its *Needs* line

   **Location.** README line 766 (7.4, proof route (a)): "`L_fppf` being left exact and fixing the fppf sheaves `h_X` and `h_{G ×_k X}` (3.1)"; line 775, *Needs*; plan 7.4, `prerequisites`.

   **Claim.** 3.1 gives that `h_X` and `h_{G ×_k X}` are fppf sheaves.

   **Witness.** 3.1 (line 443) proves only that fpqc sheaves on `CRing^op` are fppf sheaves. That an affine is an fpqc sheaf is 3.2, as 4.1 writes ("`Spec B`, a sheaf (3.2)") and 7.1 ("fixing the affines … (3.2)"). 7.4's *Needs* has 3.1, 3.3 and no 3.2; the plan's 7.4 has no `target:3.2`.

   **Exact repair.** Line 766: "(3.1)" becomes "(affines are fpqc sheaves, 3.2, hence fppf sheaves, 3.1)". Line 775: add "3.2 (affines are fpqc sheaves)" after the 3.1 item. Plan 7.4: add `target:3.2` to `prerequisites`.

   **Tested.** `X = Spec k`, `G = GL_n`: `h_X = Spec k` and `h_{G ×_k X} = Spec O(GL_n)` are corepresentable, sheaves by 3.2's last API bullet, and the dependency order is unchanged (7.4 already needs 3.3, which needs 3.2).

Two findings: one P2 (R01), a hypothesis the last repair dropped from a sentence of 7.1, and one P3 (R02). Both have exact repairs of a sentence or two. The five findings of round 14 are all repaired. The two declared supplier gaps are precise, minimal and declared in both files; they are contracts, not findings. No maintainer notes were supplied. This review changed neither `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `design/plan.json` nor `sources.toml` (its checksum is the same before and after the one fetch below).

## Verified sound

### The findings of round 14

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) affine diagonals of quotients | repaired; the reordering introduced R01 | 4.1, line 529: "Affineness is local on the target. Let `Y → Spec R` be a map from an fpqc sheaf (3.1) and `{R → R_i}` an fpqc cover such that every `Y ×_{Spec R} Spec R_i` is affine; then Y is affine". 7.1, line 717: "Then `[X/G]` has affine diagonal when S and X are affine and G is affine over S". 7.4, line 766: "For X affine, `[X/G]^♮` has affine diagonal". 8.4, line 850: "It has affine diagonal (7.4, with `X = Spec k`)". The departure (the sieve as negative control in 4.1, `B(ℤ/2)` moved to 7.1) holds: rows below. |
| F02 (P3) stackification against `L_fppf` | repaired | 2.5, line 407: "the map `L_fppf(F^♮) → (stackification F)^♮` induced by the unit `F → stackification F` is an equivalence", with the three steps (sheaf, monomorphism, effective epimorphism). The three §1.18 names are on main (SchemeAndStackFoundations README lines 3559, 3564, 3566). |
| F03 (P3) "bounded below", `^+`, `D⁺` | repaired | Conventions, line 64: "So the `+` of `QCoh(X)^+` and `D⁺` is a cohomological bound, opposite to \"bounded below\""; line 122: "with `π_i = 0` for `i > b`, uniformly in the cosimplicial degree"; line 275; line 779. The supplier states `π_i(X^q) = 0` for `i > b` and `Tot_r` for `r ≥ max(0, b − k + 1)` (EnhancedDerivedSheaves README line 1980). |
| F04 (P3) HNR Theorem 1.1 | repaired | 8.5, line 865: "HR-perf Introduction, p. 1 … It fails for poorly stabilized stacks … (HNR Theorem 1.1, pp. 1–2, and §4, p. 9)". HR-perf lines 28–29, HNR lines 45–47, 55–56 and 436–439 read: match. |
| F05 (P3) contract bullet with no user | repaired | The E5:spectra-comparison bullet is gone; `eilenbergMacLane` and `moduleSpectra_equiv_derived` no longer occur in the README. |

Nothing in the repair report is marked "not actionable"; nothing is re-raised. The repaired patterns were searched in the whole design: a fact used and stated nowhere (none further); a *Needs* line missing an input of its route (R02); a statement whose hypothesis sits in a neighbouring sentence (R01).

### Adversarial pass

Values computed by hand this round. Rows cover every passage the repair changed or added, the fifteen sampled targets, the headline theorems and the targets the findings touch.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 4.1 locality of affineness (changed, sample) | identity cover; empty cover of `R = 0`; `Isom(L₁, L₂)` for `BG_m`; AnRing | `B_• ` constant, `B = B_0`; `Y(0)` the empty product, `Y = Spec 0`; `B = ⊕_n M^{⊗n}`, `M = L₂ ⊗ L₁⁻¹`, `B ⊗_R R_i = R_i[t, t⁻¹]`; limit of animated rings computed on connective modules, base change checked after θ | holds |
| 4.1 Check, the sieve (changed) | `Y(ℤ[1/2])`, `Y(ℤ[1/3])`, `Y(ℤ[1/2] × ℤ[1/3])` | point, point, ∅: `(2, 2)` and `(3, 3)` are not units of the product; an affine gives point × point | sheaf hypothesis needed |
| 4.1 consequence for maps (changed) | `Z = [X/G]²`, `U = X × X` | point of Z lifts on a cover; `Y ×_Z Spec R_i` is a base change of `G ×_S X → X × X`, affine; `Y ×_Z Spec R` a limit of sheaves | holds |
| 7.1 atlas base change (changed, sample) | `Γ = ℤ/2` constant; `G_m`; `G = 1`, `X = ∅` | `L(Γ) = Spec(ℤ × ℤ)`: 4 points at `ℤ × ℤ` against 2 for the prestack Γ; `Spec R_i[t, t⁻¹]`; vacuous | R01 |
| 7.1 affine diagonal (changed) | `G = 1`, X affine; `G_m`; translation `X = G` | diagonal of `Spec A`, a map of affines; `G_m × Spec ℤ → Spec ℤ × Spec ℤ`; `[G/G] = S` | holds in the affine case |
| 7.1 Check `B(ℤ/2)` (changed) | realization against quotient at `ℤ × ℤ` | 2 points against `2² = 4`; after L, `Spec(R × R)` | holds; contradicts line 717 as worded (R01) |
| 2.5 stackification bullet (changed) | `G = ℤ/2` over ℝ; constant BΓ at `ℝ × ℝ`; diagonal step | `Spec ℂ` reached after `ℝ → ℂ`; `Isom` sheafified is `Γ² = (ℤ/2)²`; fibre of `F → F ×_St F` over `(a, b, φ)` is the fibre of `Isom_F(a, b) → Isom_St(a, b)`, an `L_fppf`-equivalence, stable under base change and colimits | holds |
| Conventions, Indexing (changed) | `∏_{i≥0} ℤ[−i]`; `⊕_{i≥0} ℤ[i]` | `π_{−i} = ℤ`, 0-truncated, not bounded below; `π_i = ℤ`, connective, in no `≤ n` | the two notions separate |
| 7.4(a), affine diagonal (changed) | `G = 1`; `X = Spec k`, `G = GL_n`; §1.21 | closed diagonal of an affine; `Isom(E₁, E₂)` affine; `[X/G]` is the fppf stackification of the action groupoid, torsors fppf (SchemeAndStackFoundations README lines 3748–3760, 3292–3294) | holds; R02 |
| 8.4 `BGL_n` (changed, headline) | `n = 1` over ℚ; `M = O[1]` | heart graded ℚ-vector spaces; `Map(ℚ, O[1]) = K(ℚ, 1)`, `π₀ = 0 = Hom(V, π₀M)` | holds, conditional on the gaps |
| 8.5 and its new Check (changed, sample, headline) | `Γ = ℤ/p`, `k = 𝔽_p`; Γ trivial | `π₀ Map(k[Γ], ⊕O[i]) = k = k ⊕ 0 ⊕ ⋯`; `π₀ Map(O, ⊕O[i]) = ∏𝔽_p ≠ ⊕𝔽_p`; trivial Γ: `k[Γ] = O` compact | holds |
| 1.1 (sample) | free algebra on `ℤ[0]`; `ℤ × ℤ` | `Sym² = ℤ_{hΣ₂}`, `π₁ = H₁(BΣ₂; ℤ) = ℤ/2`; product `π₀ = ℤ²` against coproduct ℤ | sound |
| 1.5 (sample) | `(ℤ, ℚ)`, `(ℤ, ℤ[1])`, `(ℤ, ℤ²)`; empty diagram; augmented squares | not dualizable; invertible; evaluation rank 4 → 1; terminal category; comonads of `C^{−1} → C⁰` and `lim → C⁰` agree by adjointability, so the "exactly when" holds (HA 4.7.5.2 with 4.7.5.3) | sound |
| 2.3 (sample) | `BΓ × Spec 𝔽₂`; `ℤ/p ⊗ ℤ/p` | `H¹(ℤ/2; 𝔽₂) = 𝔽₂` against pointwise `π₋₁A = 0`; `π₀ = π₁ = ℤ/p` | sound |
| 4.2 (sample, headline) | `f = id`; `R → R[t]`; classical `ℤ → 𝔽_p` twice | identities; `R′[t]`; `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`) against `𝔽_p`, so flatness is needed classically | sound |
| 5.1, 5.2 (sample) | `φ : ℤ → 𝔽_p`; tower `τ^{≥−m} K` | cohomology `𝔽_p` in degrees 0, −1; `H^q` iso for `q ≥ −m`, target 0 below: surjective, tag 0A0J applies; each `τ^{≥−m}` in `D⁺` | sound |
| 6.3, 6.4 (sample, headline) | `O[1]`; `O ⊕ O`; `k` over `k[ε]/(ε²)`; `⊕_ℕ O` | invertible; rank 4 → 1; `Tor_i = k` for all i, almost perfect and not perfect; `π₀` not finitely generated | sound |
| 7.2 (sample) | `G = 1`, `X = ∅`; translation; vertex maps | zero category both sides; Čech nerve of `G → S`, `QCoh(S)`; term on `G^n × X` is a pullback of the term on X | sound |
| 8.1 (sample) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `Hom(O, ⊕O_i) = ∏ℤ ≠ ⊕ℤ`; `O ⊕ O(−1)` generates | sound |
| 8.2 (sample, headline) | `BG_m`; `Spec 𝔽₂` | weight-n part exact, characters compact; one point against two | sound |
| 8.3 (sample, headline) | (a) diagonal of `Spec B → Spec A`; (b) tag 0BQR for a family; (d) `A = k[ε]/(ε²)` | `Spec B → Spec(B ⊗_A B)` affine; the proof picks one `L_i`, one section s with `X_s` affine and powers of that `L_i` only; `Ω¹_{A/k} = k·dε` or `A·dε` | sound |
| 3.2, 3.3, 5.3, 7.3 (headlines, untouched) | — | rows of round 14, which carry values (`ℤ → 𝔽_p` kills ℚ; `∏_ℕ D∞(ℤ)`; `H¹(ℤ; C) = C`) | relied on |
| gap:twist-quasiprojective, gap:chevalley-quasiprojective-quotient | P trivial; `H = GL_n`, `H = 1` | `X_R` with pulled-back L; a point; `GL_n` | precise, minimal; same slugs in README lines 135, 181 and in the plan |

### Sources: the seeded sample

No locator is flagged unverified. Every locator of the fifteen sampled targets was read in the cached texts; the page is the one the text gives.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.1 | SAG lines 17840–17846 (6.2.2.1, 6.2.2.2, pp. 490–491); HA line 46757 (7.1.3.18, p. 1219) | match |
| 1.5 | HA lines 26640 (4.7.4.18, p. 699), 23655–23660 (4.6.1.11, 4.6.1.12, p. 620), 26834 (4.7.5.2, p. 704), 26863 (4.7.5.3, p. 705), 31630 (5.2.2.36, p. 835); SAG lines 10219 (2.9.5.5, p. 283), 18368 (6.3.4.1, p. 505); HTT lines 5731 (2.4.1.5, PDF p. 134), 7312 (3.1.2.1, PDF p. 169) | match |
| 2.3 | SAG lines 17905–17914 (6.2.3.4, pp. 492–493), 18050 (§6.2.6, p. 496), 17758 (6.2.1.12, p. 488); GR-I lines 7322 (§1.1, printed p. 143), 8013 (§3.2, printed p. 159); HTT line 15522 (5.1.5.6) | match |
| 4.1 | SAG line 18224 (§6.3.2, p. 501); Stacks, Descent, lines 4181–4189 (tag 0245, Lemma 37.1, p. 89); HTT line 25589 (6.1.3.10, PDF p. 566) | match |
| 4.2 | SAG lines 18368–18380 (6.3.4.1, p. 505), 18458 (6.3.4.3, p. 507); GR-I line 7740 (2.2.2, printed p. 153) | match |
| 5.1 | Stacks line 145 (tag 06Z0); SAG lines 7269 (2.2.3.3, p. 202), 17859 (6.2.2.5, p. 491) | match |
| 5.2 | Stacks lines 86–93 (tag 0A0J), 102–103 (tag 08D3) | match |
| 6.3 | SAG lines 18072–18090 (6.2.6.2, 6.2.6.3, p. 497), 10219; HA line 23655; GR-I lines 8201, 8209 (3.6.4, 3.6.5, printed p. 163) | match |
| 6.4 | SAG line 26798 (9.1.5.1, p. 736, for quasi-geometric stacks, which include the geometric ones of 6.2); HA lines 48432 (7.2.4.11, p. 1265), 48556 (7.2.4.17, p. 1268); Stacks line 1059 (tag 08E8, Noetherian) | match |
| 7.1 | HTT lines 25224–25227 (6.1.2.7, PDF p. 559), 24717 (6.1.0.6, PDF p. 547), 25589, 25890 (6.1.3.19, PDF p. 573) | match |
| 7.2 | SAG line 17889 (6.2.3.1, p. 492); GR-I lines 7463, 7474 (1.3.8, 1.3.11, printed p. 147) | match |
| 8.1 | Stacks lines 1806 (tag 09IS), 1969 (tag 09M1); SAG line 29408 (9.6.1.1, p. 807) | match |
| 8.2 | BZFN lines 834–838 (Definition 3.2, p. 17), 970–972 (Proposition 3.9, p. 20) | match |
| 8.3 | BZFN lines 1149 (3.20, p. 23), 1189 (3.21, p. 24), 1209 (3.23, p. 24), 1216 (3.24, p. 25), 939 (§3.1.2, p. 20); Stacks line 1897 (tag 0BQR) with its proof, lines 1902–1914, and line 760 (Proposition 7.5, quasi-compact with affine diagonal); Stacks, Morphisms of Schemes, lines 999–1005 (tag 0FXR), 1011–1013 (tag 0FXS), 1019–1027 (tag 0FXT), fetched through the sources service | match |
| 8.5 | HR-perf lines 26–29 (Introduction, p. 1); HNR lines 45–47 and 55–56 (Theorem 1.1, pp. 1–2), 436–439 (§4, p. 9) | match |

Also read: Stacks, Morphisms of Schemes, line 1100 (tag 02JR, 6.2's Check). Every cited work is in the manifest (nine entries, all `certified`). The Morphisms chapter was read through the sources service under the existing key `Stacks`; the manifest was kept as recorded. No reference request was written.

### Pins, suppliers, ownership

Lean elaboration: not available (this lane does not elaborate; the command was not offered). The design has no `Suggested.lean`, so there is nothing to probe or `#check`.

Supplier citations resolved this round:

- SchemeAndStackFoundations (main): `Stack.isStack_stackification`, `Stack.stackification_isom_sheafify`, `Stack.stackification_locally_essSurj`, `StackInGroupoids.ofSheaf`, `isFiberedInGroupoids` (§1.18, README lines 3543–3566); `actionQuotient`, the stackification definition of `[X/R]` and fppf torsors (§1.21, lines 3748–3760; line 3292); `contractedProduct_isAlgebraicSpace` (§1.16, line 3384); `QCoh.presentationEquiv` (line 3802); `perfect_generator`, `isPseudoCoherentComplex_affine_iff` (§2.18, lines 5059, 5037).
- EnhancedDerivedSheaves (main): `tot_filteredColimit_of_bounded` (line 1980), `hypercoverDescent_boundedBelow` (line 2319, `D⁺`), `homotopyFixedPoints` and `continuousDerivedInvariants` (lines 1720–1722), `indCompactComparison` (line 1613), `descendableCover_zariski` (line 1836).
- InfinityTopoi (open head): §§3.3.2, 7.1.1, 7.3.4, 7.5.1, 9.2.3 exist and state what 2.5, 4.1 and 7.1 take from them (lines 721, 1215, 1300, 1350, 1699).
- The twelve name leads of `scratch/citations.md` are qualified supplier names (SchemeAndStackFoundations, EnhancedDerivedSheaves, DerivedModuleAlgebra, PrismaticCohomologyPartII); those listed above were found in the suppliers' READMEs. For the Mathlib and Tau Ceti declarations of the contract, which the repair did not touch, I rely on the file-and-line lists of rounds 13 and 14.

`scratch/overlaps.md`: no competing pull request, no dropped id, no id defined only by a revision, no second copy, and no roadmap close in results or headings. Searched by object at the open heads and on main: "perfect stack" (nowhere else), flat hyperdescent and SAG Theorem D.6.3.1 (LanglandsParameterStacks §1.7 only, the Čech case, cited and extended), `Ind(Perf(−))` (GeometryOfNumbersAndQuadraticArithmetic and RefinedTraceMethods use it for a ring, not for stacks). The board's package index (8 entries) has no second package on this subject. Ownership against pull requests outside the tools' index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), DiamondsAndVStacks (main), AnalyticStacks, HypercompletenessAndCoherence and InfinityTopoi (open); shared objects: module categories of one algebra and of animated rings — owner EnhancedDerivedSheaves E5; the fppf stacks, quotient stacks, abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations; ∞-topos theory and the sheaf criteria — owner the InfinityCategoryTheory family; the quasi-coherent formalism in the !-topology — owner AnalyticStacks Layer 1, later in the order, a consumer of 2.2; DiamondsAndVStacks shares nothing.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AnalyticStacks, the named consumer, is later than that placement. None of the roadmaps barred as suppliers is cited. Both gaps name a supplier and a section on main, state one `needs` sentence with its hypotheses, and ask for nothing a supplier, Mathlib or Tau Ceti states.

### Shape, principles, headlines

- 8 layers, each ending with Examples and Dependencies; 33 subsections, each with exactly one *Needs* line and at least 3 Checks (script). The plan has 33 targets, each with a locator and at least 3 tests.
- Scan (script): no LaTeX delimiters, `set_option`, process words, pull-request numbers, machine paths or `lemma` as a keyword (the two hits are "Shapiro's lemma").
- No algorithm, no sorry'd data, no route-specific shortcut, no re-planned roadmap. The README names its sources and does not say it follows one.
- Headline theorems (Summary): flat hyperdescent (3.2) with 3.3; affine pushforward (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). Each is a target with hypotheses and locators; statability at the pins is the package stage's question.

Source independence: 13 passages compared with 6 sources (8.2 with BZFN 3.2 and 3.9; 8.3 with BZFN 3.20–3.24 and with Stacks 0FXR, 0FXT, 0BQR; 8.5 with HR-perf lines 28–29 and HNR lines 436–439; 4.1 with Stacks 0245; 6.3 with SAG 6.2.6.2; 6.4 with SAG 9.1.5.1; 2.3 with SAG 6.2.3.4; 1.5 with HA 4.6.1.11 and 4.7.5.3; 8.1 with Stacks 09IS), none shared beyond what a statement forces (at most six consecutive words, "is stable and admits small colimits"); largest share SAG, 59 of 144 locators by a pattern count; contents compared with SAG §§6.2.1–6.2.6 and 6.3.1–6.3.4 (SAG lines 17016–17027): independent. Layer 2 joins 6.2.2 and 6.2.6 with its own 2.4–2.5; Layer 3 joins D.6 with 6.2.3; Layer 4 (6.3) precedes Layer 5 (6.2.4) because 5.4 needs 4.2; Layer 6 joins 6.2.5, 6.2.6 and 9.1; Layers 1, 7 and 8 have no counterpart there.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests were read at the heads of the index of 2026-11-15; they can move before they merge.
- Outside this round's sample and untouched by the repair: the source locators of 1.2–1.4, 2.1, 2.2, 2.4, 3.1–3.4, 5.3, 5.4, 6.1, 6.2, 7.3 and 8.4 were not reopened; for them I rely on the rows of rounds 11 to 14 that carry line numbers. Stacks chapter numbers (29, 35, 36, 96) were not checked against the online numbering, only the tags and the numbers within each chapter.

## Source issues

- none

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0b5f6f136384354beb85b7d835b8fb9e809e0850", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~15", "model": "fable", "worker": "chris-x52"} -->
