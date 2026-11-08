<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2307#issuecomment-6665999067 -->
Review (claude) of ce205f3

Verdict: needs_changes

1. **F01** (P3) PotentialAutomorphyInfrastructurePartII cited by `PL.k` labels that do not exist at its open head

   - Location: `packages/ModularityAndLanglandsExtensionsPartII/README.md` lines 207–247 ("Cited by
     layer and by the title of the target in that layer. PL.0: …") and every `*Needs:*` line citing
     `PL.0`–`PL.8` (about eighty), plus `design/plan.json` gaps `geometric-weak-primitive-auxiliary-finiteness`
     (`"section": "PL.7"`) and `dyadic-definite-unitary-forms` (`"section": "PL.2"`).
   - Claim: the supplier's layers are `PL.0`–`PL.8` with `PL.2` = definite unitary groups, `PL.6` =
     residually reducible rings, `PL.7` = residually reducible lifting, `PL.8` = Bloch–Kato.
   - Witness: the supplier's README at its open head (package `PotentialAutomorphyInfrastructurePartII`,
     its submission pull request, head `6b4e6a1`) contains no string `PL.`; its layers are `## Layer 0`
     … `## Layer 10`, with Layer 2 "Schur residual representations and the determinant subring" split
     out, so Layer 3 = definite unitary groups (§§3.1–3.14), Layer 4 = Taylor–Wiles and `R = T`,
     Layer 5 = lifting and finiteness, Layer 6 = potential automorphy, Layer 7 = residually reducible
     rings (§§7.1–7.20), Layer 8 = residually reducible lifting (§§8.1–8.20, with 8.20 "Finiteness
     with an unobstructed auxiliary place"), Layer 9 = Bloch–Kato (§§9.1–9.9). The `PL.k` labels are
     those of the supplier's board design (`packages/PotentialAutomorphyInfrastructurePartII/design/README.md`,
     588 occurrences), not of its head.
   - Also drifted titles (cited by title, absent at the head): "Soluble base change and descent of
     automorphy" (head 0.9 "… of polarized automorphy"); "Connecting and strongly connecting local
     lifts" and "Properties of connection and strong connection" (head 1.1 "Strong connection and
     component deformation problems", 1.2 "Properties of strong connection; Choi's lemma and the
     filtration lemma"); "Generic Weil–Deligne representations" (head 9.1 "Generic Galois
     representations"); "Primitive representations" (head 7.1 "Weakly and strongly primitive
     representations"); "Connectedness dimension and arithmetic rank" (no such target; the connectedness
     argument is inside 7.7/8.5); "Two adequate constituents with source primitivity", "The ANT lifting
     theorem with source primitivity", "The ANT finiteness theorem with source primitivity" (head 8.19,
     8.17, 8.18 "… with weak primitivity"); "Hecke algebras of definite unitary groups and their maximal
     ideals" (head 3.3 "Hecke algebras of definite unitary groups"); "Soluble and cyclic CM extensions
     with prescribed local behaviour" (no target at the head: the head itself imports this from
     PotentialAutomorphyInfrastructure §2.5, which is earlier in the merge order).
   - Repair: replace every `PL.k` by the head's layer or section (`PL.0`→Layer 0, `PL.1`→Layer 1,
     `PL.2`→Layer 3, `PL.3`→Layer 4, `PL.4`→Layer 5, `PL.5`→Layer 6, `PL.6`→Layers 2 and 7, `PL.7`→Layer 8,
     `PL.8`→Layer 9), use the head's titles, cite PotentialAutomorphyInfrastructure §2.5 for the
     auxiliary soluble and cyclic extensions, and set the two gaps' `section` to "§8.20 (Layer 8)" and
     "Layer 3" in `plan.json` and in the README's contract lines. Tested: every title above resolves
     at the head after the relabelling; the two gap contracts still ask for something the head lacks
     (8.20 keeps the strong-primitivity hypotheses of §8.7, and Layer 3 states its forms for odd `l`).

