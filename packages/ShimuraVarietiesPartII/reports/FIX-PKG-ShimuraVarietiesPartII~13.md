# FIX-PKG-ShimuraVarietiesPartII~13

Findings settled: the two findings of the round 12 review (REV-PKG-ShimuraVarietiesPartII~12). Both were correct and both are applied.

## REV-PKG-ShimuraVarietiesPartII~12/F01 (P2) — applied

Old: §5.5 compared [b_(x_3)], ordinariness and I_(x_3) on S_(K_3), but nothing defined them for A_3. New: §5.5 names the models and maps, defines i_3 into the Siegel model of (V_3, V_1,Zp⊕V_2,Zp), forms tensors through the normalized image N_3, and defines the Layer 4 objects for ι_3. §5.6 and §5.9 now cite this.

**Verification.** The finding is correct. Before this round, §5.3 built S_(K_3) from the good embedding on (V_3⊗_Q K′)^r, and §5.4 covered only strongly acceptable triples. KZ forms A_3 by pullback along S_(K_3)→S_(K′_3)(GSp(V_3)), which factors through the pair moduli S_H (KZ line 1963–1966). This is not the embedding that defines S_(K_3), which KZ builds "from a good Hodge embedding as in Lemma 4.3.8" (KZ line 1921, 1831–1833). KZ forms I_(x_3) "in the same way as §4.4.5" (KZ line 1971–1972). The justification that crystalline tensors do not depend on the lift is given only for A_2 (KZ line 1870–1872). The finding's counterexample also holds: with K=Q_p, K′=Q and r=2, the defining abelian scheme is isogenous to A_3×A_3.

**Edits, with what goes beyond the proposed text.**

- §5.5, theorem. A first sentence now names S_(K_1) (the auxiliary model of §2.6 for its very-good ι_1 with lattice V_1,Zp), S_(K_2) (§3.8 with ι_2 and V_2,Zp of §5.4), S_(K_3) (the normalized Hodge model of the good embedding of §5.3), the levels K_i=G_i°(Z_p)K_i^p, and j_1, j_2. The README never defined ι_1, S_(K_1), S_(K_3), j_1 or j_2, and the proposed text used them.
- §5.5, new paragraph, as proposed. It adds:
  - i_3 is spelled out as "pair moduli, then product with product polarization and level", landing in the single-lattice Siegel model of §0.1. That lattice lies in its dual because V_1,Zp does (corrected Hodge setup) and V_2,Zp is self-dual.
  - §4.3 is added to the list of definitions, since the ordinary locus is a stratum.
  - New sentence: at a lift of x_3, the pulled-back G_1- and G_2-tensors are the étale tensors of A_1 and A_2 at its images. So their crystalline tensors at x_3 are those of x_1 and x_2 (lift-independence on S_(K_1), §0.5, and on S_(K_2), §5.4). The proposed text took this step without saying so.
  - "A tensor frame … adapted to the product" becomes "A tensor frame … preserves the projections", because every frame does.
- §5.5 locator: as proposed, plus "§4.4.1, p.42, for the factorization through the normalized image".
- §5.5 *Needs:* adds §0.1, §0.4, §0.5, §0.6, §2.6, §4.1, §4.2, §4.3, §4.6, §4.8, §4.9, §4.10, §4.11, §4.12 and §4.13. All of them are already in the Layer 5 Dependencies.
- §5.5 proof sketch: one sentence on forming the A_3 objects through the normalized image of i_3.
- §5.5 Remark: adds the finding's instance as a negative control. With K=Q_p, K′=Q and r=2, the defining embedding is ι_3⊕ι_3, its abelian scheme is isogenous to A_3×A_3, and Layer 4 read for it would act on A_(3,x_3)². So every Layer 4 object on S_(K_3) is formed for ι_3.
- §5.6: replaced the I_(x_2) clause exactly as proposed.
- §5.9: the proof sketch gains "(their ordinariness on S_(K_3) is that of §5.5)", as proposed. Its *Needs:* gains §5.5, which that parenthesis now uses.

**Pattern repaired.** I searched every use of [b_x], the ordinary locus, I_x and Newton strata.

- Layer 4 itself: Hodge models with their defining embedding.
- §§5.7–5.8: special Hodge models with their own embedding.
- §5.4, §§5.9–5.10, §§6.1, 6.3 and Layer 7: the strongly acceptable model through ι_2 (§5.4).
- §§5.5, 5.6 and 5.9: the matched model S_(K_3), now through ι_3.

No other model carries these objects. §5.3's "ordinary classes correspond under the derived maps" is a statement about B(G_3)→B(G_i), not about points, and is unchanged.

## REV-PKG-ShimuraVarietiesPartII~12/F02 (P3) — applied

