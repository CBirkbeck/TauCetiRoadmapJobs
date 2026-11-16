# FIX-RT-ShimuraVarietiesPartII~1

This round repairs the two red-team reviews RT-ShimuraVarietiesPartII~1a and ~1b. There are 13 findings: one P1, four P2 and eight P3. a/F06 and b/F05 overlap and are settled together. All 13 findings are right. Two were applied in a different form than the reviewer proposed, for the reasons given below.

Files edited:
- `packages/ShimuraVarietiesPartII/README.md`
- `packages/ShimuraVarietiesPartII/sources.toml`: three new sources, PaRa24, PaRa26 and DvHKZ, fetched by the sources service from arXiv (open repository).
- `packages/ShimuraVarietiesPartII/design/plan.json`: the `needs` of four entries of the top-level `gaps` list, and the `section` of two of them.

`Suggested.lean` and `metadata.toml` are unchanged.

## RT-ShimuraVarietiesPartII~1a/F01 (P1) — applied differently

Old: §1.6 strict comparison, §1.7 an undefined "canonical model", §1.8 DVR extension.

New:
- §1.6 is now the DVR extension.
- §1.7 is now canonical integral models: Definition (a)–(d), three Checks, a uniqueness/functoriality theorem and a Hodge-type existence theorem.
- §1.8 is now the strict comparison, consuming §1.7.

gap:integral-local-shimura now lists only local items (i)–(vi). §5.1 cites §1.7 and the local ad-isomorphism item.

**Verification.** The witness holds:
- KPZ Remark 7.1.9(b) (KPZ line 3272–3274) only quotes the notion.
- The proof of KPZ Theorem 7.1.8 (KPZ line 3262–3269) uses two inputs:
  - a global one: PaRa24 Theorem 1.3.2(c), or DvHKZ Theorem 4.2.3 for disconnected fixers;
  - a local one: PaRa26 Theorem 2.5.5.
- KZ's proof of Proposition 4.3.2 (KZ line 1644–1704) uses PaRa24 Conjecture 4.2.2, Theorems 4.3.1, 4.5.2 and 2.7.7, and "[PRa, Theorem 5.2]".
- HeckeStacksAndLocalShtukas has no such global object. Its scope paragraph puts integral local models and integral deformation-space representability outside its comparison scope.
- The old §1.7 *Needs* listed §1.6, while §1.6 needed §1.7's content. So the order was inverted.

**Why the repair differs from the one proposed.** The Hodge-type existence theorem needs the extension property, which was §1.8. Putting the canonical model in §1.6, as proposed, would only move the forward reference. The order is therefore: extension (§1.6), canonical models (§1.7), strict comparison (§1.8).

Functoriality and uniqueness are cited from DvHKZ Proposition 4.1.10 and Corollary 4.1.13 (quasi-parahoric, any morphism of triples). This avoids asserting normality of a fibre product of canonical models, which PaRa24 and KZ use without proof.

KZ's "[PRa, Theorem 5.2]" is Proposition 5.3.1 in the PaRa26 arXiv v4 that I read. The README and the manifest record that numbering.

## RT-ShimuraVarietiesPartII~1a/F02 (P2) — applied

Old: gap:general-connected-reduction asked HeckeStacksAndLocalShtukas for a reduction of this roadmap's frame torsor.

New: §3.9 opens with a **Theorem (connected-level reduction)**: in the very-good Hodge setup, the pullback to S_(K°) of the G^fix-torsor of §1.4 reduces to G°, with q smooth and G°-equivariant. Its locators are DvHKZ Proposition 4.3.3, Theorem 4.3.6 and Theorem A.3.3, and KPZ Corollary 7.2.24. The gap now asks only for the local inputs: the component-group exact sequence and the v-sheaf local-model map.

