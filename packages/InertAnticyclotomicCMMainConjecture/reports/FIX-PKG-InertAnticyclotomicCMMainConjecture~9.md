# Repair report: InertAnticyclotomicCMMainConjecture, review REV-PKG-InertAnticyclotomicCMMainConjecture~8

Files changed: `packages/InertAnticyclotomicCMMainConjecture/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged; no gap was added or changed.

## F01 (P3) — applied differently

Old → new: §3.1 no longer states or argues “the localisation of C lies in H^ε”. Its fifth API bullet is deleted, bullet 2 is now “Every c_a belongs to C.”, and §2.1, §2.3, NCM.1/elliptic-reciprocity and NCM.3/forced-central-zero are dropped from its *Needs:*. §3.3 now states loc(C)⊂H^ε, C⊂S_ε and loc(c_a)≠0 for a≠O_K (AHII05 Proposition 3.1, p.614), with the derivative route and a Check.

Verified first: the loop is real. Before the edit, §3.1 *Needs:* had no §3.3 and no §0.5, but its route reads derivatives on V_R. §3.3 *Needs:* listed §3.2, and §3.2 listed §3.1. The cycle was 3.1 → 3.3 → 3.2 → 3.1. AHII05 line 151 (p.614) states both the membership and the nontriviality of the image of C. Its proof (lines 154–162) is the reciprocity-law argument that is now §3.3's route.

How this differs from the suggested repair, and why:
- **Nonvanishing added to §3.3.** §3.3 also states that loc(C) is nonzero, with loc(c_a)≠0 for every a≠O_K. The reason is F02: §2.1's bullet “ξ is the localisation of an element of C” moves to §4.5. Without it, the routes of §3.4 (“Nonzero localisation of an elliptic-unit class (§2.3 with §3.3)”) and §4.2 (“C⊂S_ε is nonzero (§§2.3, 3.1)”) would rely on a Layer 4 fact. AHII05 Proposition 3.1 states the nontriviality in the same sentence as the membership.
- **The §3.3 route.** It makes the reciprocity step explicit. By NonordinaryCMSpecialValues §§2.3 and 2.6, c_a is the twisted smoothing factor d_a=N(a)−φ(a)γ_a applied to an a-independent zeta element. Hence δ_χ(y_a)=c·d_a(χ⁻¹)·δ_χ(ξ) for every finite χ, with c≠0 independent of χ and a.
  - Membership: this vanishes on Ξ^(−ε) by §2.3, so §0.5 applies.
  - Nonvanishing: d_a(χ⁻¹)≠0 because its two terms have complex absolute values N(a) and √N(a).
  - So §3.3 *Needs:* lists §§2.2, 2.3 and NonordinaryCMSpecialValues §§2.3, 2.6, NCM.1/elliptic-reciprocity. It does not list NCM.3/forced-central-zero, which enters only through §2.3.
  - §§0.1, 0.3 and 0.4 were also added. The route already used them (labels through §0.3, the period and trace normalisations), but they were missing from the line.
- **§4.2 and §3.4.** §4.2 now cites “(§3.3)” alone (not “§§2.3, 3.3”) and says “contradicting §3.3”, and §2.3 is dropped from its *Needs:*. §3.4's route cites “(§3.3)”, and §2.3 is dropped from its *Needs:*. Neither target uses §2.3 any more.
- **Layer 3 Dependencies.** AnticyclotomicLocalUnits §4.3 is added. NCM.3/forced-central-zero is removed, since no Layer 3 *Needs:* line names it now.

Pattern search: every use of “loc(C)⊂H^ε”, “C⊂S_ε” and “nonzero localisation” was checked: §§3.1, 3.3, 3.4, 4.2, 4.4 and 4.5, the §4.2 Check, and the §4.4 and §4.5 Checks. §§4.4 and 4.5 already list §3.3. A parse of every *Needs:* line shows no cycle and no forward reference in any of the 36 targets.

## F02 (P3) — applied

Old → new:
- §2.1 bullet 2: “ξ is the localisation … of a specified element of C” → “ξ is the image of a specified norm-compatible global family … retained with ξ; its relation to C is §4.5”.
- Route sentence and Check 3 likewise.
- §4.5 states the C-relation.
- §3.1 drops §2.1.
- Layer 3 introduction reworded.

Verified first. Before the edit, §2.1 *Needs:* (“§0.1; §0.2; §0.5; …”) listed none of §§3.1, 3.3, 4.5, while §3.1 listed §2.1. The fact holds only because the factor d_a=N(a)−φ(a)γ_a is a unit of Λ_R for a=(α), α≡1 mod 6f, α≡2 mod p. That is §4.5's computation: d_a ≡ α(ᾱ−1) ≡ 2 modulo (ϖ_R, γ−1).

Changes in detail:
- **§4.5 statement.** The reviewer's sentence referred to “the ideal a of the route”. The statement now names a=(α) and defines γ_a itself, so it does not depend on its route: “for a=(α) with α≡1 modulo 6f and α≡2 modulo p, N(a)−φ(a)γ_a … is a unit of Λ_R, and ξ is, up to the period and trace units of §§0.1 and 0.4, the image under §3.3 of loc((N(a)−φ(a)γ_a)⁻¹·c_a)”. §2.1 is added to §4.5 *Needs:*.
- **§2.1 route.** “Keep the global elliptic-unit class and its local projection in the comparison diagram of §3.1” → “Keep the global family together with its local projection; §4.5 compares it with the module C of §3.1”.
- **§2.1 Check 3.** “the localisation of an element of C” → “the localisation of a global class”.
- **Layer 3 introduction.** “and the primitive class of §2.1” → “the supplied elliptic units and the special values of the primitive class (§§2.2–2.3)”. Here I did not use the suggested “and the supplied elliptic units” alone, because §3.3 now uses §§2.2–2.3 (F01).

Consistency: §4.5's new sentence agrees with the §3.3 route. From y_a=c·d_a·ξ, the image of loc(d_a⁻¹c_a) is cξ. The unit claim for c is the existing §4.5 route's “up to the period and trace units”.

## F03 (P3) — applied

Old → new: §1.5 “(AHII05 §2, pp.612–613, and §3, p.615, before Proposition 3.3)” → “(AHII05 §2, pp.612–613, for the Selmer groups and their limits; §3, p.614, before Proposition 3.1, for H and H^s; §3, p.615, before Proposition 3.3, for X_a)”.

Verified against AHII05:
- lines 85–126 (pp.612–613): the Selmer groups and their limits;
- line 146 (p.614, before Proposition 3.1): the two local limits;
- line 175 (p.615): the duals X_*.

Pattern search: every other AHII05 p.614 and p.615 locator in the README was checked: Conventions; §§0.3, 0.4, 2.3, 3.2, 3.3, 3.4 and 3.5. Each cites a proposition, remark or equation on its correct page. None needed a change.

## Checks run

- **Elaboration.** `lake env lean packages/InertAnticyclotomicCMMainConjecture/Suggested.lean` was run from the content checkout. Result: exit 0, no output, no warning, about 22 s. The file is unchanged: `import Mathlib`, one module docstring and an empty namespace.
- **`#check @name` comparison.** It has zero cases, because no declaration exists. No `TauCeti.*` import was needed and no Lean process was left running.
- **Dependency check**, complete output:

  ```text
  depcheck: 238 roadmaps, 2257 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Internal *Needs:* graph.** All 36 lines were parsed: no cycle and no reference from a target to itself or to a later section.
- **House-style scan of the diff.** No LaTeX delimiters, machine paths or process wording.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.3: d_a(χ⁻¹)≠0 for a≠O_K | K=ℚ(i), p=7, f=(2+2i), a=(−1+2i); a=O_K | α−1=i(2+2i), so α≡1 mod f; N(a)=5; d_a(1)=5−α=6−2i, norm 40; \|αζ⁻¹\|=√5≠5 at every χ. For a=O_K, d=1−1=0 and c_(O_K)=0 | Holds for a≠O_K; fails at a=O_K | Statement restricted to a≠O_K; Check added |
| §3.3: loc(C)⊂H^ε | ε=+: χ of order p² (c=3, Ξ⁻) and order p (c=2, Ξ⁺); ε=−: χ=1∈Ξ⁺=Ξ^(−ε) | Order p²: δ_χ(ξ)=0, so δ_χ(y_a)=0. ε=−, χ=1: L(φ̄,1)=0 by the functional equation, so δ_1(y_a)=c·d_a(1)·0=0 | Holds | Route in §3.3 |
| §3.3: label | Swap H^s↔V_R^(−s) | y_a∈V_R⁻ would need δ_χ(y_a)=0 on Ξ⁺, but it is nonzero for almost all χ∈Ξ⁺ (ε=+) | Swap excluded | Check added |
| §3.3: C⊂S_ε | A compatible system (x_n) with (loc x_n)∈lim L_n^(ε,⊥) | Each loc x_n∈L_n^(ε,⊥), so each x_n∈Sel_ε(K_n,T′) | Holds (AHII05 line 152–153 states the same) | — |
| §3.3: smoothing twist | g acting on x⊗t with t∈T_0 | g(x⊗t)=gx⊗φ(g)⁻¹t, so (σ_a x)⊗t=φ(a)σ_a(x⊗t) and (N(a)−σ_a)↦N(a)−φ(a)σ_a | Agrees with NonordinaryCMSpecialValues §2.6 and §3.1 | — |
| §4.5: unit factor | α≡1 mod 6f with α≡2 mod p, at p=5 and p=7; α≡1 mod p | Residue α(ᾱ−1)≡2·1=2, a unit in 𝔽_25 and in 𝔽_49; with α≡1 mod p the residue is 0 | Holds for the stated a | Statement made self-contained |
| §4.5: ξ from C | y_a=c·d_a·ξ (§3.3) | image of loc(d_a⁻¹c_a) is d_a⁻¹y_a=cξ; d_a⁻¹c_a∈C because C is a Λ_R-module | Holds | — |
| §2.1 bullet 2 | n=0 (modulus fp) | The family starts at f p; the normalised classes are global by definition | Holds | Rewritten |
| §§3.4, 4.2 routes | Torsion-free S_rel, C≠0 | rk C≥1; S_rel/S_str torsion ⇒ zero localisation, contradicting loc(C)≠0 | Holds | Citations → §3.3 |
| §1.5 locator | AHII05 lines 146, 175 | p.614 against p.615 | Corrected | — |

## Ownership and overlaps

- **Ownership.** Nothing was added that another roadmap could own. The membership and nonvanishing of loc(C) are applications to the inert datum, and they move within this roadmap.
- **Suppliers.** All supplier sections now cited in §3.3 were already cited in the README and resolve at their heads: AnticyclotomicLocalUnits §4.3; NonordinaryCMSpecialValues §§2.3, 2.6 and NCM.1/elliptic-reciprocity. NonordinaryCMSpecialValues maps the former NCM.1 numbering to §§2.7–2.10 in its own table. Both suppliers are earlier in the merge order.
- **Open pull requests.** The overlap listing has no other pull request changing this roadmap and no dropped id. Ownership against the open roadmap pull requests was checked through `roadmaps resolve` and the existing citations; no new object was introduced.

## For the maintainer

- **Section ids and names.** No section id, target or Lean name changed, so no other roadmap's citation is affected.
- **Section content.** Two sections changed content within their own ids:
  - §3.3 now owns the statement that loc(C) lies in H^ε and is nonzero (formerly in §3.1).
  - §4.5 now owns the statement that ξ is, up to units, the localisation of an element of C (formerly an API bullet of §2.1).
- **Downstream citations.** The two consumers in “Downstream consumers” cite neither statement by section.
- **Suspicious text.** None was found in the review.