Old: §2.3 used "Res_(F0/Q) H^sharp" and "quasi-tame" without defining them. New: §2.3 defines F, H and H^♯ (KPZ §§7.2.1–7.2.2) and states G_der≅Res_(F/Q)H^♯. Conventions defines quasi-tame (KPZ Definition 3.1.4, p.16), with a new Check. The KPZ locator gains Definition 3.1.4 and §§7.2.1–7.2.2.

**Verification.** KPZ line 3381 gives G_2^ad≅Res_(F/Q)H with H absolutely simple, and F is totally real (KPZ line 3363). KPZ line 3360–3362 and 3373–3374 define H^♯, KPZ line 3495 gives G_der≅Res_(F/Q)H^♯, and KPZ line 713–715 defines quasi-tame. Before this round, a search of the README found F0 and H^sharp only in §2.3, and "quasi-tame" only in §§2.3 and 2.5.

**Beyond the proposed text.**

- The local field of the excluded type-A factor is renamed F′, because F now denotes the totally real field.
- §2.3 now records that its (NE) hypothesis (KPZ line 2706–2707) excludes type D^H for H, so H^♯=H^sc there. Here is why. The noncompact real places of H are all of type D^R or all of type D^H (KPZ line 3368–3369). There is at least one noncompact place, and it gives a factor with nontrivial μ that is local type D^H (KPZ line 1341, 2919) exactly when H has global type D^H.
- The quasi-tame convention also says that a group over Q (such as Z_G^c) is quasi-tame when its base change to Q_p is, which is how §§2.3, 2.5 and KPZ Proposition 7.2.10(4) use the word.
- A new Conventions Check covers quasi-tameness:
  - Positive cases: Res_(Q_9/Q_3)G_m, and the norm-one torus of Q_3(√3).
  - Negative case: the norm-one torus of Q_3(∛3) is not quasi-tame. Its Galois image is S_3, of order 6, which acts faithfully on the rank-two character lattice, and its splitting field is wildly ramified. Any decomposition with a nontrivial Weil restriction or product would have Galois image of order dividing 8.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §5.5, level of i_3 at p | K_3,p=G_3°(Z_p) | G_3°→G_1°⊂GL(V_1,Zp); G_3°→G_2°→GSp(V_2,Zp) (KZ line 1763–1764) | K_3,p fixes V_1,Zp⊕V_2,Zp | none |