**Verification.** KPZ line 3770–3773 cites DvHKZ Proposition 4.3.3. I read that proposition and its proof at DvHKZ line 1549–1620. The proof uses:
- the canonical model at connected level (DvHKZ Theorem 4.1.15), which is global and now in §1.7;
- the exact sequence 1→G°→G→i_*π₀(G)→1 and its v-sheaf form (PaRa26 proof of Proposition 3.2.1; DvHKZ Lemma 4.3.4), which are local;
- the 2-compatibility (4.3.1) of the v-sheaf local-model maps, which is local;
- full faithfulness of ⋄ on perfect schemes, which is DiamondsAndVStacksPartII §D7.6.

The construction of §3.9 now cites the theorem instead of the gap.

**Pattern.** Three other places named the old "general shtuka" reduction: the §3.9 API, a §3.9 Check, and the §3.10 construction. They now name the connected-level reduction theorem.

## RT-ShimuraVarietiesPartII~1a/F03 (P3) — applied differently

Old: "Neat K^p means a sufficiently small prime-to-p level compatible with the Siegel embedding".

New:
- "Neat" is defined as in AdelicAlgebraicGroups §4.3, with cofinality from ShimuraVarieties §0.3.
- A compatible Siegel level must be neat and torsion-free, with Sh_K→Sh_K′ a closed immersion.
- "Sufficiently small" means neat and admitting a compatible Siegel level.
- For Hodge-type models, "neat K^p" means sufficiently small.

AdelicAlgebraicGroups §4.3 is a new supplier contract, also added to the *Needs* of §§0.2–0.3.

**Why the repair differs from the one proposed.**
- The finite-level criterion added for b/F02 needs a torsion-free Siegel level. AdelicAlgebraicGroups §4.3 neatness only constrains rational intersections, so torsion-freeness is imposed explicitly.
- The reviewer's parenthesis "(it suffices that the eigenvalue condition holds at one prime ℓ≠p)" was not adopted. It is an extra claim with no locator.
- About thirty existing statements used "neat" in the old sense. The last convention sentence keeps all of them valid. Each was checked against the new definitions; freeness arguments such as Z_G(Q)∩K=1 need only rational neatness.

## RT-ShimuraVarietiesPartII~1a/F04 (P3) — applied

Old: §3.1 Checks 2–3 restated the API, or computed nothing.

New:
- GL₂ at hyperspecial level: A_int=GL₂(A_f^p)/Z_(p)^×. Here H¹(Z_(p),G_m)=0, and Z_(p)^× is discrete because it meets ∏_(ℓ≠p)Z_ℓ^× in {±1}.
- Strong approximation for SL₂ gives A_int/A_int°≅∏_(ℓ≠p)Z_ℓ^×. This equals π₀ of the modular-curve tower at level GL₂(Z_p), Ẑ^×/Z_p^×.

I dropped the reviewer's last sentence ("Taking the closure of Z(Z_(p)) in G(A_f) instead would also divide by Z_p^×-components"). It does not hold: Z_(p)^× is already closed in A_f^×.

## RT-ShimuraVarietiesPartII~1a/F05 (P3) — applied

Old: §0.3 and the DVR-extension *Needs* lacked the Siegel inputs.

New:
- §0.3 *Needs* adds PELModuli §§M6.1–M6.4, ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli) and AdelicAlgebraicGroups §4.3.
- Both theorems of §1.6 (formerly §1.8) list gap:siegel-chain-moduli.
- Both suppliers were already in the Layer 0 and Layer 1 *Dependencies* lines.

## RT-ShimuraVarietiesPartII~1a/F06, RT-ShimuraVarietiesPartII~1b/F05 (P3) — applied

Old: "Layer 1: Corrected local geometry", "corrected Hodge setup" (14 occurrences), "KPZ repairs…", "after repairing…", and eight other "corrected" adjectives.

