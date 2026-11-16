# Review of InertAnticyclotomicCMMainConjecture (pull request #2435 at 4e14b57)

**Verdict:** needs changes

## R01 (P2) — The §4.3 route applies the involution twice

**Location:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md:583`: "so BIL86 Theorem 3.22, pp.363–364, with Lemmas 3.18–3.21, computes the characteristic ideal of the quotient of the adjoint by γ⁺−1 as the involution of the characteristic ideal of the torsion submodule".

**Claim:** Theorem 3.22 has no involution. The route already puts the involution into the comparison of the strict dual with the adjoint ("composed with the involution"), so read as written, the two involutions cancel. The route then gives char(X_str)=char((X′_rel)_tors). After the symmetry this becomes char(X_str)=ι(char((X_rel)_tors)), which contradicts the statement of §4.3.

**Witness:** BIL86 Theorem 3.22 (p.363, line 601) equates the Λ₂-series of (M/(γ−1)M)_tors and of Ext¹_Λ(M,Λ)/(γ−1), with no involution. The involution comes from the twist on Ext¹ in Proposition 3.17 (p.361). For M=Λ_(2)/(γ⁻−1−a), both sides are (T−a), not (T−a′).

**Repair:** Replace "computes the characteristic ideal of the quotient of the adjoint by γ⁺−1 as the involution of the characteristic ideal of the torsion submodule of the quotient of the relaxed dual by γ⁺−1" by "shows that the quotient of the adjoint by γ⁺−1 and the torsion submodule of the quotient of the relaxed dual by γ⁺−1 have the same characteristic ideal over Λ_R, with no involution; the involution of the identity is the one in the comparison of the strict dual with the adjoint". On the instance M=Λ_(2)/(γ⁻−1−a), both sides are then (T−a), and the strict side is ι(T−a)=(T−a′), one involution, as in BIL86 Theorem 3.24.

## R02 (P3) — The route never reduces the two-variable comparison modulo γ⁺−1

**Location:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md:583`: "Over K₀K̃∞, compare the strict dual with the Iwasawa adjoint … composed with the involution (BIL86 Proposition 3.17, p.361, …)".

**Claim:** The comparison is made over Λ_(2), but the route uses it after taking the quotient by γ⁺−1, and it never states that the reduced map is still a pseudo-isomorphism over Λ_R. That does not follow from being a pseudo-isomorphism over Λ_(2). Billot proves this step separately, using that p is inert.

**Witness:** BIL86 p.364 (proof of Theorem 3.24) reduces the map of Proposition 3.17 modulo γ−1 using that p is inert: the local terms and T_p have finite quotients by γ−1. In general the step fails: Λ_(2)/(ϖ_R,γ⁺−1) is pseudo-null, but its quotient Λ_R/(ϖ_R) has characteristic ideal (ϖ_R).

**Repair:** Insert after "(… Iwasawa duality with the involution of SelmerIwasawaCohomology §3.12)." the sentence: "Reduce this comparison modulo γ⁺−1. Its error terms are built from the points of W and of W′ at the places above p and from their lattices. They are finitely generated R-modules on which γ⁺ acts by a scalar different from 1, so their quotients by γ⁺−1 are finite and their (γ⁺−1)-torsion is zero. The reduced map is therefore a pseudo-isomorphism over Λ_R (BIL86 proof of Theorem 3.24, p.364)."

## R03 (P3) — §3.2 is cited for descents it does not state

**Location:** `TauCetiRoadmap/InertAnticyclotomicCMMainConjecture/README.md:583`: "so it holds on the parts cut out by G with the coprimality needed only there, as in the remark after BIL86 Theorem 3.24; §3.2 identifies those parts with the modules over K∞ and K̃∞."

**Claim:** §3.2 identifies only W and T′ over the layers MK_n of K∞. The identity also needs the descent for W′, to reach X′_rel, and over the layers of K̃∞, to move its hypothesis on X′^(2)_rel to K₀K̃∞.

**Witness:** README lines 465–468 (§3.2): "G acts on the cohomology of W over MK_n". Its bullets treat H¹(K_n,W), Sel_str and Sel_rel of W, and the compact groups of T′. W′ and K̃∞ do not appear.

