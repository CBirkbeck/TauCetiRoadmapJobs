# FIX-RT-InertAnticyclotomicCMMainConjecture~1

Repair of red-team round 1 (passes a and b). Ten findings, settled in eight sections: two pairs overlap (the `NCM.k/<slug>` ids, and the unused hypothesis of §5.2). The two reviews' reciprocity findings, 1a/F01 and 1b/F02, are about the same defect. They are settled by one edit but get separate sections, because 1b asked for a different repair.

## RT-InertAnticyclotomicCMMainConjecture~1a/F01 (P1) — applied

Verified: AnticyclotomicLocalUnits §4.3, at its head, opens with "For the projected class x∈U∞*⊗_O R", and its Layer 4 assumes the auxiliary field of §4.1, in which 2 splits. The README's "stated for every element of U∞*⊗_O R" was false. Old → new: the citation in §2.2 now asks for "§4.3 in the form requested as gap:wiles-reciprocity-every-local-unit". There is a new contract line under From TauCetiRoadmap.AnticyclotomicLocalUnits and a matching `gaps` entry (supplier AnticyclotomicLocalUnits, §4.3). The gap is cited in §§2.2, 3.3 and 4.5, their *Needs:* lines, the Dependencies of Layers 2–4, the ALU contract and Scope. §3.3 now says that ℋ≃V_R is the inverse of the Kummer map, which is review step 4.

## RT-InertAnticyclotomicCMMainConjecture~1b/F02 (P2) — applied differently

Same defect as 1a/F01 and settled by the same edit. Review 1b asked for the general-datum reciprocity to be stated here as a new target in §2.2, citing PadicHodgeRegulators §1.4. Not done. The roadmap's Scope makes AnticyclotomicLocalUnits the owner of the local theory, and its §4.3 is the only roadmap section that states Wiles reciprocity for the height-two Lubin–Tate units (a search of main and the open heads for Wiles or explicit reciprocity against Coleman derivatives finds only that section). A second statement here would give the object two owners. The statement is local, and the restriction to the projected class is a limit of how §4.3 is stated, not of its route. So the general form is requested from the owner as a supplier gap. Review 1b's witness (K=ℚ(i), p=7, f=(2+2i), where 2 ramifies) satisfies the gap's hypotheses, because the gap has no global datum.

## RT-InertAnticyclotomicCMMainConjecture~1b/F01 (P2) — applied

Verified. Λ_(2)/(γ⁺−1) is Λ_(2)-torsion, and its quotient by γ⁺−1 is Λ_R, of rank one. So the "ℤ_p²-extension … followed by descent" alternative does not prove that X_str is torsion. Old → new: the §3.4 route now uses EulerSystemsAndKolyvaginSystems §8.25 on K∞ itself, with:

- X_str identified with that section's X∞, by §1.3;
- Hyp(K∞,V) of §8.2, which holds with τ=1 since T′ has rank one;
- non-admissibility explained: a prime fixed by conjugation has trivial Frobenius in Γ⁻;
- Rubin's condition (*) of §8.11, proved at every prime 𝔮∤p.

The rank of S_rel follows from the Euler characteristic and Poitou–Tate. The two-variable rank one now comes from §8.25 over K̃∞ alone, and is not used for X_str. Two Checks were added: the ℚ(i), p=7 split-prime witness, and Λ_(2)/(γ⁺−1).

The reviewer asked for (*) to be confirmed at primes dividing f that are inert or ramified over ℚ. The proof given needs no case split, and it holds there. Modulo p^k each class is a corestriction of cup products of Kummer classes of the units _az_(fgp^m) with fixed elements of T_0/p^k. These are global units, because NonordinaryCMSpecialValues §2.2 states that _az_g is a unit when g has two prime divisors, and fgp^m does: f≠(1), since otherwise α=φ((α))=φ((−α))=−α. Their Kummer classes vanish on inertia, and the double-coset formula carries this through corestriction, whether or not T′ is ramified at 𝔮. *Needs:* gains §1.3, NonordinaryCMSpecialValues §§2.2, 2.9, EulerSystemsAndKolyvaginSystems §§8.1, 8.2, SelmerIwasawaCohomology §2.19 and ArithmeticGaloisDuality §§R02.4.3–R02.4.4. The ES contract and Scope now name §8.2.

## RT-InertAnticyclotomicCMMainConjecture~1a/F02, RT-InertAnticyclotomicCMMainConjecture~1b/F03 (P3) — applied

Verified at NonordinaryCMSpecialValues' head. No slug occurs there, and its table maps NCM.0–NCM.5 only to section ranges. Every id was replaced by the section, using the reviewers' table, with headings and contents checked:

| Old id | New section |
|---|---|
| NCM.0/cm-period | §0.4 |
| NCM.0/dual-tate-convention | Conventions (Duals and twists) and §2.4 |
| NCM.1/normalized-zeta-class | §2.7 |
| NCM.1/elliptic-reciprocity | §2.8 |
| NCM.1/period-change | §2.10 |
| NCM.2/inert-frobenius | §3.4 |
| NCM.2/semilocal-splitting | §3.3 |
| NCM.2/cm-lubin-tate | §3.5 |
| NCM.3/twisted-root-sign | §1.4 |
| NCM.3/forced-central-zero | §1.5 |
| NCM.5/central-nonvanishing | §6.4 |

