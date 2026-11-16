# FIX-PKG-ShimuraVarietiesPartII~10

This round settles the two findings of `REV-PKG-ShimuraVarietiesPartII~9`. I checked both against the cached KZ and KPZ texts and against the supplier roadmaps at their heads. Both are correct about the defect.

- **F01** is applied differently. The repair cites the roadmap that already owns the result, and declares no new supplier gap.
- **F02** is applied as asked. The same correction is also carried to the three places that relied on the old reference.

Only `packages/ShimuraVarietiesPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-ShimuraVarietiesPartII~9/F01 (P2) — applied differently

**Change.** In §5.3, "very-good lattice-chain embeddings of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.13–3.17" → GeometricSatakeAndFusionPartII §7.7 (good embedding) and §2.8 (trace form), with the hypotheses checked for G_3 and the KZ Lemma 4.1.4 globalization through a totally real K′. The `*Needs:*` line, Layer 5 Dependencies, the supplier contract and the scope paragraph changed with it. Three Checks were added.

**Verified.** The defect is real.

- FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13 assumes (NE): no Dᴴ factor and no wild type A.
- Its §3.16 starts "In the nonexceptional setting".
- Its §§3.14 and 3.17 treat only `Res GO⁺`, `Res GU⁺` and their explicit scalar enlargements.
- A strongly acceptable target may have Dᴴ factors (KZ line 1495, Proposition 4.2.3(1)).
- KZ gets the good embedding of G_3 another way. Lemma 4.3.8(2) (KZ line 1798–1803) uses Lemma 4.1.4 (KZ line 1277–1282). That lemma uses Proposition 3.1.12 (KZ line 926–936), which rests on Proposition 3.1.9 and Lemma 3.1.10 (KZ line 875–916).
- The old sketch cited §§3.13–3.17, while the old `*Needs:*` line listed only §3.13 and §3.16.

**Why not the literal repair.**

1. *The result already has an owner.* The review says no roadmap states KZ Propositions 3.1.9 or 3.1.12. That is wrong. GeometricSatakeAndFusionPartII states both:
   - §7.7, "Good embeddings for acceptable Hodge data", states KZ Proposition 3.1.9 with Lemma 3.1.10. Its hypotheses are p>2, an acceptable Hodge-type datum, p∤|π₁(G^der)| and an R-smooth centralizer of a maximal F̆-split torus. Its conclusion is a good integral Hodge embedding of a stabilizer scheme whose neutral component is the given parahoric. It allows a wild splitting field and has no (NE) hypothesis.
   - §2.8, "Trace symplectic restriction of scalars", states the form of KZ Proposition 3.1.12: the trace form on V^r is nondegenerate and alternating, and it is preserved by the subgroup with a common F^× multiplier.
   - `roadmaps grep --fixed 'Proposition 3.1.9'` and `'Proposition 3.1.12'` find these at that roadmap's head.
   - It is at position 208 of the merge order, before this roadmap (363), and is already a supplier here.
   - A gap asking FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII for the same theorem would give it a second owner.
2. *The suggested gap could not be met in merge order.* The suggested text leaves the stabilizer closed immersion (KZ Proposition 2.4.10) to ReductiveGroupsPartIII (gap:rg3-stabilizer-closed-immersion). But the gap's own conclusion, a good embedding of the stabilizer scheme, needs that immersion. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII is at position 132 and ReductiveGroupsPartIII at 240, so the supplier would depend on a later roadmap. GeometricSatakeAndFusionPartII §7.7 gets that input from ReductiveGroupsPartII, which is on main (its gap:r-smooth-full-fixer-embeddings).

**The repaired §5.3.**

- *Statement.* G_3^fix=G_3°, and (G_3,X_3) has a Hodge embedding that is good with respect to G_3° (KZ Lemma 4.3.8).
- *Sketch, hypotheses of §7.7 checked for G_3:*
  - G_3,Qp is acceptable, because G_3^ad=G_2^ad is a product of restrictions of scalars of split groups (§2.1).
  - p∤|π₁(G_3^der)|, because π₁(G_3^der)=π₁(G_1^der) is a 2-group (§2.6) and p>2.
  - Z_(G_3) is an extension of G_m by Z^c_(G_2)×Z^c_(G_1), a product of Weil restrictions of tame tori. So it is R-smooth (gap:rg3-r-smooth-tori), and then so is the centralizer (gap:rg3-r-smooth-abelian-type).
- *Sketch, the symplectic upgrade:* §2.8 turns the §7.7 embedding into a symplectic one.
- *Sketch, globalization:* the local embedding comes from a global Hodge embedding on (V_3⊗K′)^r with K′ totally real, having one place above p and completion K there.
- *Locator.* The citation gains "Lemma 4.1.4, p.29, with Propositions 3.1.9 and 3.1.12, pp.19–21, for the good embedding".
- *`*Needs:*` line.* Drops FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13 and §3.16. Adds §2.1, §2.6, gap:multiplier-exact-sequences, and GeometricSatakeAndFusionPartII §7.7 and §2.8.
- *Checks added.*
  - K′=Q(√2) for K=Q_25: totally real, 5 inert.
  - Negative control: K′=Q(√−2), whose complex place makes the traced form indefinite.
  - Negative control: K′=Q(i), in which 5 splits.

**Other edits.**

- §2.6 now states explicitly that π₁(G_der) is a 2-group, trivial without Dᴴ factors (KZ Proposition 4.2.3(1), KZ line 1495). Its locator already covers this. The old text listed the other properties of the KZ cover but not this one, which §5.3 now uses.
- The GeometricSatakeAndFusionPartII supplier contract gains §7.7 and §2.8. It also records that §7.7's goodness (its §0.6) is KPZ Definition 3.4.4, the notion of Conventions.
- The scope paragraph names these two sections as owned there.

**Pattern.**

- I searched the README for §3.13, §3.16, §§3.13–3.17, "good embedding", "good integral" and "Lemma 4.1.4". The only other use of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.13–3.17 is Layer 2 (§§2.3–2.4 and its Dependencies). That use is correct: Layer 2 builds very-good covers for the cases those sections cover, and §2.4 uses §§3.14, 3.15 and 3.17 for Dᴴ.
- In Layer 5, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13 and §3.16 entered only through §5.3. They are replaced in Layer 5 Dependencies by GeometricSatakeAndFusionPartII §7.7 and §2.8.
- No `gaps` entry was added. There are 21 slugs in the README, 21 contracts and 21 in `design/plan.json`, and the two sets are equal.

## REV-PKG-ShimuraVarietiesPartII~9/F02 (P3) — applied

**Change.** §3.8 gains the continuous G_2(A_f^p)-action (KPZ line 3742). It also gains: "at a level K_2^p that is not sufficiently small, the model is [S_(K_2,p°K_1^p)/(K_2^p/K_1^p)] for sufficiently small normal K_1^p, formed as in §0.2" (KZ §4.1.5, §4.3.5). It has three Checks; its Needs line gains §0.2 and SchemeAndStackFoundations §§1.17–1.23.

**Verified.**

- §0.2 forms the stack only from the Hodge models of §0.1.
- The model of a strongly acceptable triple is the descended model of §3.8. KZ defines its stack as the quotient of the pro-level model by K_2^p (KZ line 1753–1754, §4.3.5). For a general level, KZ uses the same quotient, or equivalently the quotient by K^p/K_1^p for neat normal K_1^p (KZ line 1299–1303, §4.1.5).
- KPZ Theorem 7.2.21 gives the pro-level scheme its G_2(A_f^p)-action (KPZ line 3742). Finite étale transitions and the local-model property hold at sufficiently small levels (KPZ line 3737 and 3749). So §3.8 needed the action stated in order for the finite quotient to make sense.

**Pattern.** Three other places named §0.2's stack for a strongly acceptable or abelian-type model:

- Conventions: "arbitrary prime-to-p level is treated by the quotient stack of §0.2" → §0.2 for Hodge-type models and §3.8 for abelian-type models.
- §7.1: "the non-neat Shimura stack of §0.2" → "the integral stack of §3.8 at a level that is not neat (the quotient stack formed as in §0.2)".
- §7.6: "(the stack of §0.2 when K^p is not neat)" → "the integral model of §3.8 (its quotient stack, formed as in §0.2, when K^p is not neat)". Its `*Needs:*` line gains §3.8; the statement named §0.2 without listing it.

Layer 3 Dependencies gains §0.2. Layer 7 Dependencies already lists §3.8 and §0.2. §6.3 speaks of "the Shimura stack" of the §3.10 model and needs no change.

## Checks run

- **Elaboration.** `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, 9.7 s. The file was not changed. It has `import Mathlib` only, so nothing needed building.
- **`#check @name` comparison.** `Suggested.lean` has 0 declarations, so there was nothing to elaborate and nothing changed. Its module docstring names the headlines §3.8 (KPZ Theorem 7.2.21) and §7.6 (a point `y` of the integral model over `𝔽_q`). Both still agree with the README: the non-small-level stack does not change the carriers the docstring says are missing.
- **Dependency check** (the prescribed command with `--movable`), exit 0:

```text
depcheck: 244 roadmaps, 2290 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The new supplier edge, GeometricSatakeAndFusionPartII (position 208), is earlier than this roadmap (position 363).
- **Citation resolver** on the edited README, against main and 456 open heads: no cross-roadmap citation and no Lean name found nowhere.
- **Mechanical checks.** Gap slugs: README 21, contracts 21, `design/plan.json` 21, sets equal. Residue grep for LaTeX, process words, pull-request numbers, paths and `lemma`: the only hits are the prose "Krasner's lemma" (new, §5.3) and "the unit-eigenvalue lemma" (§7.4), neither of them a keyword.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §5.3 good embedding without (NE) | strongly acceptable target with a Dᴴ factor | FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13 assumes (NE), so it does not apply; GeometricSatakeAndFusionPartII §7.7 needs p>2, acceptability, p∤\|π₁\| and R-smoothness, with no (NE) | old route fails, new route applies | §7.7 cited |
| §5.3, p∤\|π₁(G_3^der)\| | Dᴴ cover with π₁=Z/2; p=3, 5 | \|π₁\|∈{1,2,4,…}; 3∤2, 3∤4, 5∤4 | holds for every p>2 | §2.6 states the 2-group |
| §5.3 acceptability | G_2^der ≅ ∏Res_(F_i/Q_p)H_i split, p=3 with a D₄ factor | G_3^ad=∏Res H_i^ad, split over F_i (the trivial extension, which is tame); KZ Remark 3.1.3 restricts only non-split D₄ at p=3 | acceptable | none |
| §5.3, R-smooth centre (ranks) | G_1=G_2=GU(1,1), E=Q(i), p=5 | G_3={(g,gz): z∈U(1)}≅GU(1,1)×U(1), dim 5+1=6; Z_(G_3)=Res_(E/Q)G_m×U(1), rank 3; Z^c_(G_3)=U(1)×U(1), rank 2; quotient G_m, rank 1; 3=2+1. At 5 split all three are split | R-smooth | none |
| §5.3, degenerate torus case | G_ad=1, CM torus T | π₁(T_der)=0; acceptable (empty product); X_*(T)_I torsion-free gives T^fix=T° | applies | none |
| §5.3, global field, positive | K=Q_25=Q_5(√2) | squares mod 5 are {0,1,4}; 2 is not a square, so 5 is inert in Q(√2); K′⊗R=R², form Ψ_3+Ψ_3, definite | qualifies | Check 1 |
| §5.3, complex place | K′=Q(√−2), same completion Q_25 (−2≡3 not a square) | x=a+b√−1 gives `2(Ψ_3(a,h(i)a)−Ψ_3(b,h(i)b))`; for a=b≠0 the value is 0, so the form is indefinite | totally real needed | Check 2 |
| §5.3, single place | K′=Q(i), p=5 | −1≡4 is a square; 5=(2+i)(2−i); K′⊗Q_5=Q_5×Q_5, not a field | one place needed | Check 3 |
| §5.3, multiplier | g∈G_3(Q) with c(g)=c∈Q^× | Tr_(K′/Q)(Ψ_3(gx,gy))=Tr(cΨ_3(x,y))=c·Tr(Ψ_3(x,y)); for split planes with multipliers 1 and 2 there is no common multiplier (GeometricSatakeAndFusionPartII §2.8 Check) | Q-rational multiplier | none |
| §5.3, ownership and merge order | owners of KZ Propositions 3.1.9/3.1.12 and 2.4.10 | GeometricSatakeAndFusionPartII §7.7, §2.8: position 208 < 363. Suggested owner position 132 < ReductiveGroupsPartIII 240 | suggested gap unsatisfiable in order | cite §7.7, §2.8 |
| §2.6, 2-group clause | GU(1,1)-type target (no Dᴴ); a Dᴴ target | G_der=SL₂, π₁=0; a Dᴴ cover has π₁ a 2-group (KZ line 1495) | holds | clause added |
| §3.8, trivial quotient | K_1^p=K_2^p sufficiently small | quotient by the trivial group equals S_(K_2,p°K_2^p) | holds | Check 1 |
| §3.8, independence | K_1^p, K_1′^p, K_1″^p=K_1^p∩K_1′^p | transition is a finite étale K_1^p/K_1″^p-torsor; [S_(K_1″)/(K_2/K_1″)] ≅ [S_(K_1)/(K_2/K_1)] by quotient in stages; a coarse quotient keeps only points | holds; coarse model excluded | Check 2 |
| §3.8, inertia | GU(1,1), Q(i), p=5, i∈K_2^p | i·ī=i·(−i)=1; O_E^×={±1,±i} has order 4; (x,gi)=(x,ig)~(i⁻¹x,g)=(x,g); i_5 lies in the hyperspecial K_5; at neat K_1^p, Z(Q)∩K_5K_1^p=1, so ⟨i⟩ injects into K_2^p/K_1^p | stack inertia ⊇ Z/4 | Check 3 |
| §3.8, Hecke action | KPZ Theorem 7.2.21 | the pro-level scheme has a G_2(A_f^p)-action (KPZ line 3742); finite étale transitions and the local model at sufficiently small levels (KPZ line 3737, 3749) | stated | added |
| §7.1, §7.6, Conventions | model of a strongly acceptable triple | KZ line 1753–1754: S_K2=S_(K2,p)/K_2^p, from Theorem 4.2.6, not from the §4.1 Hodge normalization | reference now §3.8 | edited |

## Ownership, sources and untrusted text

- **Ownership against open pull requests.** I checked by object with `roadmaps grep` over main and the open heads. Good embeddings for acceptable data and the trace symplectic form are owned by GeometricSatakeAndFusionPartII §§7.7 and 2.8, and are cited. The integral stack at non-small level is part of this roadmap's §3.8 model, and no other roadmap owns it. No declaration of `Suggested.lean` was added or renamed.
- **Sources.** No source was fetched. `sources.toml` is unchanged; the KZ locator already covers §§3–5. No `needs-references.toml` was written.
- **Untrusted text.** The review contained no instruction to run commands or to act outside this job. Its "For the human reviewers" section was read but changed nothing. It names GeometricSatakeAndFusionPartII as the alternative owner, and that is the owner this round cites.

## For the maintainer

- Cross-roadmap names are unchanged. This roadmap now consumes GeometricSatakeAndFusionPartII §7.7 and §2.8. Renumbering those sections there would break §5.3, the supplier contract and Layer 5 Dependencies.
- **Pre-existing, not changed.** gap:multiplier-exact-sequences asks ShimuraData for the multiplier sequences of a Hodge-type datum with G^ad Q-simple (KPZ §7.2.4, KPZ line 3425). KZ Lemma 4.3.8 applies the sequence to G_3, whose adjoint group G_2^ad need not be Q-simple, and so do §§5.2–5.3. The proof of KPZ Lemma 7.2.5 (KPZ line 3435–3442) does not use simplicity. A later round may widen that contract.
- **Pre-existing, not changed.** Conventions cite FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.10 for "good and very good". That roadmap defines "good" in its §2.1 and "very good" in §2.10. The notion is the same KPZ Definition 3.4.4 as GeometricSatakeAndFusionPartII §0.6, and the new contract text says so.
- **Possible second owner (not actionable here).** KZ Proposition 2.4.10, the stabilizer closed immersion, is requested from two roadmaps. GeometricSatakeAndFusionPartII asks ReductiveGroupsPartII (gap:r-smooth-full-fixer-embeddings), whose README puts that proposition outside its scope. This roadmap asks ReductiveGroupsPartIII (gap:rg3-stabilizer-closed-immersion, the wider form used in §2.5).