New:
- The layer is "Layer 1: Local geometry of Hodge-type models".
- The setup is "very-good Hodge setup (KPZ §7.1.2, assumptions (A)–(C))".
- Each other occurrence names the object or section it refers to: §1.2, §1.4, §2.5 or §3.6.

The erratum history stays only under "Source conventions and corrections".

**Pattern.** All occurrences of "correct*", "repair*", "modern" and "older" outside that section were replaced, in Conventions, §§1.4–1.5, 1.8–1.9, 2.3–2.4, 3.1–3.8, 5.7 and 5.9. The remaining "correct property" (§1.4 Check) and "correct Newton slopes" (§4.2) are ordinary adjectives.

## RT-ShimuraVarietiesPartII~1b/F01 (P2) — applied

Old: gap:open-curve-companions covered any semisimple lisse sheaf on an open curve.

New: the gap requires Frobenius eigenvalues that are algebraic and units at every finite place not above p (the "algebraic p-plain" hypothesis of GlobalShtukasAndFunctionFieldLanglands §6.2). It asserts a number field of coefficients and companions for each ℓ′≠p and each embedding, and it states the reviewer's counterexample. §7.4 now takes companions of the semisimplification, citing §7.3. §7.3 now states algebraicity explicitly.

**Verification.** The supplier's §6.1–6.2 at its open head (README lines 1925–1940) assumes "algebraic p-plain" for the general case. The witness: the constant Q̄_2-sheaf with geometric Frobenius 3 has no 3-adic companion, because 3 is not a 3-adic unit. The `needs` in `design/plan.json` is updated to the same text.

## RT-ShimuraVarietiesPartII~1b/F02 (P2) — applied

Old: §4.5 and §5.4 used a finite-level extension criterion that was stated nowhere.

New:
- §1.6 adds **Theorem (finite level)** (HT Lemma 1.3.6, p.17): (i)⇔(ii)⇔(iii) at sufficiently small level. It has a proof sketch, *Needs*, and a negative control: j=0 with y²=x³+p, which has additive reduction.
- §4.5 cites it, and adds §1.6 to its *Needs* and the Layer 4 Dependencies line.
- The §5.4 sketch spells out the inertia argument and adds NeronModelsAndSemistableAbelianVarieties §§5.1–5.2.

**Verification.** HT line 764–773 states the lemma for the single-lattice Siegel model with neat level. The equivalence (iii)⇒(ii) is true only because the level structure is rational and the Siegel level is torsion-free; the j=0 Remark shows it fails otherwise. That is why the Conventions now impose torsion-freeness (a/F03).

**Pattern.** The §5.4 Construction's "Hodge normalization criterion" is now "the finite-level criterion of §1.6".

## RT-ShimuraVarietiesPartII~1b/F03 (P2) — applied

Old: gap:compact-quotient-borel named "the Borel-containment argument" with no statement.

New: it is restated for F a local field of characteristic zero, H connected split reductive and I⊂H closed. (a) If I(F)\H(F) is compact, I contains a Borel subgroup. (b) If moreover I° is reductive, then I=H, since H/I is proper, affine and geometrically connected. Two boundary cases are included. The plan's `needs` is updated to match.

**Verification.** K17 line 1383–1394 uses exactly (a), from Borel–Tits Proposition 9.3, and then (b). I wrote "I° reductive" because K17's "I is reductive" refers to the identity component.

## RT-ShimuraVarietiesPartII~1b/F04 (P3) — applied

Old: the §7.2 Checks 2–3, the Layer 7 Examples and Downstream consumers used the modular curve, which is excluded because Z^c=μ₂.

New: they use T=Res_(Q(i)/Q)G_m at p=5, with γ_y=π_y⁻¹=(1∓2i)/5. Its image in Conj(GL₂) has coordinates (2/5,1/5). Over F₂₅ they become (−6/25,1/25), and in the H¹ convention (2,5). The §7.2 Check on GL_n coordinates (diag(1,1/5)) is unchanged, since it concerns only χ_GLn.