This covers the 26 lines, including the Scope sentence. The standalone "(NCM.3/forced-central-zero)" in §2.3 became "(NonordinaryCMSpecialValues §1.5)", so that it is not read as this roadmap's §1.5.

The `gaps` section of inert-two-variable-main-conjecture went from "NCM.1" to "§§2.2–2.3", and the README contract now says "It extends §§2.2–2.3". Review 1b's two wording points:

- The twisted smoothing factor is now cited from §§2.6–2.7 (contract, §§3.1, 3.3, 4.5). Part of 1b's premise is wrong, though: §2.6's API bullet "Smoothed form" does state the σ_a form, for ψ. The change only adds §2.7's T_φ^∨(1) instance.
- §2.1's route now says that §2.7 gives integrality off the residual component, which covers the component used there.

## RT-InertAnticyclotomicCMMainConjecture~1a/F03 (P3) — applied

Verified. In §3.2, "F=K₀" and "Φ(F[π])" appear in the same Check. Old → new:

- §3.2: the field F becomes M (MK_n, MK∞, G_M, "M=H", "M=K₀"). The formal module F[π] is unchanged.
- The local Iwasawa modules H, H^s, H⁺, H⁻ become ℋ, ℋ^s, ℋ⁺, ℋ⁻ from §1.5 on: 96 occurrences on 29 lines, each bare H checked by hand. H stays the Hilbert class field.
- The same clash with a field F is repaired in §4.3 (a field F next to F[π^∞]; now δ(M,p), M=K) and in the IntegralIwasawaTheory contract and gap (δ(M,ℓ), O_M^×), including that gap's `needs` in plan.json.
- The `Suggested.lean` docstring now reads char(ℋ^ε/loc C) and says what ℋ^ε is.

## RT-InertAnticyclotomicCMMainConjecture~1a/F04 (P3) — applied

Verified at AHII05 lines 134–137. That paper twists ℤ_p(1) by the inverse cyclotomic character times ψ_p, landing in T_p(E). Here the twist is by T_0 (φ_p⁻¹), landing in T′. At Frob of (α), α=−1+2i, the two characters take the values α and ᾱ. Old: "this is the twist of AHII05 by the inverse cyclotomic character times the avatar". New: AHII05 twists instead by that character, landing in T_p(E) with character ψ_p. For a curve over ℚ the two lattices match only conjugate-linearly, through the Weil pairing, since c∘φ_p=φ_p⁻¹χ_cyc. Over a general R, the twist by T_0 is the one that lands in T′. No other place equates the two twists.

## RT-InertAnticyclotomicCMMainConjecture~1a/F05 (P3) — applied

Each edge was checked against its statement and route, and none is used. Deleted:

- PadicMeasuresIwasawaAlgebras §4.6 from §3.4, and from Layer 3's Dependencies, since no other §3.x uses it;
- SelmerIwasawaCohomology §3.11 from §4.1, and from Layer 4's Dependencies, since no other §4.x uses it;
- §4.1 from §4.3;
- §5.4 from §6.2.

Scope now lists SelmerIwasawaCohomology "3.10–3.12 and 3.16". The edges that the 1b/F01 repair added to §3.4 are each used by the new route.

## RT-InertAnticyclotomicCMMainConjecture~1a/F06, RT-InertAnticyclotomicCMMainConjecture~1b/F04 (P3) — applied

Verified: the statement and route of §5.2 are local at 𝔭. Its only global input is the integral splitting of §3.3, which holds for every inert CM datum. Old → new:

- §5.2: "Assume E is defined over K. For s…" becomes "For every inert CM datum, s∈{+,−} and n≥0, …".
- The Layer 5 preamble: "§§5.2–5.4 and 5.6" becomes "§§5.3, 5.4 and 5.6", and 5.2 joins 5.1 and 5.5 with the reason.
- Conventions now name the targets that assume descent (§§5.3, 5.4, 5.6, 6.2–6.4).

Review 1a's side note on §5.3 is left as it is: its V_pE clause uses the hypothesis.

## Checks

- **Elaboration.** `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`, run from the content checkout, exits 0 with no output. The file declares nothing (0 declarations: a docstring and an empty namespace), so the `#check @name` comparison has no case. I checked that and did not build a scratch file. Only the docstring changed (ℋ^ε). The imports (`import Mathlib` only) and the absence of `set_option` are unchanged.
- **Dependency check.** Output: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. New edges: AnticyclotomicLocalUnits (line 347 of ORDER.txt), EulerSystemsAndKolyvaginSystems (105) and NonordinaryCMSpecialValues (345). All three were already suppliers and come before this roadmap (348).
- **`roadmaps resolve`** on the edited README: no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures listed in the brief:** none.

