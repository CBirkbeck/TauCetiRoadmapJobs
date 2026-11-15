# FIX-PKG-PadicLocalLanglandsForGL2QpPartII~6

Files changed: `packages/PadicLocalLanglandsForGL2QpPartII/README.md`, `Suggested.lean` (module docstring only), `design/plan.json` (top-level `gaps` only: one entry added). `sources.toml` and `metadata.toml` are unchanged. Every new locator is in DLB17, CDN20 or CDN23, which the manifest already records, so no fetch was needed and no `needs-references.toml` was written.

## F01 (P1) — applied differently

Old: §7.3 "Three lines. Varying the residual representation in CompletedCohomologyAndLocalGlobalCompatibility §6.4 gives three forms with pairwise distinct lines." New: `gap:three-period-line-globalisation` on CompletedCohomologyAndLocalGlobalCompatibility §6.4 (README supplier contract, plan `gaps`); new §3.3(iii) proves the Hyodo–Kato line comparison at every level from it; §7.3 and §4.7 consume §3.3(iii).

The finding is right. That roadmap's §6.4 (README at #1270, lines 2276–2299) gives one form. Its proof picks one Serre weight. DLB17 lines 2773–2775 claim a second line only, and lines 2776–2781 then use unmarked extension classes. Varying the residual representation does not give three lines either. V_(M,ℒ) determines its residual semisimplification, so distinct residual representations do give distinct lines. But there are only finitely many semisimple two-dimensional k_L-representations of G_ℚ_p, because ℚ_p has finitely many extensions of bounded degree. By pigeonhole, infinitely many lines in ℙ¹(L) share one residual representation.

Why "differently":
- **The contract is intrinsic.** It asks for three forms whose Galois representations have pairwise non-isomorphic restrictions to G_ℚ_p. By the bijection of §0.3 this is equivalent to three distinct lines, and it avoids the phrase "in the same identified M_dR".
- **The contract is not limited to depth zero.** It covers every supercuspidal π with central character trivial on p.
- **Repair of the pattern.** The same missing input was used silently at every level, in three places:
  - §4.7 said that W_(M,ℒ) ≅ (Π^an_(M,ℒ))′_b "follows from §3.3(ii)". But W is the preimage under the map of §4.1, which is the Hyodo–Kato identification of ProetaleCohomologyOfPAdicCurvesAndTowers §7.4. §3.3(ii) is only an abstract isomorphism with the line condition, and the two differ by an unknown A ∈ GL(M_dR).
  - §4.12 feeds this ℒ into §4.13's kernel X⁺_st(M) ∩ (ℒ⊗C).
  - The Galois-socle theorem rests on both.
  - The sources have the same gap. CDN20 Propositions 0.9 and 2.9 (lines 343–354 and 952–954) attribute the Hyodo–Kato line property to DLB17 Théorème 1.4. That theorem's isomorphism comes from Théorème 11.7 (DLB17 lines 2711–2716), and DLB17 compares it with Hyodo–Kato only at the first cover (Remarque 11.13). This is recorded as source correction E21.
- **The comparison moved to §3.3(iii).** It is stated for every M ∈ ΦNᵖ_n at every level, with this route:
  - three forms from the gap;
  - the Hyodo–Kato step at level n, using the models of Proetale §7.2, the Hochschild–Serre spectral sequence of log-rigid cohomology, Saito §R18.4.24a and §R18.3.29(c);
  - one line from each form, using §4.9 and §2.7 of that roadmap, the uniformisation and PadicHodgeTheory §8.1;
  - the scalar conclusion.
- **§7.3 now has two steps.** First, Teitelbaum's model gives the Hyodo–Kato structure. Second, §3.3(iii) at n = 1 gives BS(ℒ) = Π^an_ℒ.
- **Other edits:** the §4.7 and §4.12 routes cite §3.3(iii); E10 is updated; the §7.3 check on ρ_π versus r_g moved to §3.3, where r_i is now defined; the Scope, *How to read*, Layer 3 and Layer 7 Dependencies and the Needs lines of §3.3 and §7.3 are updated.