**Verification.** KZ Definition 4.2.2 (KZ line 1481–1486) requires Z^c to be a product of induced tori. The README's §2.1 Check already excludes GSp_(2g).

## RT-ShimuraVarietiesPartII~1b/F06 (P3) — applied

Five restating Checks were replaced by computed instances:
- §3.5: GL₂ components lie over Q(ζ_N) at parahoric level and over Q(ζ_(Np)) at level Γ(p).
- §2.4: PGL_1(D) at p=3 with index 3 is exceptional; index 2 is not.
- §2.5: Q(i) works at 5 and fails at 3; Q(√−2) works at 3.
- §3.6: w=[[0,1],[p,0]] normalizes the Iwahori; diag(p,1) does not.
- §6.3: a degree-two marked point would give T²+(6/25)T+1/25 instead of T²−(2/5)T+1/5.

The other checks of these sections were left as they were. I relied on the two reviews' sweeps of all Checks (about 104 and 58 bullets) and did not repeat it.

## RT-ShimuraVarietiesPartII~1b/F07 (P3) — applied

Old: "KPZ §7.3.1(2), pp.85–86". New: "KPZ §7.3.1(2), p.86".

**Verification.**
- KPZ line 3788 is the p.86 marker.
- Item 2) runs from KPZ line 3790 to line 3813, ending before item 3) at line 3814.
- Item 1) ends at line 3786, on p.85.

The other §7.3.1 locators, (1) p.85 and (3) pp.86–87, are correct.

## Checks