**Repair:** Replace "§3.2 identifies those parts with the modules over K∞ and K̃∞" by "the inflation–restriction argument of §3.2, which uses only that #G is prime to p, identifies those parts with the modules over K∞ and K̃∞, for W′ as for W and over the finite layers of K̃∞ as over the K_n".

## Previous findings

- R01 — repaired: "The comparison passes through a two-variable strict–relaxed identity, which this section also proves: Billot's theorem for E over K₀=H(E[p]) … Assume Leopoldt's conjecture … and that γ⁺−1 is prime to …" (line 579; Scope line 13). The new route has the defects R01–R03 above.
- R02 — not repaired: deferred (D01)
- R03 — repaired: "BKO21, proof of Theorem 6.2, p.963, uses the inequality without stating it, among the arguments it calls standard, and writes ord_χ throughout without comparing ρ with ρ⁻¹" (line 727).
- R04 — repaired: "`Suggested.lean` states no declaration: none of the headline theorems (§§4.2, 4.4, 4.6 and 6.4) is statable …"; "the targeted Lake build succeeds with no warning".

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §4.3 two-variable identity, setting | K=ℚ(√−23), p=5, K₀=H(E[5]) | K₀(E[p^∞])=K₀K̃∞; p∤[K₀:K] | [K₀:K]=3·24=72; image of G_(K₀) open in 1+5O≅ℤ₅², so K₀∩K̃∞=K and both are ℤ₅² over K₀ | holds |
| §4.3 Theorem 3.22 step | M=Λ_(2)/(γ⁻−1−a), a≠0 in 𝔪_R | quotient of adjoint: involution, (T−a′) | Ext¹(M,Λ_(2))≅M; quotient (T−a); (M/(γ⁺−1))_tors=(T−a); a′=(1+a)⁻¹−1≠a | fails: R01 |
| §4.3 net involution | ι∘ι on T | stated identity: one involution | T↦(1+T)⁻¹−1↦T; route's two involutions cancel; BIL86 Thm 3.24 has one | R01 |
| §4.3 reduction mod γ⁺−1 | N=Λ_(2)/(ϖ_R,γ⁺−1) | step not stated | N pseudo-null (dimension 1 of 3); N/(γ⁺−1)N=Λ_R/(ϖ_R), char (ϖ_R)≠Λ_R | R02 |
| §4.3 restriction step | γ⁺ acting by u≠1 on W≃L/R; decomposition groups D_w⊂ℤ_p | H¹ vanishes globally and locally | H¹(ℤ_p,W)=W/(u−1)W=0, W divisible; D_w trivial or open, u^(p^k)≠1 in torsion-free 1+pO | holds |
| §4.3 conditions away from p (§1.4) | K=ℚ(i), p=7, 𝔮=(−1+2i), α=φ(𝔮) | 0 equals Billot's unramified condition | H¹_ur=W/(α−1)W=0, since α−1=−2+2i≠0 and W divisible | holds |
| §4.3 W^τ≃W′ | same 𝔮, arithmetic Frobenius | character φ_p⁻¹χ_cyc | W^τ: ᾱ=−1−2i; W′: N𝔮/α=5/α=ᾱ | holds |
| §4.3 descent citation | §3.2, lines 465–468 | identifies W′ and K̃∞ parts | states W and T′ over MK_n only | R03 |
| §4.3 Leopoldt input | finite layers of K₀K̃∞/K₀ | abelian over K | K₀K̃∞ is abelian over K, so the Ax–Brumer gap covers every layer; K_1 dihedral over ℚ | holds |
| §5.5 locator | BKO21 lines 902–905, p.963 | used without statement; ord_χ only | "standard arguments" give ord_χL_p≥dim Sel_str^χ; no ρ⁻¹ comparison | holds |
| §6.1 locator, ord symmetry | BKO21 lines 894–896; p=5, f∈Λ_O | char(X_(−ε))⊆char(X_str); ord_(χ⁻¹)=ord_χ | containment stated, p.962; −1∈Gal(ℚ₂₅(μ₅)/ℚ₂₅)≅(ℤ/5)^× sends ζ₅−1 to ζ₅⁻¹−1 | holds |
| References, BKO21 Thm 6.1 note | BKO21 line 259 (p.948), lines 860, 881–882 | Λ=O⟦G⁻⟧; module with R-coefficients | Λ=O[[G⁻]] fixed p.948; W≅F[π^∞]⊗_O R, p.962 | holds |
| References, BIL86 locators | pp.350, 361–366 | as listed | (1)–(4) p.350; Prop. 3.17 p.361; Lemmas 3.18–3.19 p.362; 3.20–3.21, Thm 3.22 p.363; Thm 3.24 p.364; remark p.365; Prop. 3.26 proof p.366 | holds |

