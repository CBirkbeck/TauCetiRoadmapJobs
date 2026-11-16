# FIX-RT-InertAnticyclotomicCMMainConjecture~2

Red-team round 2, passes a and b, on the board pull request of `InertAnticyclotomicCMMainConjecture`. Ten findings, eight sections (two overlaps merged). Only `packages/InertAnticyclotomicCMMainConjecture/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## RT-InertAnticyclotomicCMMainConjecture~2a/F01 (P2) — applied

§4.2 route: the contradiction argument in AHII05's step order (lines 222–231) → a direct proof. The kernel of localisation on S_rel is S_str. The image in ℋ has rank one, so S_str=0. S_rel/C is torsion and ℋ/ℋ^ε is free, so S_ε=S_rel. S_(−ε) then localises into ℋ^ε∩ℋ^(−ε)=0, so it lies in S_str=0. The ranks of X_s come from §4.1.

Verified: AHII05 lines 222–231 read; the new order shares no step sequence with it. I left the first Check of §4.2 unchanged: it remains true ("if S_str had rank one, S_rel/S_str would be torsion inside ℋ, hence zero") and agrees with the new first step.

## RT-InertAnticyclotomicCMMainConjecture~2a/F02, RT-InertAnticyclotomicCMMainConjecture~2b/F03 (P3) — applied

§5.2: "the integral splitting H=ℋ⁺⊕ℋ⁻ of §3.3" → "the integral splitting ℋ=ℋ⁺⊕ℋ⁻ of §3.3".

Pattern search: I grepped for H followed by =, /, ^, ⊕ or a sign. The only other hit is line 47, "H=K", which really is the Hilbert class field, so it stays.

## RT-InertAnticyclotomicCMMainConjecture~2a/F03, RT-InertAnticyclotomicCMMainConjecture~2b/F01 (P2) — applied differently

§3.4: added the derivation rank X_rel=2−1+0=1 from 0→S_str→S_rel→ℋ→X_rel→X_str→0, the limit of SelmerIwasawaCohomology §2.19, as 2a asked. The statement "specialisation is X_rel up to the errors of SelmerIwasawaCohomology §3.3" → "maps onto X_rel with kernel killed by a power of ϖ_R". The route proves this by restriction control (SelmerIwasawaCohomology §3.11). Added a Check.

Why this differs from the suggested repair: SelmerIwasawaCohomology §3.3 is descent for Iwasawa cohomology complexes. It does not compare discrete Selmer groups along K̃∞/K∞. 2b's replacement text also takes for granted, without saying why, that the comparison errors are torsion. The new route gives the reasons:
- the global errors have coefficients in H⁰(Θ∞,W)=0;
- the local errors at v|f lie in H¹ with coefficients in W^(I_v), which is finite because φ is ramified at v.

*Needs* of §3.4: SelmerIwasawaCohomology §3.3 → §3.11.

## RT-InertAnticyclotomicCMMainConjecture~2a/F04 (P3) — applied

§5.2 *Needs*: deleted "SelmerIwasawaCohomology §3.11; ".

Verified at the supplier head: §3.11 is global Selmer restriction control (a snake lemma on Sel→H→I). §5.2 is local at 𝔭, and its injectivity is inflation–restriction, ArithmeticGaloisDuality §R02.2.2, which is still listed. The Layer 5 Dependencies keep §3.11 for §§5.3 and 5.6.

## RT-InertAnticyclotomicCMMainConjecture~2a/F05 (P3) — applied

§3.4: "Hyp(K∞,V) of §8.2 holds with τ=1, because V is one-dimensional" → "the record Hyp(K∞,V) of §8.2 holds with τ=1". Its two clauses do not involve admissibility: τ=1 fixes μ_(p^∞), (O_K^×)^(1/p^∞) and K(1), V/(τ−1)V=V is one-dimensional, and a one-dimensional V is irreducible over G_(K∞). The same remark went into the EulerSystemsAndKolyvaginSystems contract.

Verified at the supplier head: §8.2 opens "Let K∞/K be admissible". Its clauses (i) and (ii) do not use admissibility. §8.11 drops only the no-complete-splitting assumption from §8.25.

## RT-InertAnticyclotomicCMMainConjecture~2b/F02 (P3) — applied

§3.4: "Torsion-freeness of S_rel follows from H⁰(K∞,W)=0" → "follows from H⁰(K∞,T′⊗_R L/R)=0". The vanishing is proved over Ψ∞: the tame group acts on T′/ϖ_RT′ by κ̄^p, which again has order p²−1. The two-variable sentence was changed the same way. A Check gives κ̄ against κ̄⁵ at p=5, and α against ᾱ at Frobenius of (−1+2i).

Verified: AHI06 lines 374–378 use the divisible module of the lattice whose cohomology is taken. χ_cyc=N∘κ on inertia follows from LubinTateFormalModulesAndQuasiCanonicalLifts §2.5 and ClassFieldTheory Layer 6, both added to the *Needs* of §3.4. The other uses of H⁰(·,W)=0, in §3.3, at 𝔭 in §3.4 (dual to local H²_Iw of T′), and in §§5.2, 5.3 and 5.6, concern W and are correct. In §4.1 the limit passage cites H⁰ of W and I left it, as 2b also judged.

## RT-InertAnticyclotomicCMMainConjecture~2b/F04 (P3) — applied

§3.1: "twist … by the module T_0" → "tensor with a fixed R-basis t_0 of T_0 and send by NonordinaryCMSpecialValues §2.9". Another basis changes every c_a by one unit, so C is unchanged; this went in as an API bullet, and a Check shows that πt_0 gives (πL_p). §3.3: "c a nonzero constant" → "c∈R×", with the reason (t_0 against γ=per_φ(ω)/Ω through the inverse-different trivialisation). §4.5: "period and trace units" → "the unit c of §3.3".

Verified: NonordinaryCMSpecialValues §2.9 needs a basis of the coefficient lattice. §§2.4 and 2.7 form the normalised class with the R-basis γ of T_φ^∨.

## RT-InertAnticyclotomicCMMainConjecture~2b/F05 (P3) — applied differently

§2.1 now names ξ̃∈U∞*⊗_O R, whose image in V_R is ξ. §2.2 applies the gap to ξ̃, and δ_χ(ξ̃)=δ_χ(ξ) by AnticyclotomicLocalUnits §§0.5, 1.4. For y_a, the smoothing identity gives y_a=c·d_a·ξ, which is now in the §3.3 statement. No reciprocity is applied to y_a. §4.5 reads the coordinates c·d_a·L_p off that identity.

Why this differs from the suggested repair: applying the gap to a lift of y_a would still need NonordinaryCMSpecialValues §2.8 for the smoothed standard units. That section is stated for the normalised class of §2.7, and getting from one to the other is exactly the smoothing identity (NonordinaryCMSpecialValues §2.3: _az=(N(a)−σ_a)z, after the twist N(a)−φ(a)σ_a). That identity alone gives y_a, so reciprocity for y_a was redundant.

Pattern: §4.5 applied the gap to the images of loc(c_a) in the same way, and is repaired. The *Needs* of §§3.3 and 4.5 and the Layer 3–4 Dependencies drop the gap and NonordinaryCMSpecialValues §2.8. §§2.1 and 2.2 gain AnticyclotomicLocalUnits §0.5.

## Checks run

- **Elaboration.** `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no messages (4.8 s). The file is unchanged.
- **`#check` comparison.** `Suggested.lean` declares nothing (docstring and empty namespace), so there is no `#check @name` to compare and no binder to restore. Its docstring still names the four headlines of §§4.6, 4.2, 4.4 and 6.4. None of their statements changed.
- **Dependency check:**

      depcheck: 242 roadmaps, 2268 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The new edges are LubinTateFormalModulesAndQuasiCanonicalLifts §2.5, TauCetiRoadmap.ClassFieldTheory Layer 6, SelmerIwasawaCohomology §3.11 and AnticyclotomicLocalUnits §0.5. All four suppliers were already cited by this roadmap.