- **Elaboration.** `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. The file is unchanged: one `import Mathlib`, the module docstring and an empty namespace.
- **`#check @name` comparison.** `Suggested.lean` declares no name, so there was nothing to check and nothing changed. No headline became statable: canonical integral models need integral Shimura models, local shtukas and v-sheaves, none of which exists at the pins.
- **Dependency check.** The command of the brief, run after all edits:

  ```text
  depcheck: 265 roadmaps, 2607 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The new suppliers are AdelicAlgebraicGroups (on main) and DiamondsAndVStacksPartII (earlier in the merge order).
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. I checked by hand that each cited section exists:
  - ShimuraVarieties §0.3, "Shimura specialization of cofinal neat levels", at its head;
  - AdelicAlgebraicGroups §4.3 on main;
  - DiamondsAndVStacksPartII §§D7.6, D9.8, D10.11 at its open head;
  - HeckeStacksAndLocalShtukas §§HS2.1, HS2.13 at its open head;
  - GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 at its open head.
- **Gaps.** The 22 slugs agree across the README text, the "Exact supplier contracts" lines and `design/plan.json`. The plan diff touches only the `needs` of four gap entries (integral-local-shimura, general-connected-reduction, open-curve-companions, compact-quotient-borel) and the `section` of the first two.
- **House rules.** No machine path, LaTeX delimiter, review reference or round label appears in the README.
- **Sources.** PaRa24 (arXiv:2106.08270v6), DvHKZ (arXiv:2403.19771v4) and PaRa26 (arXiv:2204.02829v4) were fetched by the service with `licence_class = "open-repository"`. Their locators, `cited_for` and `version_note` are completed in `sources.toml`, and they are listed under References. No `needs-references.toml` was written.

## Gate failure: pull-request-number pattern (prnum=21)

The gate read the two Pappas–Rapoport source keys (the initials P and R, then the two-digit year) as pull-request numbers: 21 hits in the README, in the gap:integral-local-shimura contract (line 132) and elsewhere. Both keys were new in this round and no other manifest uses them, so I renamed them `PaRa24` (Pappas–Rapoport, arXiv:2106.08270v6) and `PaRa26` (Pappas–Rapoport, arXiv:2204.02829v4). The rename was applied in `README.md` (21 occurrences, References included), `sources.toml` (the two `id` fields) and the `needs` of gap:integral-local-shimura and gap:general-connected-reduction in `design/plan.json` (8 occurrences). I checked mechanically that `gaps` is the only top-level key of `design/plan.json` that changed. This report had its own pull-request and revision numbers in the citation checks; I replaced them with "at its open head". No statement, locator or gap content changed. After the rename, a search for `PR` followed by digits, `#` followed by digits, or `rev` followed by a number finds nothing in the README, the manifest, the plan or this report. Elaboration and the dependency check were rerun after the rename (results above, unchanged).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, neat and sufficiently small | Z_G(Q)∩K for Hodge type; conjugate pair (gKg⁻¹, ι(g)K′ι(g)⁻¹); principal level N=2 | Z_G(Q)∩K finite and neat, so 1; neat and torsion-free are conjugation-stable; level 2 contains −1 (torsion) | the freeness proofs of §0.3 and §7.1 need only rational neatness; finite level needs torsion-free K′ | Siegel level required neat and torsion-free |
| §1.6 finite level, (iii)⇒(ii) | y²=x³+p at p=5,7,11, level GL₂(Ẑ) | Δ=−16·27p², v_p(Δ)=2, c₄=0: additive, j=0 integral | fails without torsion-free level | Remark added |
| §1.6 finite level, (ii)⇒(i) | chain level | every member of the chain is isogenous, so good reduction is the same for all | holds | "any member" clause |
| §1.6 pro-level | DVR R=W(k) | Gal of W(k)[1/p] is inertia; rational full level means inertia is trivial on T^p, so NOS applies | holds | sketch rewritten |
| §1.7 axiom (a) | modular curve minus supersingular locus | (b)–(d) hold; supersingular E over W(k) has no extension | (a) discriminates | Check |
| §1.7 axiom (d) | blow-up along supersingular points | chart p=tv, completion W[[t,v]]/(tv−p) with nodal special fibre, against W[[t]] | (d) discriminates; (a)–(c) hold by properness | Check |
| §1.7 uniqueness | GSp₄, p=3, Iwahori: finite normalization N against chain model S | N→S_hyp finite; S→S_hyp has fibre of dimension ≥1 over E×E (E: y²=x³−x over F₃, 4 points) | N is not canonical | Check |
| §1.7 functoriality | identity with 𝒢=Iwahori→𝒢′=GSp₄(Z_p); derived isomorphism f | (4.3.1)-type condition 𝒢(Z̆_p)⊂f⁻¹(𝒢′(Z̆_p)) holds; derived isomorphism gives ker f central and f(Z_G)⊂Z_G′, an ad-isomorphism | statement matches DvHKZ Proposition 4.1.10 | stated for quasi-parahoric 𝒢 |
| §1.7 Hodge type, hypothesis | single lattice with closed immersion G^fix↪GL(Λ) | a Z̆_p-point of GL(Λ) with generic point in G factors through the flat closure G^fix | equality of points automatic | stated explicitly |
| §1.7 Definition, generality | data satisfying PaRa24 (4.1.1) against Hodge type | Hodge type implies Z(Q) discrete, which is (4.1.1) | the narrowing is stated as a choice of scope | sentence added |
| §1.8 strict comparison | GL₂ at hyperspecial level | both completions W[[t]] | consistent | sketch now consumes §1.7 |
| §3.1 Check 1 | GL₂, Z_(p)^×∩∏Z_ℓ^× | ±p^k with p∤num, den gives {±1} | discrete, hence closed | Check |
| §3.1 Check 2 | GL₂, (A_f^p)^× | Q_(>0,(p))×∏Z_ℓ^×; π₀=Ẑ^×/Z_p^× | both ∏_(ℓ≠p)Z_ℓ^× | Check |
| §3.5 Check | N=9, p=5 against level Γ(5) | #(Z/9)^×=6, field Q(ζ₉) unramified at 5; #(Z/45)^×=24, Q(ζ₄₅) ramified | parahoric level needed | Check |
| §2.5 Check | x²≡−1 mod 5 and mod 3; x²≡−2 mod 3 | yes (2²=4); no; yes (1²=1) | split at 5, inert at 3, Q(√−2) split at 3 | Check |
| §3.6 Check | w=[[0,1],[p,0]], M∈I | wMw⁻¹=[[d,c/p],[pb,a]]∈I; diag(p,1) gives [[a,pb],[c/p,d]] | w normalizes I, diag(p,1) does not | Check |
| §3.9 theorem | GL₂ edge midpoint (§3.9 Check 4) | the fixer of x_ad in PGL₂ has 2 components; G^fix for GL₂ is the Iwahori, already connected | the reduction is needed only for disconnected fixers | theorem added |
| §6.3 Check | γ² for γ=(1−2i)/5 | (−3−4i)/25, trace −6/25, norm 1/25 | T²+(6/25)T+1/25 against T²−(2/5)T+1/5 | Check |
| §7.2 Checks, Examples, Downstream | E: y²=x³+x over F₅ | counts 1,0,1,1,0, #E=4, trace 2; γ=(1∓2i)/5: trace 2/5, norm 1/5; γ⁻¹=1±2i: (2,5) | agree | datum changed to T |
| gap:open-curve-companions | constant sheaf with Frobenius 3, ℓ=2, ℓ′=3 | 3∈Z_2^×, 3∉Z_3^× | excluded by p-plainness | gap reworded |
| gap:open-curve-companions, use in §7.4 | pulled-back θ-sheaf | eigenvalues are monomials in the Weil numbers (1±2i)⁻¹, algebraic and units away from 5 | hypothesis met | §7.3 "algebraic" |
| gap:compact-quotient-borel | H=G_m, I=1; H=GL₂, I=B; H=1 | F^× not compact; P¹(F) compact with I° not reductive; I=H | both hypotheses needed | gap reworded |
| gap:integral-local-shimura (v) | GL₂ at hyperspecial level, b basic | completion of M^int is W[[t]], matching the Lubin–Tate deformation space | consistent with §1.7 Check 2 | local only |
| gap:general-connected-reduction (i) | PGL₂ edge midpoint | π₀(G^fix)=Z/2 over F_p; i_*π₀ is supported on the special fibre | on the generic fibre G°=G^fix and i_*π₀ restricts to 0, so only the special fibre carries content | local only |