The rows for statements this change does not touch stand as in the previous review, of 920db3f.

- Source locators checked against the text: BIL86 13 (pp.350, 353, 359, 361–366). The formulas of pp.361–365 were read from page images of the cached Numdam scan, because the text extraction drops them. BKO21 5 (p.948 line 259; p.962 lines 860–896; p.963 lines 902–905).
- Cross-roadmap citations resolved: SelmerIwasawaCohomology §§3.10, 3.11, 3.12 and 3.20 at the head of its open pull request (the new §3.11 citation matches its restriction control). IntegralIwasawaTheory §4.4 and the gap slug are unchanged. Library declarations re-opened at the Tau Ceti pin: `LinearEquiv.charIdeal_eq_comap` (`RingTheory/Iwasawa/Char/Ideal.lean:152`) and `TauCeti.Iwasawa.IsPseudoIsomorphism.charIdeal_eq` (same file, line 125).
- Gate rerun at 4e14b57: every check 0, OK. Dependency check: "depcheck: 253 roadmaps, 2400 edges, 0 problem(s)". The diff outside the folder is empty, and the folder holds only README.md, Suggested.lean and metadata.toml.
- `lake env lean` on Suggested.lean: exit 0, no message. The file is unchanged since 920db3f and declares nothing, so there are no `#check` signatures to compare.
- Pull-request text against the head: the Suppliers paragraph (Billot's identity proved in §4.3), the six gaps, the ModularIwasawaMainConjecturesPartII sentence and the Validation paragraph all match. No finding.
- Remark on untouched text: the board plan's `gaps` lists four slugs. The README's gap:elliptic-unit-euler-system and gap:inert-two-variable-main-conjecture (lines 79, 81) are not among them, so the intake does not announce them (D01 concerns these two gaps).
- Overlap check: read ModularIwasawaMainConjecturesPartII, NonordinaryCMSpecialValues, AnticyclotomicLocalUnits (scope), SelmerIwasawaCohomology §§3.10–3.12, 3.20, and grepped every open head and main for Billot, the two-variable strict–relaxed torsion comparison and the Iwasawa adjoint. Billot's identity is owned only here. SelmerIwasawaCohomology §3.20 owns no-pseudo-null for ordinary Selmer duals, a different module. Other shared objects are as in the previous review (D01).
- Source independence: changed passages only. 9 passages compared with 2 sources (BIL86 pp.350–366, BKO21 pp.948, 962–963); nothing shared beyond forced terms; the longest overlap is the translated fact that E has good reduction at every place. Largest share BKO21, 32 of 94 source citations. The contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- BRU67, pp.121–124: waived in the manifest, cited by locator, not read.
- The proofs behind two inputs of the §4.3 route lie outside BIL86. Lemmas 3.19–3.20 are Perrin-Riou's thesis [6] (BIL86 pp.362–363). The absence of pseudo-null submodules is Greenberg [3], Proposition 5 (BIL86 pp.359, 366). Neither was read.

## Source issues

- **Misprint** in BIL86 at proof of Theorem 3.24, p.364: the source writes the strict Selmer module over a lower-case f∞ in the first displayed identity of the proof; it should be F∞, the ℤ_p²-extension F(E_(p^∞)); affects nothing.

## For the human reviewers

- BKO21 was read from an operator-held local PDF that carries JSTOR download terms (BKO21 line 375). README line 858 links a Caltech institutional copy instead.
