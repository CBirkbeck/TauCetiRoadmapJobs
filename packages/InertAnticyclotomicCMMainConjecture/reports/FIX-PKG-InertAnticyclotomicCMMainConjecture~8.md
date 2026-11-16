# Repair report: InertAnticyclotomicCMMainConjecture, review REV-PKG-InertAnticyclotomicCMMainConjecture~7

Files changed: `packages/InertAnticyclotomicCMMainConjecture/README.md`, `packages/InertAnticyclotomicCMMainConjecture/design/plan.json` (the `gaps` entry `elliptic-unit-euler-system` only). `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## F01 (P2) — applied differently

Verified at the head of the NonordinaryCMSpecialValues pull request: §2.1 (Kato's theta function), §2.2 (standard units of every modulus, norm compatibility along the p-tower only), §2.3 (integral smoothed zeta elements), §2.6 (twisted smoothing factor N(a)−ψ(a)σ_a), §2.9 (twist of Kummer towers). The gap asked for all of these.

Old → new: contract now cites §§2.1–2.3, 2.6, 2.9, and the gap asks only for the prime-to-p norm relation, for 𝔮∤6pa: factor 1−Frob_𝔮⁻¹ when 𝔮∤g, none when 𝔮|g. §3.1 builds the Euler system for (T′,𝒦_a,6pfa) here. Scope, §3.1 Needs, Layer 3 Dependencies and `plan.json` (`needs`, section NCM.1 → §2.2) were updated to match.

Where this differs from the suggested repair, and why:
- The congruence relation (RUB91 (1d)) is not requested. The Euler systems of EulerSystemsAndKolyvaginSystems §2.2 are defined by the corestriction relations alone, and §§3.4–3.5 use nothing else. Rubin's theorem is a separate gap.
- The case 𝔮|g (no Euler factor) is added. An Euler system indexed by every finite F⊂𝒦_a needs Cor_(F′/F)c_(F′)=c_F when F′/F adds no new ramified prime, and §2.2 gives that only for 𝔮=p.
- The step "the twisted classes form an Euler system for T′" is proved in §3.1 (route and API), so the gap stays minimal. The twist turns 1−Frob_𝔮⁻¹ into 1−φ(𝔮)⁻¹Frob_𝔮⁻¹, which is P(Frob_𝔮⁻¹|T′*;Frob_𝔮⁻¹) because T′*≅T has Frobenius φ(𝔮). A new §3.1 Check computes it.
- RUB91's (1c), p.28 (RUB91 line 171), is the corresponding relation in Kolyvagin's form, with exponent Frob(𝔩)−1, at primes split completely in F. The README says so rather than citing it for the 1−Frob⁻¹ form.
- I proved the relation for Kato's units myself, so the request is not false. Take E′=ℂ/g𝔮 with point 1=β+y. Then (E′,β)≅σ_𝔮⁻¹(ℂ/g,1) by the Artin relation, because E′/E′[𝔮]=ℂ/g and β≡1 mod g. So by the isogeny law of NCM §2.1, the norm of θ_(E′)(1) is θ_E(1)/θ_E(1)^(Frob⁻¹). When 𝔮|g the Galois orbit is the full E′[𝔮]-coset, which gives no Euler factor.
- Injectivity of units modulo gpⁿ, n≥1, is automatic because 0<N(u−1)≤4<p² (stated in the contract).

Ownership: NoncommutativeAndEquivariantIwasawa §4.3 states these relations only for a CM curve over ℚ at a split ordinary p, which forces h_K=1; the Scope now says so. ModularIwasawaMainConjecturesPartII §2.2 states them for every modulus, but it is later in the merge order (ORDER line 378 against 348), so it is not a supplier. That is the human question the review already raised.

## F02 (P3) — applied

Old → new: "the constructions of AHII05 §§2–4 hold … after passage to the φ-component" becomes a determinate statement, for F∈{H, K₀=H(E[p])} with G=Gal(F/K) of order h_K or h_K(p²−1):
- restriction gives H¹(K_n,W)≅H¹(FK_n,W)^G and carries the strict and relaxed Selmer groups of W onto the G-invariants;
- corestriction identifies the G-coinvariants for T′ and for the local groups at p;
- these identifications are compatible with restriction and corestriction in n, with localisation and with the pairings of §0.4.

The remaining sentences and the locators are kept, and "along H/K" now reads "along F/K".

The route now gives the inputs: inflation–restriction (ArithmeticGaloisDuality §R02.2.2), cor∘res=#G (§R02.2.3), and [K₀:H]=p²−1 from Lubin–Tate. §0.1 and ArithmeticGaloisDuality §§R02.2.2–R02.2.3 were added to the Needs line and to the Layer 3 Dependencies.

Checks recomputed: #G is 3 or 72 at K=ℚ(√−23), p=5, and the local degrees are 1 and 24. One part of the first Check was false and is replaced: it said that when 5|h_K "restriction can have a kernel", but for F=H we have W^(G_H)=E(H)[p^∞]⊗R=0, so H¹(G,0)=0. The Check now says only that #G is not invertible.

## F03 (P3) — applied

Old → new: "Show that these distribution factors generate the unit ideal … or retain the precise correction divisor" becomes a committed argument. The factor of a is N(a)−φ(a)σ_a (NonordinaryCMSpecialValues §2.6), and its image N(a)−φ(a)γ_a is congruent to N(a)−φ(a) modulo (ϖ_R,γ−1). Take a=(α) with α≡1 mod 6f and α≡2 mod p: the residue is α(ᾱ−1)≡2, a unit.

I added a Check (α≡1 mod p gives a residue of 0) and put §2.6 in the §4.5 Needs line and the Layer 4 Dependencies. The twisted factor matches my own computation: σ_a x⊗t=φ_p(σ_a)·σ_a(x⊗t) when T_0 carries φ_p⁻¹. The same α is used in NCM §2.7.

## F04 (P3) — applied

Old → new: §1.4 now defines Sel_a(K_n,V_T) for a∈{str,+,−,ord}, with Sel_ord written Sel:
- the condition at 𝔭 is 0, or the image of A_n^s⊗L, or the image of F(Ψ_n)⊗L under the rational Kummer map;
- the condition at v∤p is H¹((K_n)_v,V_T), which is 0 (§1.3, BKO21 lines 870–872);
- Sel_a(K_n,V_pE) and its χ-part are defined when E is over K.

New API bullet: the image of the rational group is the divisible part of Sel_a(K_n,W). This gives corank = dimension and identifies the dual equivariantly.

The new route proves the API bullet, because SelmerIwasawaCohomology §§2.5–2.6 give propagation but not the corank comparison. It uses the finite cokernel of H¹(V)→H¹(W) (ArithmeticGaloisDuality §R02.4.4), saturation (§2.6) and cofinite generation (§2.18), so §2.18 was added to the contract and the Scope.

Every place that uses these groups now points to §1.4:
- the Conventions paragraph;
- §5.3, where "rational signed Selmer group" becomes Sel_s(K_n,V_pE)^χ;
- the §5.6 and §6.4 routes, whose Needs lines and the Layer 5–6 Dependencies no longer list SelmerIwasawaCohomology §§2.5–2.6 directly.

## F05 (P3) — applied differently

Old → new: "a change of the place above 𝔭 in K_n" becomes "ι_p replaced by ι_p∘g, g∈G_K". This keeps the place, conjugates the decomposition group by g, and changes (K_n)_𝔭=Ψ_n by the image of g in Gal(Ψ_n/Φ). The route adds that L_n^s is stable under Gal(Ψ_n/Φ), via λ_χ(hy)=χ(h)λ_χ(y).

The suggested wording, "a change of the embedding … that induces the unique place of K_n", also covers embeddings that conjugate K. Those change the CM embedding, which §1.2's last Check excludes, so the statement is restricted to g∈G_K. A new Check at n=2, p=5 shows that a non-stable O-line would move, because ζ₅∉ℤ_25.

## Checks run

- `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is unchanged: `import Mathlib`, the module docstring and an empty namespace. No `TauCeti.*` import, so nothing needed building first.
- `#check @name` comparison: the file declares nothing, so there are zero cases and nothing changed. No Lean name of this roadmap's own is backticked in the README.
- Dependency check, complete output:

```text
depcheck: 241 roadmaps, 2252 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. The newly cited roadmap, NoncommutativeAndEquivariantIwasawa (ORDER line 30), and the new NonordinaryCMSpecialValues sections (line 345) are both earlier than this roadmap (line 348).
- `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- Style grep (process words, LaTeX delimiters, pull-request numbers, machine paths) on the README and `plan.json`: no hits. `plan.json` parses, and its five gap slugs match the README.

No gate failures were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| Gap: norm relation, 𝔮∤g | Kato units on E′=ℂ/g𝔮, 1=β+y; 𝔮=(λ), λ≡1 mod g | Orbit {β+z: z≠0}; product over E′[𝔮] is θ_E(1); (E′,β)=σ_𝔮⁻¹(E,1), so norm = θ_E(1)^(1−Frob⁻¹). Principal case: Frob=1, norm 1 = z⁰ | Holds; exponent 1−Frob⁻¹ (RUB91 has Frob−1 for other units: cited as "corresponding") |
| Gap: norm relation, 𝔮∣g | K=ℚ(i), g=(3), 𝔮=(3), p=7 | Degree N𝔮=9, orbit all of E′[3], norm = θ_E(1), no factor | Holds; case added |
| Injective units mod gpⁿ | ℚ(i): u=−1,±i; ℚ(√−3): ±ω^k | N(u−1)∈{4,2,2}; {3,4,1,3,1}; all ≤4<25≤p² | Holds |
| Twisted Euler factor (§3.1 Check) | K=ℚ(i), p=7, f=(2+2i), α=−1+2i | α−1=i(2+2i); trivial character: twisted 1−ᾱ/5=(6+2i)/5≠0, untwisted 1−1=0 | Holds; Check added |
| Euler factor of T′ | T=ℤ_p(1) (ESKS §2.2 check); T′ | P=1−x gives 1−Frob⁻¹; T′*≅T with Frobenius φ(𝔮), P=1−φ(𝔮)⁻¹x | Agrees with the twist computation |
| Admissibility of (𝒦_a,6pfa) | 𝔮∤6pfa | K(𝔮)⊂K(f𝔮p)⊂𝒦_a; K(p^∞) contains the ℤ_p²-extension; a Frobenius off p is nontrivial there | Holds |
| §3.2 restriction iso | K=ℚ(√−23), p=5; h_K=1; n=0 | #G=3, 72; H^i(G,p-primary)=0 because #G is a unit; G trivial gives the identity | Holds |
| §3.2 corestriction | M=H¹(FK_n,T′) | cor∘res=#G∈ℤ₅×; res∘cor=N_G: M_G≅M^G | Holds |
| §3.2 old Check "kernel when 5∣h_K" | F=H | W^(G_H)=E(H)[p^∞]⊗R=0 because [H(E[p]):H]=p²−1>1 | False; Check reworded |
| §4.5 unit factor | K=ℚ(i), f=(2+2i), p=7; p=5 | α≡2 mod 7: 4−2=2≢0; α≡1 mod p: residue 0; u≡1 mod 6 means u=1, so a≠O_K | Holds; Check added |
| §4.5 factor convention | x⊗t, T_0 with φ_p⁻¹ | σx⊗t=φ_p(σ)σ(x⊗t), so N(a)−σ_a becomes N(a)−φ(a)σ_a, matching NCM §2.6 | Holds |
| §1.4 rational, n=0 | A_0⁺=0, A_0⁻=F(Φ) | Sel_+=Sel_str, Sel_−=Sel (V_T), as for W | Holds; Check added |
| §1.4 corank | Model Sel(W)=L/R⊕R/ϖ_R | Corank 1 = dim Sel(V) = 1; finite summand invisible | Holds |
| §1.4 dual / characters | x∈Sel(V)^χ | (γf)(x)=χ(γ)⁻¹f(x), so the dual of the χ-part is the χ⁻¹-specialisation, matching §5.3 | Holds |
| §1.4 v∤p condition | Good v with α≡q | H¹(V)=0, image 0; H¹(W)≠0, so relaxed ≠ propagated | Holds; Check added |
| §1.2 ι_p change | n=0; n=2, p=5 | Gal(Ψ_0/Φ) trivial; order 25; 20 characters of order 25 cut out A_2^−; u=ζ₅∉ℤ_25 | Holds; Check added |
| §6.4 route | E(Ψ_n) | E/E₁ finite, so E(Ψ_n)⊗ℚ_p=F(Ψ_n)⊗ℚ_p | Holds |