- **Citation resolver** on the edited README: no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures listed in the brief:** none.

## Adversarial pass on every changed statement

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 new route | model ℋ^ε=Λ_R, S_rel=(T), C=(T²), char X_str=(T) | loc injective; S_rel/C=(T)/(T²)≅Λ_R/(T), killed by T; loc(T)∈ℋ^ε; S_(−ε)=0; ranks X_ε=0+1+0=1, X_(−ε): 1−1+x−0=0 gives x=0 | holds | route rewritten |
| §4.2: "S_ε is the preimage of ℋ^ε" | first sequence of §4.1 at S_rel | S_s=ker(S_rel→ℋ/ℋ^s)=loc⁻¹(ℋ^s) | holds | cited |
| §4.2: only torsion-freeness of ℋ/ℋ^ε is used | ℋ/ℋ^ε=𝔪=(ϖ_R,T), torsion-free and not free | λ·loc(x)∈ℋ^ε still forces loc(x)∈ℋ^ε; with torsion in ℋ/ℋ^ε it would not (third Check) | consistent | none |
| §3.4 X_rel rank | ranks of S_str, S_rel, ℋ, image, X_str = 0, 1, 2, 1, torsion | 2−1+0=1; with image 0 instead: 2 | holds | route and Check added |
| §3.4 specialisation | Λ_(2)⊕Λ_(2)/(γ⁺−1) | rank 1, specialisation Λ_R² of rank 2 | specialisation can raise rank, so the derivation is needed | statement changed |
| §3.4 local error at v∣f | K=ℚ(i), p=7, f=(2+2i), v=(1+i) | inertia acts through μ_4; i−1 has norm 2 and −2 is a unit at 7, so W^(I_v)=0 | finite (here 0) | route |
| §3.4 global error | G_(Θ∞) on W[π] through Δ by κ̄ of order 24 (p=5) | H⁰(Θ∞,W)=0 | holds | route |
| §3.4 torsion-freeness module | p=5 and p=7 | κ̄^p has order 24/gcd(5,24)=24 and 48/gcd(7,48)=48; Frobenius of (−1+2i) in ℚ(i): α on W, 5/α=ᾱ on T′⊗L/R, α−ᾱ=4i a unit mod 7 | holds | route and Check |
| §3.4 Hyp(K∞,V), τ=1 | V of dimension 1 | dim V/(τ−1)V=dim V=1; irreducible; τ=1 fixes everything | holds | reworded |
| §3.1 basis t_0 | t_0, ut_0, πt_0 | c_a, u·c_a, π·c_a; ideals (L_p), (L_p), (πL_p); μ changes by e at (ϖ_R) | basis needed | statement, API, Check |
| §3.3 y_a=c·d_a·ξ | a=O_K; a=(−1+2i) in ℚ(i), p=7 | d_(O_K)=1−1=0 gives y=0; d_a(1)=5−α=6−2i, norm 40, a unit at 7; |αχ(γ_a)⁻¹|=√5≠5 | holds | route rewritten |
| §3.3 c∈R× | t_0 against γ; πt_0 | inverse-different trivialisation is a unit (§0.4); p²−1 is prime to p; πt_0 gives πc, not a unit | unit exactly for a basis | statement |
| §3.3 y_a∈V_R^ε | ξ∈V_R^ε (§2.3) | Λ_R·V_R^ε⊆V_R^ε | holds | derivation shortened |
| §2.2 descent of δ_χ | x=(σ−1)u, χ on Γ⁻; ψ nontrivial on Γ⁺ | δ_χ(x)=(χ⁻¹(σ)−1)δ_χ(u)=0; δ_ψ(x)=(ψ(σ)⁻¹−1)δ_ψ(u), nonzero in general | descent only for Γ⁻ characters, as stated | route |
| §4.5 coordinates | a=(α), α≡1 mod 6f, α≡2 mod p; L_p=T | d_a≡α(ᾱ−1)≡2 mod p, a unit; coordinates c·d_a·T generate (T); char(Λ_R/(T))=(T) | holds | route rewritten |
| §5.2 *Needs* | route steps | uses ArithmeticGaloisDuality §R02.2.2 and PadicMeasuresIwasawaAlgebras §4.3; no global Selmer control | edge unused | deleted |
| §5.2 ℋ | — | symbol only | — | renamed |

## For the maintainer

- `gap:wiles-reciprocity-every-local-unit` is now consumed only by §2.2 (Layer 2). Layers 3–4 reach it through §2.2. The gap entry in `design/plan.json` and its line under "Exact supplier contracts" are unchanged and still needed.
- No heading, layer, section number or Lean name changed, so no citing roadmap is affected. `Suggested.lean` declares no names.
- Ownership: the repairs add no carrier, comparison or foundational object. They use existing supplier sections only (SelmerIwasawaCohomology §§2.19, 3.11; NonordinaryCMSpecialValues §§2.3, 2.4, 2.7, 2.9; AnticyclotomicLocalUnits §§0.5, 1.4; LubinTateFormalModulesAndQuasiCanonicalLifts §2.5). I checked each one at its open head; the overlap index lists no other open pull request that changes this roadmap and no id it cites that another drops.
- No new source was needed; `sources.toml` is unchanged and no `needs-references.toml` was written.
- Neither review contained instructions addressed to the worker; nothing suspicious to quote.