## For the maintainer

- **Section ids.** §1.6 and §1.8 exchanged content: extension over DVRs is now §1.6, and the strict comparison is now §1.8. §1.7 is now "Canonical integral models". The Layer 1 heading changed. No other roadmap cites a section of ShimuraVarietiesPartII (checked with `roadmaps grep` over main and all open heads), so no id map is needed.
- **Gaps on HeckeStacksAndLocalShtukas.** Both gaps on this supplier now ask only for local statements. Its "Scope and ownership" section places "integral local models and integral deformation-space representability" outside its comparison scope. gap:integral-local-shimura items (i), (v) and (vi) ask it to extend that scope. If its authors decline, these items need another owner, and that is a decision for a human.
- **Ownership.** I found no roadmap, on main or at an open head, that owns Pappas–Rapoport canonical integral models (searched for "canonical integral model", "Pappas–Rapoport", 2106.08270, 2403.19771 and "integral canonical model"). This roadmap owns them for Hodge-type data and says so under Scope and ownership.
- **Source numbering.** KZ cites "[PRa, Theorem 5.2]". In PaRa26 arXiv v4 the same statement is Proposition 5.3.1, p.35, and the README and manifest give that numbering. DvHKZ page numbers are the printed arXiv v4 ones, and in its appendix the PDF page index and the printed numbers diverge: Theorem A.3.3 is printed p.50.
- **Ownership against open pull requests** was checked with the roadmaps tool, as described above.
- No review text was suspicious.