Ownership: ProetaleCohomologyOfPAdicCurvesAndTowers (board package, line 42) assigns "the Breuil–Strauch comparison" to the base §6.9 and this Part II. The base §6.9 (#1312, from line 2311) states no Hyodo–Kato comparison. So this roadmap owns §3.3(iii).

## F02 (P2) — applied

Old: §1.5 "For V in the family of π, construct …"; §1.3 was defined on locally analytic Π. New: §1.3 is defined for any L-linear representation of P (Banach included, every prime). §1.5 covers every absolutely irreducible two-dimensional V at every prime, with domain the Banach Π(V). Its formula uses trace and determinant of the Sen operator. The family is a specialisation. §1.2 is dropped from its Needs.

Evidence:
- DLB17 line 1472 fixes an arbitrary absolutely irreducible two-dimensional V.
- Définition 7.4 (lines 1473–1499) takes v ∈ Π(V).
- Proposition 7.6 (lines 1535–1543) and Théorème 7.3 (line 1460) are stated in that generality.

Checks added:
- V₀(1): weights {1,2}, det χ³; a⁻ = 2−∇; Casimir 0.
- Sen polynomial X² − c with c a non-square: the coefficients stay in L.

Other places: the Layer 1 preamble and the *How to read* sentence now say that the model is general. Layer 1 Dependencies and §1.5 Needs gain base §3.8 and PadicHodgeTheory §4.4. Consumers §§1.7, 2.2, 2.4 and 3.2 use the family specialisation, which is unchanged.

## F03 (P3) — applied

Old: the §5.4 Check used "the integral Steinberg classes Sp_1(O_L)^* on one copy of Ω" as a G-stable image. New: the Check uses p = 5, L = ℚ_5 and the diagonal classes (μ, μ). They are G-stable because g(μ, μ) = (gμ, gμ), and fixed by G_ℚ_5. The negative control: for g = diag(5,1) and μ = δ₀−δ_∞, g(μ,0) = (0,μ). The argument that the dual has no finite G-stable subgroup is kept.

Other places: the §3.1 Check (line 480) already uses the component swap correctly. The §6.6 Check already uses the diagonal. The §5.1 Check uses one copy only for u(5^j), with det = 1, which preserves components, and asserts no G-stability. None of these was changed.

## F04 (P2) — applied

Old: "Every map from the compact P_B factors through a finite-length block quotient". New (CDN23 lines 2779–2836, pp. 72–74): compactness reduces to lim_k Hom(P_B,(Y/p^k)^∨); at fixed k, σ = (im φ)^∨ is finitely generated and locally of finite length, so φ factors through (Y_B/p^k)^∨; the centre actions agree and J kills Y_B; take lim_k, then invert p.

Evidence: CDN23 lines 2798–2803, 2818–2824 and 2830–2836. Check added: P_B is not of finite length (base §5.3, Checks); ℤ_p/p^k has length k but its limit ℤ_p does not have finite length; a torsion quotient has zero image in Y^d. §6.4 Needs gains base §§5.1 and 5.3. The other uses of the compactness of P_B (the §5.3 API and the §5.4 route) target compact pieces or a fixed torsion stage, and were left as they are.

## Checks run

- **Elaboration.** `lake env lean` on `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. The only import is `import Mathlib`, so no Tau Ceti build was needed.
- **Binder check.** The file declares no named declaration, so the `#check @name` comparison has nothing to compare and nothing changed. Only the module docstring changed: the §3.3 bullet now names the Hyodo–Kato compatibility and Hyodo–Kato cohomology as missing carriers.
- **Dependency check.** Output in full:

      depcheck: 245 roadmaps, 2244 edges, 0 problem(s)

  It exited 0, with no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve` on the README.** Cross-roadmap citations found nowhere: none. Lean names found nowhere: none.
- **New citations checked at their heads.**
  - CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9 and 6.4 (#1270).
  - ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1, 7.2 and 7.4 (board package).
  - Base §§0.1, 3.8, 3.11(iii) and 5.3 (#1312).
  - HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.5.16 and R18.5.21, and PadicHodgeTheory §8.1: both were already cited.
  - Source locators: CDN20 lines 343–354, 917–919, 952–954, 1761 and 1874; CDN23 lines 2411–2416 and 2779–2836; DLB17 lines 1460, 1472–1543, 2711–2716 and 2731–2781.
- **Ownership against open pull requests.** I searched with `roadmaps grep` over main and the 475 open heads for "Breuil–Strauch" and the P-finite Kirillov model. The only hits are the base (#1312: its §6.9 heading and its §4.9 compactly supported P-finite space, which is a special case of §1.3 and already cited), ProetaleCohomologyOfPAdicCurvesAndTowers, which defers this content to this roadmap, and unrelated uses. No second owner.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.3 P-finite on any P-representation | zero representation; trivial representation; Banach Π(V) | 0 ∈ Π^P-fin; the trivial v is P-finite, and the trace power gives p^(nk)v ≠ 0, so v is not of infinite slope; DLB Définition 7.4 takes v ∈ Π(V) | holds | definition widened |
| §1.5 infinitesimal action | (a,b) = (0,1); V₀(1) with (1,2); Sen X²−c | a⁻ = −∇, u⁻ = −t∂², C = 0. Then a⁻ = 2−∇, C = 0. Then k = 0, ab = −c, C = (4c−1)/2. Identities checked: [a⁺,u⁺] = u⁺; [u⁺,u⁻] = 2∇−a−b+1 = h; C = ((a−b)²−1)/2 symbolically | holds | stated generally |
| §1.5 operator order | t⁻¹∇(∇−1) versus ∇(∇−1)t⁻¹ | t∂² = ∇t⁻¹∇ = t⁻¹(∇−1)∇, which is the first; the second is t⁻¹(∇−1)(∇−2) | README order correct | none |
| §3.3(iii) three lines | A = diag(1,2); A = diag(α,β) | fixes Le₁ and Le₂; e₁+e₂ ↦ e₁+2e₂; diag(α,β)(e₁+e₂) ∈ L(e₁+e₂) forces α = β | three needed and enough | Check added |
| §3.3(iii) residual variation | fixed L, k_L | Hom(G_ℚ_p, GL₂(k_L)) is finite; ℙ¹(L) is infinite, so lines share residual representations by pigeonhole | residual variation insufficient | Check, E10 |
| §3.3(iii) uniqueness of ι_HK | supercuspidal WD; WD = χ₁⊕χ₂ | End = L; End = L×L | uniqueness only for supercuspidal | Check added |
| §3.3(iii) injectivity of Φ_i | kernel K = (Π^an/X)′ | K ∩ π^⊥ = (X+π)^⊥ = 0, so X+π is dense and X∩π = 0; strictness makes X → Π^an/π onto, so a split, which irreducibility of Π excludes | holds | argument written |
| §3.3(iii) at n = 0 | level zero | no supercuspidal M (Ǧ/K_D(0) ≅ ℤ) | vacuous | none |
| §3.3(iii) weights of r_i | ρ_π versus ρ_π^∨ | Fil⁰D_dR(ρ_π) has dimension 2; Fil⁰D_dR(r_i) has dimension 1 | r_i is the contragredient | Check moved |
| §4.7 via §3.3(iii) | A non-scalar | §3.3(ii) alone gives (Π^an_(M,Aℒ))′ ≠ (Π^an_(M,ℒ))′ | needs (iii) | route repaired |
| §5.4 Check (F03) | p = 5, g = diag(5,1), μ = δ₀−δ_∞ | gμ = μ; g(μ,0) = (0,μ); g(μ,μ) = (μ,μ). A finite G-stable F ⊂ Sp_1(𝔽_5)^* gives a finite-codimension G-subspace F^⊥, contradicting irreducibility | diagonal G-stable | Check replaced |
| §6.4 route (F04) | identity of P_B; ℤ_p/p^k; a torsion source into Y^d | P_B has infinite length; length k at each stage but infinite in the limit; Hom(torsion, torsion-free) = 0 | fixed-k step needed | route replaced |
| §6.4 degenerate | R_(B,M) = 0; special M | I is the unit ideal, so m = 0; §6.2 | holds | none |
| §7.3 conclusion | dictionary ℒ ↔ ℒ^⊥ | e₁ ↦ e₂*⊗(e₁∧e₂) (§0.4 Check) | consistent | route rewritten |

## For the maintainer

- **New supplier gap.** `gap:three-period-line-globalisation` on CompletedCohomologyAndLocalGlobalCompatibility §6.4. That roadmap is an open pull request earlier in the merge order. The contract asks for three forms whose local Galois representations are pairwise non-isomorphic. That is stronger than DLB17 Théorème 5.5, and I know no published proof. Acceptance of §§3.3(iii), 4.7 and onwards, and so of the Galois-socle theorem, is conditional on it, as it already is on the three existing gaps.
- **Numbering.** No section, layer or source-correction number was removed or renumbered. E21 is new. §3.3 gained clause (iii). No roadmap cites this one.
- **Lean.** `Suggested.lean` still declares nothing, and no Lean name changed.
- **Suspicious text.** None was found in the review or in the material read.