## Ownership and overlaps

- Checked by object:
  - elliptic-unit norm relations: NonordinaryCMSpecialValues, NoncommutativeAndEquivariantIwasawa §4.3, EulerSystemsAndKolyvaginSystems, ModularIwasawaMainConjecturesPartII;
  - rational Selmer comparison: SelmerIwasawaCohomology §§2.5–2.6, 2.9, 2.11, 2.18;
  - descent along prime-to-p extensions: ArithmeticGaloisDuality §§R02.2.2–R02.2.3.
- No earlier roadmap states the prime-to-p norm relation for every K, so the gap stays with NonordinaryCMSpecialValues, the owner of the units (§2.2).
- The rational Selmer groups and the descent statement are this roadmap's own applications, stated with their supplier inputs.
- The overlap listing for this roadmap: no other pull request changes it, no cited id is dropped, and no id is defined only by a revision.

## For the maintainer

- The `elliptic-unit-euler-system` entry in `design/plan.json` now has section `§2.2` (was `NCM.1`) and the narrowed `needs`. The README gap line carries the same slug.
- The `inert-two-variable-main-conjecture` entry still names section `NCM.1`; it was not touched in this round.
- NonordinaryCMSpecialValues is now cited both by its former identifiers (NCM.k/…, which its head maps by a table of the former numbering) and by its current section numbers (§§2.1–2.3, 2.6, 2.9). Both resolve.
- No id of this roadmap changed (headings and section numbers are unchanged), so no consumer citation breaks.
- Nothing suspicious was found in the review text. Its "For the human reviewers" section was not acted on.