## Adversarial pass on changed or added statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Gap wiles-reciprocity-every-local-unit | n=0, p=5; x=0; R=O versus O[√π] | coefficient π⁻¹=−1/5, as in AnticyclotomicLocalUnits §4.3 Check; x=0 gives 0=0; R=O with x the projected class is §4.3 itself; the formula is R-linear in x | consistent with the supplier; no global datum |
| §3.4: inert or ramified primes split completely in K∞ | K=ℚ(i), p=7: 𝔮=(1+i) and 3O_K | c fixes 𝔮 and inverts Γ⁻, so Frob=Frob⁻¹; Frob²=1 in ℤ_7, so Frob=1 | split completely; non-admissible |
| §3.4 Check: same primes over K̃∞ | norms 2 and 9 in ℤ_7^× | 2⁶=64=1+63, and 63 is not divisible by 49; 9³=729=1+728, 728=7·104, not divisible by 49; neither is a root of unity | infinite image in the cyclotomic quotient; admissible |
| §3.4: (*) through unit-ness | f=(1+i)³, p=7, modulus fgp^m | two prime divisors, (1+i) and 7, so a unit (NonordinaryCMSpecialValues §2.2); f=(1) gives α=−α | holds at every 𝔮∤p, including 𝔮=(1+i), where T′ is ramified |
| §3.4: Hyp(K∞,V) | τ=1, dim_L V=1 | V/(τ−1)V=V, of dimension 1; a one-dimensional V is irreducible | holds |
| §3.4: classes unramified outside S | v=(2+i) in ℚ(i), Nv=5 | the Frobenius acts on T_0 by φ(v)⁻¹, of absolute value 5^(−1/2)≠1; T_0^(Frob=1)=0 | S_rel=lim_cor H¹(G_(K_n,S),T′) |
| §3.4 Check: non-descent | M=Λ_(2)/(γ⁺−1) | M is killed by γ⁺−1≠0; M/(γ⁺−1)M=Λ_R, rank 1 | the old route fails; the new one avoids it |
| §3.4: two-variable rank | ranks in the strict–relaxed sequence | 0 (strict) → 1 (relaxed) → 2 (local) → X̃_rel → torsion; X̃_rel has rank 2−1+0=1 | agrees with the statement |
| §3.1: AHII05 twist clause | K=ℚ(i), α=−1+2i | ψ_p gives α; φ_p⁻¹χ_cyc gives 5/α=ᾱ=−1−2i; c(α)=ᾱ | the twists differ, conjugate-linearly; clause corrected |
| §3.3: ℋ≃V_R inverse to Kummer | x=0; rescaling by u∈Λ_R× | 0↦0; a rescaled comparison would change δ_χ(y_a) by u(χ⁻¹), which the stated normalisation excludes | pins the map |
| §5.2 without descent | K=ℚ(√−23), p=5, n=0, 2 | n=2: coranks 20 (s=+) and 5 (s=−) = deg Φ_25 and deg (γ−1)Φ_5; n=0: L_0⁺=0=L_∞⁺[1], corank of L_0⁻=1=deg(γ−1) | the route applies for h_K=3 |
| §2.1: integrality component | p=5, residual character on Δ | ρ̄ restricted to Δ is a power κ^5 or κ^7 of the order-24 Lubin–Tate character, of order 24, so not trivial; NonordinaryCMSpecialValues §2.7 names the augmentation and Δ-invariants component as covered | ξ∈V_R |
| NonordinaryCMSpecialValues sections | the 11 sections | headings and statements read at the head (§0.4 period; §1.4 W(φνχ)=(−1)^c W(φν); §1.5 forced zero; §2.7 class; §2.8 reciprocity; §2.10 period change; §3.3 splitting; §3.4 φ((p))=−p; §3.5 Honda at π=−p; §6.4 nonvanishing) | match the uses |
| Renames F→M, H→ℋ | each occurrence | 96 ℋ occurrences on 29 lines, by pattern and by hand; "Φ(F[π])" and "F(Ψ_n)" left as the formal module | no change of meaning |

## For the maintainer

- **New supplier gap for AnticyclotomicLocalUnits, slug wiles-reciprocity-every-local-unit, §4.3.** It asks for Wiles reciprocity for every x∈U∞*⊗_O R, with no auxiliary field. The other gaps are unchanged, except that the section of inert-two-variable-main-conjecture is now §§2.2–2.3 of NonordinaryCMSpecialValues.
- **Changed notation.** No Lean name changed and `Suggested.lean` declares none. The local Iwasawa module is now ℋ (also ℋ^s, ℋ⁺, ℋ⁻), and the descent field of §3.2 is now M. ModularIwasawaMainConjecturesPartII and CMRankZeroConverse cite this roadmap but use neither symbol.
- **Ownership.** Checked against main and the open roadmap pull requests listed in the brief. No new construction is owned here: the reciprocity form is requested from its existing owner.
- **No source was fetched or requested.** AHII05 lines 134–137 were read from the cache. `needs-references.toml` was not written.