2. **F02** (P3) AdicSpacesPartIIPartII cited as `RZ.1`; at its open head the roadmap is `AdicSpacesPartV` with `Layer 1`

   - Location: README lines 249–258 ("AdicSpacesPartIIPartII RZ.1 (the normalization of a rigid
     space, its irreducible components …)"), the gap contract at line 258, `*Needs:*` of §§0.1, 1.4,
     2.4, and `plan.json` gap `components-under-field-extension` (`"section": "RZ.1"`).
   - Claim: the supplier has a section `RZ.1` owning normalization and irreducible components.
   - Witness: the supplier's open pull request (branch `PKG-AdicSpacesPartIIPartII`, head `c8f36e6`)
     carries the folder `packages/AdicSpacesPartV/` (title "rigid-analytic Zariski geometry, classical
     points and resolution, part II") whose layers are `## Layer 0` … `## Layer 6`; "Normalization,
     global components and connected complements" is `Layer 1`. `RZ.0`–`RZ.2` are the labels of the
     board design only. Layer 1 at the head has no statement on components under extension of the
     ground field (no "geometrically irreducible", no Conrad 3.4.2), so the gap still stands.
   - Repair: cite "AdicSpacesPartIIPartII Layer 1 (normalization and irreducible components)" under
     the name the merge order uses, set the gap's `section` to "Layer 1", and tell the intake that the
     supplier's head folder is named `AdicSpacesPartV`.

3. **F03** (P3) OrdinaryAutomorphicFormsAndModularityLifting §2.6 does not exist at its head, and that roadmap disclaims the object

   - Location: README line 314 ("§2.6 (finiteness and freeness at a permissible maximal ideal)") and
     §10.2 `*Needs:*` (line 3187).
   - Claim: the supplier's §2.6 gives finiteness and freeness of the ordinary Hecke module at a
     permissible maximal ideal.
   - Witness: at the supplier's open head Layer 2 has §§2.1, 2.9, 2.10, 2.11, 2.12 only; its Scope
     says "this roadmap has no permissible-ideal … target" and assigns the nearly ordinary Hecke
     algebra, `M_∞(U)` with its freeness and its finiteness over `Λ_𝒪` to ClassicalSerreModularity
     (`I.1/ordinary-control-and-weight-change` in that roadmap's own labelling).
   - Repair: delete the §2.6 citation; the slope-`(0,1)` dimension count that nt21b Lemma 3.4 needs is
     already in the declared gap `unobstructed-auxiliary-prime-and-slope-count` on GL2ModularityLifting
     Layer 3, and Hida's control theorem is already cited through PadicFamilies §5.8. If a Hida
     finiteness statement is still wanted, cite the ClassicalSerreModularity target that
     OrdinaryAutomorphicFormsAndModularityLifting names as owner.

4. **F04** (P3) Lust–Stevens locator `§4` should be `§8`

   - Location: README line 388 (gap contract: "(Lust–Stevens, ls20 §4)"), line 1387 (§4.4 proof
     sketch "ls20 §4"), and `sources.toml` entry `ls20` (`locator = "§4"`). `plan.json` already says
     "ls20 §8" in the same gap's `needs`, so README and plan disagree.
   - Claim: ls20 §4 computes the reducibility points of depth-zero supercuspidals.
   - Witness: ls20 line 386 "4. Reducibility of parabolic induction" is Silberger's general
     recollection (Theorem 4.1, lines 403–418); the computation for depth-zero cuspidals is §8
     "Synthesis" (ls20 line 1132, with (8.1) at line 1145), and nt21 line 746 says "§8 in op. cit.
     explains how to compute the reducibility points Red(π)".
   - Repair: write "ls20 §8" at both README places and `locator = "§8"` in `sources.toml`.

5. **F05** (P3) The gap `artinian-crystalline-quotients` mislabels bbm82 Théorème 3.1.1

   - Location: README line 302 ("the generic-fibre comparison of Berthelot–Breen–Messing (bbm82
     Théorème 3.1.1)") and the same sentence in `plan.json`.
   - Claim: bbm82 Théorème 3.1.1 is a generic-fibre comparison.
   - Witness: it is Raynaud's embedding theorem (a finite flat group scheme embeds in an abelian
     scheme), which is how nt21b line 324 uses it ("By [BBM82, Théorème 3.1.1], there exists a lattice
     L in a crystalline representation … such that A² is a quotient of L") and how the supplier's
     own §R07.1.40 ("Raynaud's embedding") cites it; the README's supplier contract (line 298) cites
     §R07.1.40 under that name.
   - Repair: "Raynaud's embedding theorem (bbm82 Théorème 3.1.1), applied as in Newton–Thorne II
     Lemma 2.2 …"; the mathematical content of the `needs` sentence is unchanged.

6. **F06** (P3) `Z_0^{pc}` in §2.1 omits "`χ_{0,1}` unramified", which `τ² = 1` needs

   - Location: README lines 798–800 ("Let `Z_0^{pc} ⊂ ℰ_0` be the set of classical points `z`
     attached to `(π_0, χ_{0,1} ⊗ χ_{0,2})` with `π_{0,p}` not a twist of Steinberg") and the claim
     "Prove that `τ² = 1`" (line 802).
   - Claim: the twin is an involution on all classical non-Steinberg points.
   - Witness: nt21 lines 2344–2345 define `𝒯_0 = Hom(ℚ_p^×/ℤ_p^× × ℚ_p^×, 𝔾_m)`, so every point has
     `χ_{0,1}` unramified (lines 2370–2371, 2376–2377). Computed without it: for a point with
     `χ_{0,1}` ramified, `τ²(z) = (π_0 ⊗ ι(ψψ′), χ_0 ⊗ (ψψ′)_p)` with `(ψψ′)|_{ℤ_p^×} = χ_{0,1}^{−1}|_{ℤ_p^×} ≠ 1`,
     so `τ²(z) ≠ z`.
   - Repair: add "with `χ_{0,1}` unramified (the refinement parameter space `𝒯_0` of PadicFamilies
     §2.10 is `Hom(ℚ_p^×/ℤ_p^× × ℚ_p^×, 𝔾_m)`)" to the definition; the twin's first character
     `χ_{0,2}ψ_p` is then unramified by construction, as the API already says.

7. **F07** (P3) §13.4's regular-semisimple Check swaps `x` and `y` and undercounts the forbidden set

   - Location: README lines 4213–4215 ("an element `(diag(x, x^{−1}), diag(y, y^{−1}))` with the
     stated choices has `2r` distinct eigenvalues `x^{±1} y^{r−1−2j}`") against the sketch at lines
     4201–4203 ("choosing `x` of order `> 2r − 2` and `y` avoiding the at most `2r − 1` forbidden
     ratios `±x^i`").
   - Claim: with `x` of large order and `y` off `±x^i`, the eigenvalues `x^{±1}y^{r−1−2j}` are distinct.
   - Witness: with `x` in the rank-two slot the eigenvalues are `x^{±1}y^{r−1−2j}`, whose distinctness
     needs `y` of order `> 2r − 2` and `x² ∉ {y^{2i}}`, not the stated choices. nt26 lines 2037–2040
     put `g_2 = diag(x, x^{−1})` in the symmetric-power slot with `x` of order `> 2(r − 1)` and
     `g_1 = diag(y, y^{−1})` with `y` avoiding `±x^i`, `i = r − 1, …, 1 − r`: `2r − 1` values of `i`,
     `4r − 2` forbidden elements, possible since `q > 4r`.
   - Repair: write the eigenvalues as `y^{±1} x^{r−1−2j}` and "avoiding the `4r − 2` elements
     `±x^i`, `|i| ≤ r − 1`" in both the sketch and the Check.

8. **F08** (P3) The Lean docstring gives the wrong missing carrier for §14.3

   - Location: `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` lines 36–39
     ("Symmetric power functoriality for every non-CM newform (§14.3) lacks the local Langlands
     correspondence at the ramified primes, which is needed even to write the Euler factors").
   - Claim: the statement is not statable because of the ramified Euler factors.
   - Witness: the partial Euler product over `p ∤ N` needs only the pinned
     `HeckeRing.GL2.Newform.satakeParameters` (Satake.lean line 91) and is entire for a non-CM
     newform (the omitted factors are inverse polynomials in `p^{−s}`); what the pins lack is a CM
     predicate on newforms (no `IsCM`-like declaration in the pinned Tau Ceti modular-forms files).
   - Repair: say that §14.3 lacks a CM predicate for newforms (the hypothesis "non-CM"), after which
     the partial Euler product over good primes would be statable.

9. **F09** (P3) `sources.toml` locator for `ls20` and the `cited_for` of `con99`

   - Location: `sources.toml` entries `ls20` (`locator = "§4"`, see R04) and `con99`
     (`cited_for = ["Layer 0; supplier contracts (AdicSpacesPartIIPartII gap)"]`).
   - Claim: the recorded locators match the text cited.
   - Witness: R04 for `ls20`; for `con99` the gap now points at "Layer 1" of the renamed supplier (R02).
   - Repair: `locator = "§8"` for `ls20`; keep `con99` as recorded (the author's entry is correct) but
     the fix round should not need to touch it beyond R02's relabelling in the README.

Nine findings, all P3 (locators, supplier drift, Checks, docstring). No P1 or P2: no statement
was found false or vacuous, no prerequisite is unowned, the elaboration passes with `sorry` as the
only warning, the one sorried theorem is not padding, and the direction check reports no UPWARD or
CYCLE line. The repairs are mechanical (relabel supplier citations to the suppliers' open heads,
fix four locators, one definition clause, one Check, one docstring reason) and a fix round applies
them before the port.

## Verified sound

**Principles.** No route-specific shortcut: Theorem 7.1 is proved in rank `2^r m` from rank `m`
and in all ranks from the independent Hilbert induction of Layer 13, with the odd inductive step of
the printed source recorded under an explicit hypothesis (§7.4) rather than silently dropped. The
roadmap re-plans nothing of its parent: the 15 parent sections it proves (§§4.5–4.12, 4.20, 4.23,
4.29–4.31; 4.2, 4.4 used) exist at the parent's open head with the titles the README gives them
(parent lines 2540–2610, 2745, 2765, 2781, 2882–2906), and the parent's `Suggested.lean` states only
Sato–Tate (its lines 45–75), so the Euler-product theorem is not a duplicate. Direction of supply:

    depcheck: 228 roadmaps, 2269 edges, 0 problem(s)

No copied passages (no fenced source text; locators only). No algorithms. `Suggested.lean` has a
single `import Mathlib` plus the one `TauCeti.*` module used, no `set_option`, no `lemma`, no
sorried data (the one `def` has a real body), one proved `example` (the symmetry
`symPowerEulerFactor n α β x = symPowerEulerFactor n β α x`, which is what makes the ordering in
`hαβ` immaterial; kept). README: 109 numbered targets, 109 `*Needs:*` lines, 109 `**Checks.**`
blocks, every layer with `### Examples` and `### Dependencies`, no process residue (the only
"packet" strings are `L`-packets), no LaTeX delimiters, no paths.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0 in 12 s,
output exactly `Suggested.lean:73:8: warning: declaration uses sorry`. Elaborated types
(`scratch/signatures.md`): `symPowerEulerFactor : ℕ → ℂ → ℂ → ℂ → ℂ` and the theorem with binders
`{k : ℤ} (f : Newform 1 k) (n : ℕ) (hn : 1 ≤ n) (α β : ℕ → ℂ) (hαβ : ∀ p, p.Prime → f.satakeParameters p = {α p, β p})`,
no section binder lost (there is no `variable` block). One-tactic probe on a scratch copy
(`scratch/Probe.lean`, `scratch/elab-probe.log`): `simp` ("made no progress"), `rfl` (fails),
`infer_instance` ("type class instance expected"), `exact f.LSeries_eulerProduct_hasProd_satakeParameters`
(type mismatch) all fail: the theorem is not padding.

**Headline theorems** (README summary): Theorem D (§3.8), Theorem E and Theorem 7.1 (§§7.5, 7.6,
14.1), Theorems A and B (§14.2), Newton–Thorne II Theorem A (§14.3), `SP_n` for all `n` (§13.10),
tensor functoriality lifting and the residual twisted-tensor witnesses (§§12.7, 13.5, 13.6),
automorphy lifting for symmetric powers (§9.8), level raising (§§5.4, 5.10, 6.4, 6.7–6.9), and the
holomorphy of `L(s, Sym^n f)` in level one (§14.4). Only the last is statable at the pins and it is
stated; the others are named in the docstring with the missing carrier (automorphic representations
of `GL_n` and of definite unitary groups, Galois representations, eigenvarieties, deformation rings,
Hilbert modular forms). Checked the pins: no automorphic representation, eigenvariety, pseudocharacter
space or deformation-ring carrier exists in the pinned Tau Ceti (`TauCeti/NumberTheory/ModularForms`
has newforms, Satake parameters and `L`-series only). R08 corrects one reason.

**Library declarations opened at the pins.** Mathlib: `padicValNat.pow_two_sub_one`
(`Mathlib/NumberTheory/Multiplicity.lean:358`, hypotheses `1 < x`, `¬2 ∣ x`, `n ≠ 0`, `Even n`,
conclusion `v₂(x^n − 1) + 1 = v₂(x+1) + v₂(x−1) + v₂(n)`: at `x = 5`, `n = 4` gives `v₂(624) = 1+2+2−1 = 4`
as the README's §3.2 Check computes), `Polynomial.discr`
(`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935`), `Nat.exists_prime_lt_and_le_two_mul`
(`Mathlib/NumberTheory/Bertrand.lean:222`, `n ≠ 0 → ∃ p, p.Prime ∧ n < p ∧ p ≤ 2n`),
`NumberField.abs_discr_gt_two` (`…/Discriminant/Basic.lean:273`), `GaussianInt`
(`Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean`), `Finset.prod_range_reflect`
(`Mathlib/Algebra/BigOperators/Intervals.lean:153`). Tau Ceti: `HeckeRing.GL2.Newform`
(`Newforms/Newform.lean:104`, extends `EigenformAwayFromLevel` with `ne_zero`, `isNew`, `isNorm`),
`satakeParameters` (`Newforms/Satake.lean:91`, the multiset of roots of `X² − a_p X + χ(p)p^{k−1}`,
`χ` extended by zero; for `N = 1`, `χ(p) = 1` at every prime), `exists_satakeParameters_eq_pair`
(line 117), `LSeries_eulerProduct_hasProd_satakeParameters` (line 191, region `k/2 + 1 < Re s`),
`CuspForm.hasEntireExtension_qExpansion_coeff` (`LFunction/Basic.lean:137`, hypothesis `0 < k`).

**Sources, the seeded sample** (every locator read at the cited page in the cached texts):

| Target | Source locator | Result |
|---|---|---|
| 1.3 | nt21 Lemma 2.29, lines 2140–2149, proof 2150–2197 | hypotheses (regular de Rham, two distinct JH characters with `(χ_1/χ_2)^i ≠ 1`, every triangulation non-critical) and conclusion as stated; proof by `N ≠ 0` uniqueness and Vandermonde as sketched |
| 2.2 | nt21 Lemma 2.34, lines 2535–2578 | finite étale `η`, `ψ` unramified a.e. and at `S̃_p`, `ψψ^c = η^*(χ)|_{G_F}`; Chevalley step at line 2558 |
| 2.3 | nt21 proof of Thm 2.33, lines 2462–2525 | `F′`, `F`, `b(τ, μ) = (τ|_{G_F} ⊗ ψ^{−1}, b_p(μ))`, Labesse descent (line 2523) as stated |
| 3.1 | nt21 Thm 3.2, lines 2630–2654; bk05 Thm B line 75 and Corollary lines 113–127 | `W_0(b) = {|8| < |w| < 1}`, `⊔ X_i`, slope `i·v_2(w)`; the level-`4` corollary gives slopes `{0, 2, 4, …, k − 1}` (`t = 8/4 = 2`), all even |
| 3.6 | nt21 Lemma 3.6, lines 2736–2744 | as stated, `n`-regularity on both points |
| 6.2 | nt21 Lemma 6.4 lines 3856–3861 and the datum 3836–3855; ct17 §5.1 lines 1963–2035 | dimension bound `≥ 1 + n[L⁺ : ℚ]` for fixed-type, unipotent, Steinberg (nt21) and `R^{χ_v}`, `R^{St}` (ct17 line 2034), partition rings excluded as the README says; `J_D = ker(P_D → 𝕋_D)` at nt21 line 3937 |
| 6.8 | ct17 Thm 5.7, lines 2204–2223 | hypotheses 1–8 match the README's (1)–(8) item by item |
| 7.1 | nt21 lines 4042–4052 | `f_0 = q − 4q² + 16q⁴ − 14q⁵ − 64q⁸ + ⋯`, level `Γ_1(4)`, weight 5, induction from `ℚ(i)` of the character of type `(4, 0)`, ordinary for `p ≡ 1 mod 4`, `det = δ_{K/ℚ}ε^{−4}` |
| 7.2 | nt21 Lemma 7.2, lines 4073–4120 | (1)–(5) as stated; `(p − 1)/8 > 2n(n − 1)` at line 4107 |
| 7.3 | nt21 Cor 7.3, lines 4124–4143 | as stated; `q ≡ 3 mod 4`, `q ≡ −1 mod p`, Diamond's criterion |
| 9.5 | nt21b Prop 2.6 lines 574–588, Lemma 2.7 lines 629–667 | `W_∞`, `g = q + |S ∪ S_∞| − 1`, `q = dim H¹(F_S/F, ad⁰r̄(1))`, Krull dimension `q + 4|S ∪ S_∞|` (line 604) |
| 12.2 | nt26 Lemma 4.2 lines 1321–1352, Cor 4.3 lines 1353–1355 | as stated; the semistable non-crystalline case via `R′_v` and density of `R_v[1/p]` points (lines 1346–1351) |
| 13.3 | nt26 Lemma 5.6 lines 1875–1883, Lemma 5.7 lines 1887–1971 | as stated; irreducibility proved over `F` only (lines 1916–1927) while line 1957 invokes adequacy, which is the gap the README repairs |
| 13.4 | nt26 Lemma 5.8 lines 1975–1977, proof 1994–2050 | as stated; hypotheses (7)–(9) printed with `ι` where `ι_l` is meant (lines 2041–2047); R07 for the Check |
| 13.5 | nt26 Thm 5.5 lines 1855–1871, proof 1872–1993 | hypotheses (1)–(5) as stated; the constructed `Π` has `r_Π ≅ r_{φπ} ⊗ Sym^{r−1} r_σ` (line 1986), so the identification with `π` is residual as the README says |

Also read: nt21 p. 48–49 (eigencurve and twin, lines 2338–2440), p. 55 (Lemmas 3.4–3.5), p. 60
(Theorem 4.1: item (4) prints `n_2`, confirming the README's remark), pp. 86–90 (Prop 7.4, Theorem
7.1, Theorem 7.6); nt21b p. 7 (Lemma 2.2); nt26 pp. 20–21 (Prop 3.9), p. 32 (the generator of
`𝔪_{G,Q}` for `i > r` prints `α^r β^{i−r} ∏_{j ≤ i−r} γ_j`, confirming the README's correction);
ct17 pp. 10–11 (Theorem 2.5: `X` has exponent `[1, 0, −1]`), p. 21 (Theorem 3.3(i) prints
`[1, 0, 1]`), pp. 26–27. Uncertified texts `kl87`, `bbm82`, `kw09` were not read (paywalled, settled).

**Adversarial table** (sampled targets, headline, and every target a finding touches):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §14.4 / Lean theorem: Euler product converges for `Re s > n(k−1)/2 + 1` to an entire function | `n = 0`; `n = 1`; `Δ`, `n = 2`, `p = 2`; `k ≤ 0` | `n = 0`: product is `∏(1 − p^{−s})^{−1} = ζ(s)`, pole at 1, excluded by `hn`; `n = 1`: region `Re s > (k+1)/2`, matches Tau Ceti's region `k/2 + 1`; `Δ`: `α+β = −24`, `αβ = 2^{11}`, `α²+αβ+β² = 576 − 2048 = −1472`, factor `1 + 1472x − 1472·2^{11}x² − 2^{33}x³`; each factor `≠ 0` since `|α^jβ^{n−j}p^{−s}| = p^{n(k−1)/2 − Re s} < p^{−1}`; `Newform 1 k` is empty for `k ≤ 0` (`ne_zero`), so no junk weight | true as stated | none |
| Lean `symPowerEulerFactor` symmetry | `n = 1`: `(1 − βx)(1 − αx)` vs `(1 − αx)(1 − βx)` | equal; the `example` is proved | sound | none |
| §1.3 non-criticality passes to `Sym^{n−1}` | `n = 2`; `n = 3` with `χ_1/χ_2` of order 2; `a_τ = 0` | `n = 2`: hypothesis = conclusion; order 2: `χ_1² = χ_2²` so two monomials coincide, Vandermonde degenerate; `a_τ = 0`: `⟨e_1^{n−1}⟩` is a `φ`-stable critical line | true | none |
| §2.1 twin: `τ² = 1`, `s + s′ = k − 1`, weight valuations | `Δ` at 2: `v_2(−24) = 3`, slopes `3, 8`; `k = 2`; `χ_{0,1}` ramified | `3 + 8 = 11 = k − 1`; `τ²(z)` differs from `z` by the twist `(ψψ′)|_{ℤ_p^×} = χ_{0,1}^{−1}` when `χ_{0,1}` is ramified | true on `𝒯_0` (where `χ_{0,1}` is unramified), clause missing | R06 |
| §2.2 trivialising characters | `W` a point; `χ = 1`; inert `p`-adic place | point: PL.0-type character existence; `χ = 1`: `W̃ = W`, `ψ = 1`; inert place: `S̃_p` undefined, lemma not claimed | true | none |
| §2.3 base-change morphism | weight `k` point; CM form induced from `K ⊂ F` | HT weights `{0, k−1}` at every embedding; `K ⊂ F` would make the base change `χ_1 ⊞ χ_2`, excluded since `K` ramifies at a prime dividing `Np` which splits in `F` | true | none |
| §3.1 Buzzard–Kilford | `v_2(w) = 1/2`; `κ(5) = 5`; `w = 0` | slopes `1/2, 1, 3/2, …`; `w = 4`, `v_2 = 2`, slopes `2, 4, 6, …` all even; `w = 0` outside the annulus | true | none |
| §3.2 boundary weights | `(k, m) = (3,0), (4,0), (2,1), (6,0)` | `w = 4, 24, −2, 624`; `v_2 = 2, 3, 1, 4`; `624 = 2⁴·39`, `v_2 = 2 + v_2(4) = 4` by `pow_two_sub_one` (`1 + 2 + 2 − 1`); `(k−1)/v_2 = 1, –, 1, –` | true | none |
| §3.3 twin index | weight 3 and 2; weight 5 | `i + i′ = 1` (impossible), `i + i′ = 2` so `i = i′ = 1` | true | none |
| §3.4 level-one refinements | `Δ` mod 5 and mod 7; `Γ_0(2)` | `τ(n) ≡ nσ_1(n) mod 5`: Frobenius eigenvalues `2, 4`, ratio `2^{±1}`, `2 ≡ 2⁵`, `3 ≡ 2³`; prime-to-5 part of `ord(ζ)` is 4, prime-to-7 part divides 3: incompatible; level 2 can be ordinary | true | none |
| §3.6 moving within `X_i` | `n = 2`; ratio `−1` at `n = 3` | `n = 2` is modularity; `−1` not 3-regular, excluded | true | none |
| §3.7 ping-pong | `i = 1` | `m_π = 2` (`2³ = 8 > 5`, `2² = 4 ≯ 5`), `k′ = 9`, `s(z′) = 2 < 7/2`, `i′ = 8/2 − 1 = 3 = 2² − 1`, twin slope `9 − 1 − 2 = 6 = 3·2`; general: `i′ = (2i + 2^{m+1} − 2)/2 − i = 2^m − 1` | true | none |
| §4.4 depth-zero types | `q = 3`; `θ = 1`; `q ≡ 1 mod p` | `dim τ(v) = 6`; `|U_3(𝔽_3)| = 27·4·8·28`, `dim λ = (q+1)(q²−1) = 32`; `−R_C(1)` of degree `−1 + 6 + 27 = 32`, reducible; `|C| = q³ + 1 ≡ 2 mod p` | true | none |
| §4.10 Kazhdan–Lusztig modules | `n = 7`; `n = 9`; recursion `k = 4, 5` | `1 + 7 = 8 = 2 + 2 + 4`; `L_4 = [1,0,2,1] + [1,2,0,1]`, `jY_4 = L_4 + 2[1,2,1,0] + prepend(2, jY_3)` has `11` terms; `dim Z_4 = 2`, `dim Y_5 = 16`, `dim Z_5 = 5` | matches ct17 Thm 2.5 lines 447–468 | none |
| §4.12 endoscopic signs | `m = 5`; `m = 3` with printed and corrected exponent of `X` | shuffles of `(2,1)` with `(1,0)`: `[2,1,1,0]×2, [2,1,0,1], [1,2,1,0], [1,2,0,1], [1,0,2,1]`; `jY − jX + jZ = 4[2,1,1,0] + 2[2,1,0,1] + 2[1,2,1,0] + 2[1,2,0,1] + 2[1,0,2,1]`, count `12 = 11 − 1 + 2`; `m = 3`: `2[1,0,1] + 4[1,1,0]` with `[1,0,−1]`, not with the printed `[1,0,1]` | true; ct17 Thm 3.3(i) misprint confirmed | none (source issue) |
| §5.6 counting | `s = 0`, `l > 5` and `l = 5` | `4/2 = 2` and `4`; `2/2 = 1` and `2` | true | none |
| §6.2 deformation data | `n = 3`, `[L⁺ : ℚ] = 2`; `X = ∅`; Steinberg ring present | bound `1 + 6 = 7`; no `P_D → 𝕋_D` claimed with Steinberg rings (ct17 line 2029, nt21 Lemma 6.6) | true | none |
| §6.8 lifting from a long block | `n_1 = n_2`; `l = 3`; `N = 0` at `w_0` | excluded by (5); excluded by (4); (6) alone does not force Steinberg, (7) supplies it | matches ct17 Thm 5.7 | none |
| §7.1 `σ_0` | `a_5`, `a_3`, `a_4`, `a_2` | `(2+i)² = 3 + 4i`, `(3+4i)² = −7 + 24i`, sum `−14`; `a_3 = 0`; `a_4 = 16`; `(1+i)⁴ = −4` | matches the `q`-expansion | none |
| §7.2 residual powers | `n = 3`; `n = 1` | `48·3! = 288`, `577 = 2·288 + 1` prime (`289 = 17²`); `χ_1χ_1^c = ε^0` | true | none |
| §7.3 weight-5 seed | Diamond's criterion at `q ≡ 3 mod 4` | `a_q² = 0 ≡ δ(q) q³ (q+1)² mod p` iff `q ≡ −1 mod p` | true | none |
| §7.4 defect of the printed rank-two block | `r = r_τ|_{G_{F_0}} ⊗ ω_1ω_0^{2k}` | `r^c = r_τ ⊗ ω_1 ω_0^{−2k} ε^{6k}`, `r^∨ = r_τ ⊗ ω_1 ω_0^{−2k} ε^{8k} δ`, so `r^c ≅ r^∨ ⊗ ε^{−2k} δ_{K/ℚ}`; `q_1` splits in `K` (its Frobenius lies in the image of `G_K`, nt21 line 4204) and is inert in `F_0/F_0^+` (line 4245), so `K ⊄ F_0` and `δ|_{G_{F_0}} ≠ 1` | the README's analysis is right; genuine source error | none (source issue) |
| §7.5 `TS_{2^r m}` | `n = 1`; `n = 4`; `n = 6` | `TS_1` with `Π = 1`; two doublings; `TS_6` needs `TS_3`, supplied only by §7.4's hypothesis or §14.1 | true | none |
| §8.2 `n`-regular congruence | `n = 3`, `k = 2`; Fontaine–Laffaille range | `p > max(8, 4)` so `p ≥ 11`; `(n−1)(k−1) ≤ (n−1)k − 1 ≤ p − 2` | true | none |
| §9.1 setting | `n = 2`; `n = 10`; `p = 3` | `p^a > 5`: `𝔽_7` yes, `𝔽_5` no; `p^a > 19`: `𝔽_{23}, 𝔽_{25}` yes, `𝔽_{19}` no; `3 < 5` forces `a ≥ 2` | true | none |
| §9.4 level `V_1(Q; N)` | `n = 2, 3` | exponents `1, −1` and `1, 0, −1` | true | none |
| §9.5 patching, `p > 2` | dimension count | `dim W_∞ = q + 4|S ∪ S_∞| = dim R^{loc}[[X_1..X_g]]` with `g = q + |S ∪ S_∞| − 1` and `dim R^{loc} = 1 + 3[F:ℚ] + 3|S|` (nt26 line 1297; nt21b line 604) | true | none |
| §10.3 seasoning | `n = 3` | `t > 48`: `49 = 7²`, `51 = 3·17`, so `t = 53`; `q + 1 = 159` gives `158` (even), `q + 1 = 212` gives `211` prime | true | none |
| §11.2 companion | `r = 2`; determinant | `{0,1} + {0,2} = {0,1,2,3}`; `ε̄^{−2}ε̄ = ε̄^{−1} = det r̄_π` | true | none |
| §12.2 torsion-semistable points | `r = 1`; interval | twist of the rank-two trace; `[a, b]` depends on `s` and `X^{−1}Y^{1−r}` only (nt26 lines 1315–1317) | true | R05 (label only) |
| §12.4 maximal ideal generator | `r = 1`, `i = 2` | corrected `η_1η_2 = αβγ_1²`; printed `αβγ_1` | README's correction right | none (source issue) |
| §13.3 companions | `K_π = ℚ`; `r = 2` on a diagonal `SL_2(q)` | `Γ_π` trivial, `B = 1`; `Std ⊗ Std = Sym² ⊕ 1` reducible, which is why the fields must be almost disjoint | true | none |
| §13.4 propagation | regular semisimple element | `4r − 2` forbidden values, `q > 4r` suffices; the Check's `x^{±1}y^{r−1−2j}` has the slots swapped | Check wrong as written | R07 |
| §13.5 residual witness | `r = 1`; HT weights | coefficient conjugate of `π`; `{0,1} + {0,2,…,2r−2}` distinct | true (residual form) | none |
| §13.10 induction | `n = 6, 7, 11, 12` | `p = 5, r = 1`; `p = 5, r = 2`; `p = 7, r = 4` (only prime in `(5.5, 11)`); `p ∈ {7, 11}`; Bertrand at `⌊n/2⌋`: `⌊n/2⌋ < p ≤ 2⌊n/2⌋ ≤ n` with `p ≠ n` for even `n > 2` | true | none |

**Supplier citations resolved** (headings dumped at each open head into `scratch/suppliers/`):
ModularityAndLanglandsExtensions §§0.2, 1.1, 1.7, 1.10–1.15, 2.13, 3.12, 3.15, 3.16, 4.1–4.13,
4.15, 4.20, 4.22, 4.23, 4.29–4.37 (all present; §4.23's two paragraphs match the README's split);
EndoscopicTransferAndUnitaryTraceComparison §§2.8, 2.10, 2.11, 2.14, 2.15, 4.9, 4.10, 6.4, 6.9,
6.10, 6.24, 6.26, 6.27, 6.29, 11.2, 13.1, 13.3–13.5; SmoothRepresentationsOfLocalGroups SR.1.4,
SR.1.5, SR.2.1–2.3, SR.3.1–3.4, SR.4.4; LocalGaloisDeformationRings §§F.1.5, F.1.9, F.2.11, 1.1,
1.4, 1.10, 1.18, 2.13, 2.15, 2.18, 2.24, 2.26, 2.27, 6.10, 8.12, 8.14; GlobalGaloisDeformations
Layer G7 §§8.1, 8.3–8.6, and §§4.6, 4.11, 5.3–5.5, 5.7; DeformationAndDerivedPatchingAlgebra §§5.5,
5.6, 6.1, 6.7, 9.2 and Layer 6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.4.20,
R07.5.10, R07.5.11; GL2ModularityLifting §§2.5, 2.8, 3.1–3.7, 6.1, 6.6, 6.7; PadicFamilies §§2.8,
2.10, 2a.4, 2a.5, 2a.13, 2a.14, 5.8; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1, 1.3, 1.4,
1.5; PadicHodgeTheory §§4.4, 5.3; PhiGammaModulesAndIwasawaCohomology §7.5;
PotentialModularityAndCompatibleSystems §§9.2, 10.10; SerreWeightAndLevelOptimisation §§2.4, 3.2,
6.9, 6.11; ArithmeticGaloisRepresentations §§1.8, 3.3, 3.6, 4.4, 7.1, 7.6, 7.8, 7.9, 7.10;
ArithmeticGaloisDuality §R02.3.5; AutomorphicGaloisRepresentations §§1.5, 2.3, 6.2, 7.4, 7.5;
AutomorphicGaloisRepresentationsPartII AG2.3, AG2.6; ClassicalSerreModularity Layer R27.1;
GL2AutomorphicRepresentationsAndTransfer §§R16.3.1–R16.3.8; AutomorphicLFunctionsAndLocalFactors
AL.2.4 "Global Godement–Jacquet theory" (entire for `n ≥ 2`); CompletedCohomologyAndLocalGlobalCompatibility
§0.7; AdicSpacesPartII §R1.9 and AdicSpacesPartIII §R2.9 (main); ReductiveGroupsPartII §§RG2.1.3,
RG2.3.3, RG2.4.1, RG2.4.2 (main); Chebotarev Layer 10 and RepresentationTheory/CharacterTheory
Layers 3, 9 (main); ClassFieldTheory Layers 11–14 (main, the plan's anchors). The three that do not
resolve are R01–R03. Every supplier is earlier in the merge order; no `*Needs:*` line, supplier row
or gap names a later roadmap.

**Declared gaps.** All thirteen have a named supplier earlier in the merge order, the same slug in
`plan.json` and the README, and a `needs` sentence with hypotheses. Checked each against the
supplier's current head: PotentialAutomorphyInfrastructurePartII 8.20 is the strong-primitivity
form (built on §8.7) and Layer 3 is for odd `l`, so both gaps on it stand; AdicSpacesPartV Layer 1
has no field-extension statement; GlobalGaloisDeformations G7 has no tensor Taylor–Wiles primes;
DeformationAndDerivedPatchingAlgebra Layer 6 has no formal torus; FiniteFlat R07.4 has no torsion
form of Raynaud's embedding; GL2ModularityLifting Layer 3 has no Weston/slope count;
SerreWeightAndLevelOptimisation Layer 2 has no Diamond–Taylor non-optimal levels;
EndoscopicTransfer §2.11 has no Kazhdan–Varshavsky and §11.2 no Mœglin; SmoothRepresentations
SR.1.5 keeps a splitness hypothesis; CompletedCohomology §0.7 has none of Thorne 2024 §§3–6;
CharacterTheory has no Deligne–Lusztig induction. None asks for what is already provided.

**Ownership.** The Kazhdan–Lusztig classification (§4.9) is also stated at §7.4 of the open
SmoothRepresentationsOfLocalGroupsPartII, which is later in the merge order (line 310 against 272),
so ownership stays here by the moves-down rule; that roadmap should cite §4.9 when it merges. The
pseudocharacter spaces of Layer 0, the twin involution, the seasoned predicate and the ping-pong
appear in no other roadmap on main or at the open heads (grep over the index); the parent only
states them. Ownership against open pull requests whose files this brief does not give was not
checked beyond the index.

## Not verifiable

- `kl87` Theorem 7.12 and §8, `bbm82` Théorème 3.1.1, `kw09` Proposition 2.5: paywalled,
  recorded `uncertified`; cited by locator only. R05 is about the description of bbm82 3.1.1, which
  nt21b line 324 and the supplier's §R07.1.40 fix without the text.
- nt21 Theorem 6.1 hypothesis (4) (`[F_ṽ : ℚ_p] > n(n−1)/2 + 1`, p. 76) and nt21b Lemma 2.9's bound
  `q ≥ |S ∪ S_∞| − 2` (p. 18) were not opened; they are outside the sample and no finding touches
  them.
- The socle claim after ct17 (3.9) (the README's repair in §4.12, that `Y` also embeds): plausible
  from the exponent `[1,0,2,1]` of `jY`, not fully recomputed; it is covered by the declared gap on
  EndoscopicTransferAndUnitaryTraceComparison §11.2.

## Source issues

- **Error** in nt21 at proof of Proposition 7.4, p. 88: the source takes the rank-two block
  `π_2 = τ_0 ⊗ |·|^{(n−2)/2} ιω_1ω_0^{n−1}` as a conjugate self-dual input to Theorem 4.1; it should
  be a block whose Galois representation `r` satisfies `r^c ≅ r^∨ ε^{−1}`, whereas this one has
  `r^c ≅ r^∨ ε^{−2k} δ_{K/ℚ}` with `δ_{K/ℚ}` nontrivial on `G_{F_0}`; affects the proof (odd rank
  of Theorem 7.1; the even-rank case and the Hilbert route are unaffected).
- **Misprint** in nt21 at Theorem 4.1(4), p. 60: the source attaches `n_2 = 2` to `T_2` and
  `n_2 = n − 2` to `T_3`; it should be `n_1`, matching the data (c)–(d); affects nothing.
- **Misprint** in ct17 at Theorem 3.3(i), p. 21: the source gives `X` the exponent `[1, 0, 1]` for
  `m = 3`; it should be `[1, 0, −1]` as in Theorem 2.5 and the endoscopic identity; affects nothing.
- **Misprint** in ct17 at §3.5, p. 27 (after Proposition 3.7's statement): the source writes
  "`ε_1(X)` or `ε(Z) = −1`"; it should be `ε_1(Z)`; affects nothing.
- **Gap** in nt26 at Lemma 5.7(2) and its use, pp. 41–42: the source proves irreducibility of
  the tensor over `F` and then invokes adequacy over `F(ζ_t)` for potentially diagonalizable
  lifting; it should prove irreducibility over `F(ζ_t)` (Goursat and the perfect product supply it);
  affects the proof.
- **Misprint** in nt26 at proof of Lemma 5.8, pp. 43–44, items (7)–(9): the source checks the
  hypotheses at `ι`; it should check them at `ι_l`; affects nothing.
- **Misprint** in nt26 at §4, p. 32, generators of `𝔪_{G,Q}` for `r + 1 ≤ i ≤ n`: the source omits
  the factor `∏_{j=1}^{r} γ_{v,j}`; it should be the product of the first `i` entries of
  `(αγ_1, …, αγ_r, βγ_1, …, βγ_r)`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ce205f359577bda76e5215ddf51b1b225c6f4a86", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII", "model": "fable", "worker": "chris-x19"} -->