| §5.5, i_3 to the single-lattice Siegel model | Polarization degree; similitude scalar of ε_1⊕ε_2 | [V_3^∨:V_3]=[V_1^∨:V_1]·[V_2^∨:V_2]=[V_1^∨:V_1], as V_2,Zp is self-dual. A common scalar c_1=c_2 gives a similitude. For diag(2,1)⊕diag(3,1), c=2 on one plane and c=3 on the other, so there is no similitude (§5.2 Check 2). | Map defined only because multipliers match. KZ line 1925–1926 lists the map to GSp(V_3) for i=3. | none |
| §5.5, factorization through N_3 | S_(K_3) normal and flat; generic map induced by ι_3 | A function on the preimage of an affine of the closure Z, integral over O(Z) and regular on the generic fibre, is regular on the normal S_(K_3) | Holds (KZ line 1870–1872 for A_2; same argument) | none |
| §5.5, reflex base | E_3 versus E′=E_1E_2 | E_i⊂E_3 by functoriality of reflex fields; E_3⊂E′ (KZ line 1910) | E_3=E′, so no base change, and normality of S_(K_3) over O_E′ is not in question | none |
| §5.5, enlarged tensor family | The projections e_1, e_2; the G_1- and G_2-families pulled back to V_3^⊗ | G_3 acts on V_i through G_i, so it fixes them, and the stabilizer stays G_3. For V_1≅V_2 with ψ_1=ψ_2, the swap [[0,1],[1,0]] preserves ψ_1⊕ψ_2 but sends e_1 to e_2. | Excluded, as §5.2 Check 3 requires | none |
| §5.5, crystalline tensors at x_3 | Lift x̃_3, with images j_1(x̃_3) and j_2(x̃_3) | Étale tensors of the s^(1) family on A_3=A_1×A_2 are the pullbacks of those of A_1 (equal Betti tensors on Sh_(K_3)). The comparison commutes with products. Lift-independence on S_(K_1) (§0.5) and on S_(K_2) (§5.4). | Tensors at x_3 for the pulled-back families are those of x_1 and x_2 | sentence added |
| §5.5, frame comparison | Frame φ of D(A_(3,x_3)) | φ takes e_1 to the crystalline projection, so φ=φ_1⊕φ_2 with φ_i G_i-frames, and ρ_3∨(b_3)σ=(ρ_1∨(b_1)σ, ρ_2∨(b_2)σ). For ordinary b_1=b_2=diag(5⁻¹,1) at p=5, b_3=(b_1,b_2), with ν equal to the average of μ_3⁻¹. | [b_(x_3)]↦[b_(x_i)]; ordinary iff ordinary | wording "adapted" → "preserves the projections" |
| §5.5, existence of the ordinary class for G_3 | G_3^ad=G_2^ad, a product of Res of split groups (§2.1) | G_3,Qp quasi-split ⇒ [b]_μ3 exists (KZ line 457, Lemma 2.2.8(1)) | §4.6 applies on S_(K_3) | none |
| §5.5 Remark | K=Q_p, K′=Q, r=2; GU(1,1) of Q(i) on both sides, dim V_1=dim V_2=4 | dim V_3=8, so dim A_3=4. The defining module V_3⊕V_3 has dimension 16, so its abelian scheme has dimension 8=2·dim A_3. | Two readings differ, so ι_3 is fixed | Remark added |
| §5.6 exact sequence, degenerate G_1=G_2=GU(1,1) of Q(i) | G_3=(G_1×_(G^ad×G_m)G_1)° | g′=gz with z∈Z_(G_1) and c(z)=1. So C_1=ker(Nm:Res_(Q(i)/Q)G_m→G_m)=U(1), of dimension 1. GU(1,1)_C≅GL₂×G_m has dimension 5 and rank 3, so rank G_3=3+1=4, and dim I_(x_3)=dim I_(x_1)+1. | Consistent with full rank (§4.13) | none |
| §5.9 proof sketch | x_2=j_2(x_3) ordinary | §5.5 gives x_3 and x_1 ordinary; Theorem 4.1.11 then applies at x_1 (KZ line 1996–1999) | Holds | parenthesis, *Needs:* §5.5 |
| §2.3, F and H | GU(1,1) of Q(i), form diag(1,−1) | F=Q, H=PU(1,1)≅PGL₂, H^♯=SL₂≅SU(1,1)=G_der | Matches §2.1 Check | none |
| §2.3, H^♯ in type D | Type D^R versus D^H at the noncompact places | D^R: H^♯=H^sc. D^H: H^♯ is the image of Spin in SO at those places, a proper quotient of H^sc. (NE) excludes D^H (KPZ line 2706). | H^♯=H^sc under §2.3's hypothesis | sentence added |
| §2.3, Q-simple adjoint ⇒ Res of absolutely simple | Q-simple adjoint group | Res_(F/Q)H with H absolutely simple, F the centre field, totally real for Shimura data (KPZ line 3363, 3381) | Holds | none |
| Conventions, quasi-tame | Trivial group; G_m; Res_(Q_9/Q_3)G_m; norm-one torus of Q_3(√3); norm-one torus of Q_3(∛3) | Empty product, one split factor, one induced factor, tame quadratic splitting: all quasi-tame. The cubic case has image S_3 of order 6. Its splitting field contains Q_3(∛3), with e=3=p. A quadratic Res of a rank-one torus has image order dividing 8; two rank-one factors have image in (±1)². | First four yes, last no | Check added |
| Conventions, quasi-tame over Q | Z_G^c of KPZ Proposition 7.2.10(4) | The source applies "quasi-tame" to a Q-torus via its Q_p base change (KPZ line 3501, 3521) | Consistent | clause added |

## Checks run

- Elaboration: `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. `Suggested.lean` is unchanged and declares no name. The `#check @name` comparison therefore has no inputs; I confirmed that the file has 0 declarations, so there was nothing to elaborate.
- Dependency direction (prescribed command, `--movable`), exit 0:

  ```text
  depcheck: 259 roadmaps, 2483 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- Citation resolver on the README: no cross-roadmap citation and no Lean name found nowhere.
- Residue scan of the added lines (LaTeX delimiters, process words, machine paths): no hit.
- Gate failures: none were listed for this round.
- `design/plan.json`: unchanged. No new supplier gap; the 21 slugs, contracts and `gaps` entries are as before.
- Sources: no new source and no fetch. `needs-references.toml` was not written. Every locator above was read in the cached KZ and KPZ texts.

## For the maintainer

- No name that other roadmaps cite changed. No section number changed.
- New notation inside this roadmap: ι_1, ι_3, i_3, N_3, S_(K_1), S_(K_3) and the levels K_i, all introduced in §5.5. The other sections that use them are §§5.6 and 5.9, and both were updated.
- Ownership: the additions are internal to this roadmap's Layer 5 (the matched model and its tensors). The quasi-tame convention restates KPZ's definition and plans no new object. No other roadmap's object is involved.
- The finding is a gap in the source, KZ §4.4.9 (the review's "Source issues" lists it). The README now fills it in the way KZ §4.4.1 does for A_2.
